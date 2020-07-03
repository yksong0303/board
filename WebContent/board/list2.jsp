<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="common.Connector"%>
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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String creusr = request.getParameter("creusr");
	
	Connection conn = Connector.getConnection();
	String sql = "select num,title,content,credat,creusr from board where 1=1 ";
	if(title!=null && !"".equals(title.trim())){
		sql+= " and title like concat('%',?,'%')";
	}
	if(content!=null && !"".equals(content.trim())){
		sql+= " and content like concat('%',?,'%')";
	}
	if(creusr!=null && !"".equals(creusr.trim())){
		sql+= " and creusr like concat('%',?,'%')";
	}
	
	PreparedStatement ps = conn.prepareStatement(sql);
	int cnt =1;
	if(title!=null && !"".equals(title.trim())){
		ps.setString(cnt++,title);
	}
	if(content!=null && !"".equals(content.trim())){
		ps.setString(cnt++,content);
	}
	if(creusr!=null && !"".equals(creusr.trim())){
		ps.setString(cnt++,creusr);
	}
	
/*	if(title!=null && !"".equals(title.trim())){
		ps.setString(1,title);
		
		if(content!=null && !"".equals(content.trim())){
			ps.setString(2,content);
		}
		if(creusr!=null && !"".equals(creusr.trim())){
			ps.setString(3,creusr);
		}
		
	}else{
		if(title!=null && !"".equals(title.trim())){
			ps.setString(1,content);
	}else{
		if(creusr!=null && !"".equals(creusr.trim())){
		ps.setString(1,creusr);
		}
		
	}
	
	}
*/	
	ResultSet rs = ps.executeQuery();
	%>
	<%=title%>,<%=content%>,<%=creusr%>
	<form>
	
		제목 : <input type="text" name="title"><br> 
		내용 : <input type="text" name="content"><br>
		작성자 : <input type="text" name="creusr"><br>
		<button>검색</button>

	</form>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
			<th>작성자</th>
		</tr>

		<%
			while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getInt("num") + "</td>");
			out.println("<td>" + rs.getString("title") + "</td>");
			out.println("<td>" + rs.getString("content") + "</td>");
			out.println("<td>" + rs.getString("credat") + "</td>");
			out.println("<td>" + rs.getString("creusr") + "</td>");
			out.println("</tr>");

		}
		%>

	</table>

</body>
</html>