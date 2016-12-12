<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <title>Sobre</title>
    </head>
    <body>
    <jsp:include page="/menu.jsp"/>

    <h3>Sobre</h3>
    <p>Informações</p>
    
    <div id="Server">
    Server: <b><%=request.getServerName() %></b><br/>
    Port: <b><%=request.getLocalPort() %></b><br/>
    Session: <b><%=request.getSession() %></b><br/>
    Session: <b><%=session.getId() %></b><br/>
    Date: <b><%=session.getCreationTime() %></b><br/>   
    </div> 
 
    <%@include file="/footer.jsp"%>   
</body>
</html>