<%@page import="common.Connector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//String num = request.getParameter("num");
String title = request.getParameter("TITLE");
String content  = request.getParameter("TEXT");
String user = request.getParameter("user");
Connection conn = Connector.getConnection();
String sql = "insert into user(name,id) ";
sql +="values(?,?)";
PreparedStatement ps = conn.prepareStatement(sql);
//ps.setInt(1, Integer.parseInt(num)); //1번째에 num을 대입하겠다, num의 타입이 String이니 인트값으로 변환해줘야함
ps.setString(1, name); //2번째에 name을 대입하겠다
ps.setString(2, id); //3번째에 id을 대입하겠다
int result = ps.executeUpdate();
%>