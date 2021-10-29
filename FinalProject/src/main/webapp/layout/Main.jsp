<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><tiles:getAsString name="title"/></title>
</head>
<body>
<header>
	<tiles:insertAttribute name="header"/>
</header>
<div class=""><tiles:insertAttribute name="leftmenu"/></div>
<div class=""><tiles:insertAttribute name="body"/></div>
</body>
</html>