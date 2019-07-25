<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*,java.sql.*"%> 
<%@page import="java.io.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.*"%>
<%@page import="java.lang.*"%> 
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>

<%!

public static void charSet(String str_kr) throws UnsupportedEncodingException{
  String charset[] = {"euc-kr", "ksc5601", "iso-8859-1", "8859_1", "ascii", "UTF-8"};

  for(int i=0; i<charset.length ; i++){
    for(int j=0 ; j<charset.length ; j++){
      if(i==j) continue;
        System.out.println(charset[i]+" : "+charset[j]+" :"+new String(str_kr.getBytes(charset[i]),charset[j]));
    }
  }
}
 

%>

<%  
String szEmp_Code = request.getParameter("result");

charSet(szEmp_Code );

%> 





















</body>
</html>