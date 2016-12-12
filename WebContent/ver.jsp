<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>Lista</title>
 	<style>
      #map {
        height: 400px;
        width: 400px;
       }
    </style>
    
</head>
<body>
<jsp:include page="/menu.jsp"/>

<h3>Localização no mapa</h3>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://bancofiap1.mysql.dbaas.com.br:3306/bancofiap1"
     user="bancofiap1"  password="bancofiap!!!"/>
 
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM localizacao where codigo=<%=request.getParameter("codigo")%> ORDER BY codigo DESC LIMIT 20;
</sql:query>
 
<table border="1" width="360" bordercolor="black" cellspacing="0" cellspading="0" >

<c:forEach var="row" items="${result.rows}">
<tr>
   <td>
   
	   Código: <c:out value="${row.codigo}"/> <br/>   
	   Nome:   <c:out value="${row.nome}"/> <br/>
	   
	   <div id="map"></div>	   

	    <script>
	      function initMap() {
	        var uluru = {lat: ${row.latitude}, lng: ${row.longitude}};
	        var map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 17,
	          center: uluru
	        });
	        var marker = new google.maps.Marker({
	          position: uluru,
	          map: map,
	          title: 'Uluru (Ayers Rock)'
	        });
	
	         var contentString = '<div id="content">'+
	      '<div id="siteNotice">'+
	      '</div>'+
	      '<h1 id="firstHeading" class="firstHeading">${row.nome}</h1>'+
	      '<div id="bodyContent">'+
	      'Código: ${row.codigo} <br>'+
	      'Local: ${row.local} <br>'+
	      'Latitude: ${row.latitude} <br>'+
	      'Longitude: ${row.longitude} <br>'+
	   
	      '</div>'+
	      '</div>';
	
	       var infowindow = new google.maps.InfoWindow({
	          content: contentString
	       });
	
			
			 marker.addListener('click', function() {
	         infowindow.open(map, marker);
	     });
			
	      }
	    </script>	   
   
   </td>
   
</tr>
</c:forEach>
</table>

<br>

<a href="index.jsp">Voltar</a>
 
<%@include file="/footer.jsp"%>  

    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYKNEOW16rVUbbIz-DB_W5xNAS2Vw4tzU&callback=initMap">
    </script>
</body>
</html>