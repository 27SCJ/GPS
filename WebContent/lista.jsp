<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>Lista</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>

<h3>Lista</h3>
<p>Registros</p> 
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://bancofiap1.mysql.dbaas.com.br:3306/bancofiap1"
     user="bancofiap1"  password="bancofiap!!!"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM localizacao ORDER BY codigo DESC LIMIT 20;
</sql:query>
 
<table border="1" width="360" bordercolor="black" cellspacing="0" cellspading="0" >
<tr>
   <th>Codigo</th>
   <th>Nome</th>
   <th>Local</th>
   <th>Longitude</th>
   <th>Latitude</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.codigo}"/></td>
   <td><c:out value="${row.nome}"/></td>
   <td><c:out value="${row.local}"/></td>
   <td><c:out value="${row.longitude}"/></td>
   <td><c:out value="${row.latitude}"/></td>
</tr>
</c:forEach>
</table>
 
<%@include file="/footer.jsp"%>  
</body>
</html>