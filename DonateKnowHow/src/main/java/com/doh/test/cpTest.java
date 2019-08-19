package com.doh.test;

import java.io.*;
import java.nio.charset.Charset;
import java.util.*;
import java.util.concurrent.TimeUnit;

public class cpTest {
	//	String javaFileName = "C:\\Users\\ajako\\Desktop\\teststart\\test6.java";
	//	String command= "javac \"C:\\Users\\ajako\\Desktop\\teststart\\test6.java\" -encoding UTF-8";
	//	String command1="java -cp C:\\Users\\ajako\\Desktop\\teststart test6";
	//	String classFileName="C:\\Users\\ajako\\Desktop\\teststart\\test6.class";

	//window command//
	String path = this.getClass().getResource("").getPath();
	String javaFileName;
	String classFileName;
	String javaccommand;
	String javacommand;
	Runtime rt = Runtime.getRuntime();
	Process pc = null;
	
	
	public void checkOS() {
		String osName = System.getProperty("os.name");
		System.out.println(" - OS Name: " + osName);
		if(osName.toLowerCase().startsWith("window")) {
			System.out.println("윈도우로떨어짐");	
			javaFileName=path+"test.java";
			classFileName=path+"test.class";
			javaccommand="cmd /c javac"+path+"test.java -encoding UTF-8";
			javacommand="cmd /c java -cp "+path+" test";
			

		}else {
			System.out.println("check에서 윈도우아님");
			javaFileName=path+"test.java";
			classFileName=path+"test.class";
			javaccommand="/bin/sh-c"+"javac"+path+"test.java -encoding UTF-8";
			javacommand="/bin/sh-c"+"java -cp "+path+" test";
			
		}

	}
	
	





	public String saveJava(String code) {	//.java저장하는메소드
		checkOS();
		System.out.println("#####path : "+path);
		File file = new File(classFileName);
		if(file.exists()) {
			System.out.println("##클래스파일존재----"); 	
			if(file.delete()) {
				System.out.println("##클래스파일삭제성공----");
			}else {
				System.out.println("##클래스파일삭제 실패---");
			}
		}else {
			System.out.println("##클래스파일없음----");
		}
		try{           	
			BufferedWriter fw = new BufferedWriter(new FileWriter(javaFileName,false));
			fw.write(code);
			fw.flush();
			fw.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return runcompile();
	}






	public String runcompile(){   //저장된.java를 컴파일하는메소드

		try {
			rt.exec(javaccommand);

		}catch(IOException ie) {}
		return runclass();
	}


	public String runclass() {// .class파일을 실행하는 메소드 ,,
		
		ReadStream s1=null;
		ReadStream s2=null;
		
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		try {
		pc = rt.exec(javacommand) ;  
		s1 = new ReadStream("stdin", pc.getInputStream ());
		s2 = new ReadStream("stderr", pc.getErrorStream ());
		s1.start ();
		s2.start ();
		try {
			Thread.sleep(3000);
			pc.destroyForcibly();
			System.out.println("##destroy");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}     
		} catch (Exception e) {  
		e.printStackTrace();  
		} finally {
		    if(pc != null)
		        pc.destroy();
		}
		if(s1.returnRerult()!=null) {
			return s1.returnRerult();
		}else {
			return s2.returnRerult();
		}
	}
}






class ReadStream implements Runnable {
	String name;
	InputStream is;
	Thread thread; 
	String result="";
	String i;
	public ReadStream(String name, InputStream is) {
		this.name = name;
		this.is = is;
	}       
	public void start () {
		thread = new Thread (this);
		thread.start ();
	}       
	public void run () {
		try {
			BufferedReader br = new BufferedReader (new InputStreamReader (is,"euc-kr"));  
			while((i=br.readLine())!=null){ 
				result+=(i + '\n'); 
			}
			System.out.println("##resutlddddddddddddddd"+result);
			
			
			is.close ();    
		} catch (Exception ex) {
			System.out.println ("##compire err"+ex);
			ex.printStackTrace ();
		}
	}
	public String returnRerult() {
		return result;
	}
}


