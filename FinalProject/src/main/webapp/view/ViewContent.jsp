<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Content</title>
</head>
<style>
*{
    box-sizing: border-box;
}
html{
    font-family: Arial, Helvetica, sans-serif;
}
.load5s{
    visibility: hidden;
}
#hrViewContent{
    margin-top: 0px;
    margin-left: 0px;
    margin-bottom: 20px;
    height:0.5px;
    width: 60%;
    border-width:0;
    color:gray;
    background-color:gray
}
#flexContainer{
    width: 60%;
    padding-top:0px;
    padding-left:0px;
    border:groove;
    border-width: 1.5px;
    border-top-width: 0px;
    border-radius: 3px;
}
#divViewContentList{
    margin-bottom: 10px;
    margin-top: 0px;
    margin-left: 0px;
    background-color: rgb(210, 210, 210);
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
table{
    width: 95%;
    margin-left: 2.5%;
    margin-bottom: 5px;
}
table,th,tr,td{
    border:1px gray;
    border:groove thin;
    border-collapse: collapse;
    font-family: Arial, Helvetica, sans-serif;
    text-align: left;
}
tr{
    height: 60px;
}
#trHeader{
    height: 40px;
}
.marginLeftHeader{
    padding-left: 10px;
}
.centerHeader{
    text-align: center;
}
tr:nth-child(even) {
    background-color: rgba(210, 210, 210,0.5);
}
#tableContent td > a{
    text-decoration: none;
    color: green;
}
#divNextPreviousPage{
    margin: auto;
    width: 15%;
    padding-bottom: 5px;
}
.formatButton{
    background-color: green;
    border:none;
    border-radius: 2px;
    color: white;
}
</style>
<body>
<div class="load5s">
        <h1>View Content</h1>
        <hr id="hrViewContent">
        <div id="flexContainer" >
            <div id="divViewContentList">View Content List</div>
            <div id="divTable" >
            <table id="tableContent">
                <tr id="trHeader">
                    <th class="centerHeader" style="width:7%">#</th>
                    <th class="marginLeftHeader" style="width:15%">Title</th>
                    <th class="marginLeftHeader" style="width:43%">Brief</th>
                    <th class="marginLeftHeader" style="width:20%">Created Date</th>
                    <th class="centerHeader" style="width:15%">Actions</th>
                </tr>
                <%DateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy HH:mm");%>
                <%ResultSet rs=(ResultSet)request.getAttribute("rs");%>
                <%try{while(rs.next()){%>
                <tr>
                	<td class="centerHeader"></td>
                	<td class="marginLeftHeader"><%=rs.getString("Title")%></td>
                	<td class="marginLeftHeader"><%=rs.getString("Brief")%></td>
                	<td class="marginLeftHeader"><%=dateFormat.format(rs.getDate("CreateDate"))%></td>
                	<td class="centerHeader">
            			<a href="#">Edit</a>
            			<a href="#">Delete</a>
            		</td>
                	<%}}catch(SQLException e) {e.printStackTrace();}%>
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
</div>
    <script>
        window.addEventListener("load",function(){
            showViewContent();
        })
        function showViewContent(){
            const timeLimit=5;  //đơn vị: second
            let i=0;
            const timer=setInterval(function(){
                i++;
                if(i==timeLimit)
                {
                    clearInterval(timer);
                    document.querySelector(".load5s").style.visibility="visible";
                }
            },1000);
        }
    </script>
</body>
</html>