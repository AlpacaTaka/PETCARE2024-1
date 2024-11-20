<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Index</title>
</head>
<body>
<h1><%= "PETCARE PROBAR CRUDS" %>
</h1>
<br/>
<a href="Inicio">Usuario</a>
<a href="PortalAdopciones">Albergue</a>
<form action="MiPerfilCoodinadorServlet" method="GET">
    <input type="hidden" name="action" value="vista">
    <button type="submit">Coordinador</button>
</form>


</body>
</html>