<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
Class.forName("org.mariadb.jdbc.Driver");
String url = "jdbc:mariadb://localhost:3306";
String user = "test";
String pwd = "test";
Connection conn = DriverManager.getConnection(url, user, pwd);
}catch(Exception e){
	out.println(e);
	
}
%>
</body>
</html>