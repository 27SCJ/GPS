<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <title>Registro</title>
    </head>
    <body>
     <jsp:include page="/menu.jsp"/>
        
        <h3>Registro</h3>
        <p>Dado inserido com sucesso!</p> 
        
        <h3>Dados</h3>
        <p><b>Nome:</b><%= request.getParameter("nome")%></p>
        <p><b>Local:</b><%= request.getParameter("local")%></p>
        <p><b>Longitude:</b><%= request.getParameter("longitude")%></p>
        <p><b>Latitude:</b><%= request.getParameter("latitude")%></p>
                
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://bancofiap1.mysql.dbaas.com.br:3306/bancofiap1"
        user="bancofiap1"  password="bancofiap!!!"/>
 
        <sql:update dataSource="${snapshot}" var="result">
        INSERT INTO localizacao (nome, local, longitude,latitude) VALUES ('<%= request.getParameter("nome")%>','<%= request.getParameter("local")%>',<%= request.getParameter("longitude")%>,<%= request.getParameter("latitude")%>);
        </sql:update>
        
        <%@include file="/footer.jsp"%>  
    </body>
</html>