<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Content</title>
<link href="./ViewContent.css" rel="stylesheet">
</head>
<body>
<%ResultSet rs=(ResultSet)request.getAttribute("rs");%>
<%try{while(rs.next()){%>
<h4><%=rs.getString(2)%></h4>
<%}}catch(SQLException e) {e.printStackTrace();}%>
<h1>View Content</h1>
    <hr id="hrViewContent">
    <div id="flexContainer" >
        <div id="divViewContentList">View Content List</div>
        <div id="divTable" >
            <table id="tableContent">
                <tr id="trHeader">
                    <th id="columnHeader" style="width:7%">#</th>
                    <th style="width:15%">Title</th>
                    <th style="width:43%">Brief</th>
                    <th  style="width:15%">Created Date</th>
                    <th id="columnAction" style="width:20%">Actions</th>
                </tr>
            </table>
        </div>
        <div id="divNextPreviousPage">
            <form action="ViewContentController" method="post">
                <button class="formatButton"><</button>
                <label id="numberOfPage">1</label>
                <button class="formatButton">></button>
            </form>
        </div>
    </div>
</body>
</html>