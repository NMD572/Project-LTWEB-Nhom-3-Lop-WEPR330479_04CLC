<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><tiles:getAsString name="title"/></title>
</head>
<style>
#divInline{	
	display: flex;
}
#divBody{
	margin-top: 50px;
	margin-left: 30px;
}
</style>
<body>
<header>
	<tiles:insertAttribute name="header"/>
</header>
<div id="divInline">
<div><tiles:insertAttribute name="leftmenu"/></div>
<div id="divBody"><tiles:insertAttribute name="body"/></div>
</div>
</body>
</html>