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
    <p>Formulário</p>
    <form action="insert.jsp" method="POST">
    <table>
    <tr><td>Nome:</td><td><input type="text" name="nome"></td></tr>
    <tr><td>Local:</td><td><input type="text" name="local" /></td></tr>
    <tr><td>Longitude:</td><td><input type="text" name="longitude"></td></tr>
    <tr><td>Latitude:</td><td><input type="text" name="latitude"></td></tr>
    <tr><td></td><td><input type="submit" value="Enviar" /></td></tr>
    </table>
    </form>
    
    <%@include file="/footer.jsp"%>  
    </body>
</html>