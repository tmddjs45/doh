package com.doh.test;

import java.io.*;
import java.nio.charset.Charset;
import java.util.*;

public class cpTest {


	String javaFileName = "C:\\Users\\ajako\\Desktop\\teststart\\test6.java";
	String command= "javac \"C:\\Users\\ajako\\Desktop\\teststart\\test6.java\" -encoding UTF-8";
	String command1="java -cp C:\\Users\\ajako\\Desktop\\teststart test6";
	String classFileName="C:\\Users\\ajako\\Desktop\\teststart\\test6.class";

	



	public String saveJava(String code) {	
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

	public String runcompile(){ 

		try {
			Runtime.getRuntime().exec("cmd /c "+command);

		}catch(IOException ie) {}
		return runclass();
	}
	public String runclass() {
		String i="";
		StringBuilder result = new StringBuilder();
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		try {			
			BufferedReader br = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec("cmd /c "+command1).getInputStream(),"euc-kr")); 
			while((i=br.readLine())!=null){ 
				result.append(i + '\n'); 			}
		}catch(IOException ie) {}
		System.out.println("런클래스에서 결과 값"+result.toString());
		test(result.toString());
		String resultStr= result.toString();
		return resultStr;
	}

	public void test(String word) {
		System.out.println("여기서부터는 테스트");
		try {
			System.out.println("1"+new String(word.getBytes("utf-8"), "euc-kr"));
			System.out.println("2"+new String(word.getBytes("utf-8"), "ksc5601"));
			System.out.println("3"+new String(word.getBytes("utf-8"), "x-windows-949"));
			System.out.println("4"+new String(word.getBytes("utf-8"), "iso-8859-1"));

			System.out.println("5"+new String(word.getBytes("iso-8859-1"), "euc-kr"));
			System.out.println("6"+new String(word.getBytes("iso-8859-1"), "ksc5601"));
			System.out.println("7"+new String(word.getBytes("iso-8859-1"), "x-windows-949"));
			System.out.println("8"+new String(word.getBytes("iso-8859-1"), "utf-8"));

			System.out.println("9"+new String(word.getBytes("euc-kr"), "ksc5601"));
			System.out.println("10"+new String(word.getBytes("euc-kr"), "utf-8"));
			System.out.println("11"+new String(word.getBytes("euc-kr"), "x-windows-949"));
			System.out.println("12"+new String(word.getBytes("euc-kr"), "iso-8859-1"));

			System.out.println("13"+new String(word.getBytes("ksc5601"), "euc-kr"));
			System.out.println("14"+new String(word.getBytes("ksc5601"), "utf-8"));
			System.out.println("15"+new String(word.getBytes("ksc5601"), "x-windows-949"));
			System.out.println("16"+new String(word.getBytes("ksc5601"), "iso-8859-1"));

			System.out.println("17"+new String(word.getBytes("x-windows-949"), "euc-kr"));
			System.out.println("18"+new String(word.getBytes("x-windows-949"), "utf-8"));
			System.out.println("19"+new String(word.getBytes("x-windows-949"), "ksc5601"));
			System.out.println("20"+new String(word.getBytes("x-windows-949"), "iso-8859-1"));
			System.out.println("21"+new String(word.getBytes("utf-8"), "utf-8"));
			System.out.println("-------------------------------------------------------------");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}





	}

}



