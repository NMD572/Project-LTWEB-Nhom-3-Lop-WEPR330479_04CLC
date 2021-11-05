
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
    width: 1500px;
    border-width:0;
    color:gray;
    background-color:gray;
}
#flexContainer{
    width: 1500px;
    padding-top:0px;
    padding-left:0px;
    border: 1.5px solid rgb(180, 180, 180);
    border-top: 0;
    border-radius: 3px;
}
#divViewContentList{
    background-color: rgb(210, 210, 210);
    border-top:1.5px solid rgb(180, 180, 180);
    border-bottom: 1.5px solid rgb(180, 180, 180);
    height: 30px;
    line-height: 30px;
    margin-bottom: 10px;
    padding-left: 10px;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
table{
    width: 95%;
    margin-left: 2.5%;
    margin-bottom: 15px;
}
table,th,tr,td{
    border:1px gray;
    border:solid rgb(180, 180, 180) thin;
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
    height:40px;
}
.formatButton{
    background-color: green;
    border:none;
    border-radius: 2px;
    color: white;
   	height:30px;
  	width:30px;
}
#numberOfPage{
	margin-left:5px;
	margin-right:5px;
	font-size:20px;
	line-height:30px;
}
</style>
<body>
<h1 id="load">Loading</h1>
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
                <c:forEach var="content" items="${listContent}">
                	<tr>
                		<td class="centerHeader"><c:out value="${content.getStt()}" /></td>
                		<td class="marginLeftHeader"><c:out value="${content.getTitle()}" /></td>
                		<td class="marginLeftHeader"><c:out value="${content.getBrief()}" /></td>
                		<td class="marginLeftHeader"><c:out value="${content.getCreateDate()}" /></td>
                		<td class="centerHeader">
            				<a href="EditContentController?id=<c:out value="${content.getId()}" />">Edit</a>
            				<a href="DeleteContentController?id=<c:out value="${content.getId()}" />">Delete</a>
            			</td>      
                	</tr>
                </c:forEach>
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
                    document.querySelector("#load").style.display="none";
                }
            },1000);
        }
    </script>
</body>
</html>