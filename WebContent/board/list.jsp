<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.Connector"%>
<%@page import="java.sql.Connection"%>
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
	String search = request.getParameter("search");
	String searchStr = request.getParameter("searchStr");
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
	Connection con = Connector.getConnection();
	String sql = " select num, title, credat, cretim, creusr from board ";

	if (search != null && !"".equals(search)) {
		sql += " where ";
		if("1".equals(search)){
			sql +=" title";
		}else if("2".equals(search)){
			sql +=" title like concat('%',?,'%')";
			sql +=" or content like concat('%',?,'%')";
		}else if("3".equals(search)){
			sql +=" creusr";
		}else if("4".equals(search)){
			sql +=" num";
		}else if("5".equals(search)){
			sql +=" credat";
		}
		
	}
	
	PreparedStatement ps = con.prepareStatement(sql);
	if (search != null && !"".equals(search)) {
		ps.setString(1,searchStr);
		if("2".equals(search)){
		ps.setString(2,searchStr);
		}
	}
	ResultSet rs = ps.executeQuery();
	%>
	<form>
		<select name="search">
			<option value="1">제목</option>
			<option value="2">제목+내용</option>
			<option value="3">글쓴이</option>
			<option value="4">번호</option>
			<option value="5">등록일</option>
		</select> <input type="text" name="searchStr">
		<button>검색</button>
	</form>



	<a href="/board/board_insert.jsp"><button>게시글 등록</button></a>
	<form action="/board/board_insert.jsp">
		<table border="1">
			<tr>

				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성시간</th>
				<th>글쓴이</th>
			</tr>


			<%
				while (rs.next()) {
			%>
			<tr>

				<td><%=rs.getInt("NUM")%></td>
				<td><%=rs.getString("TITLE")%></td>
				<td><%=rs.getInt("credat")%></td>
				<td><%=rs.getString("cretim")%></td>
				<td><%=rs.getString("CREUSR")%></td>
			</tr>
				<%
					}
				%>
			
		</table>
	</form>
</body>
</html>