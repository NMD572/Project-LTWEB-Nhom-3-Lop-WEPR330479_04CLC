
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
#titleViewContent{
	font-size:45px;
	margin-bottom:8px;
}
#hrViewContent{
    margin-top: 0px;
    margin-left: 0px;
    margin-bottom: 15px;
    height:0.5px;
    width: 80vw;
    min-width: 780px;
    border-width:0;
    color:gray;
    background-color: rgba(210, 210, 210,0.5);
}
#flexContainer{
    width: 80vw;
    min-width: 780px;
    padding-top:0px;
    padding-left:0px;
    border: 1px solid rgb(180, 180, 180);
    border-top: 0;
    border-radius: 3px;
}
#divViewContentList{
    background-color: rgba(210, 210, 210,0.3);
    border-top:1.5px solid rgb(180, 180, 180);
    border-bottom: 1.5px solid rgb(180, 180, 180);
    height: 45px;
    line-height: 45px;
    margin-bottom: 20px;
    padding-left: 10px;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
table{
    width: 98%;
    margin-left: 1%;
    margin-bottom: 15px;
}
table,th,tr,td{
    border:1px gray;
    border:solid rgb(180, 180, 180) thin;
    border-collapse: collapse;
    font-family: Arial, Helvetica, sans-serif;
    text-align: left;
    font-size: 17px;
}
tr{
    height: 60px;
}
td>div{
    height: 30px;
    width: 100%;
}
#trHeader{
    height: 40px;
}
.marginLeftHeader{
    padding-left: 10px;
}
#briefContent{
    padding: 0;
    padding-top: 10px;
    padding-left: 10px;
}
#briefContent>textarea{
    border: none;
    resize: none;
    background-color: inherit;
    color: inherit;
    font-size: inherit;
    font-family: inherit;
    height: 100%;
    width: 100%;
}
.centerHeader{
    text-align: center;
}
tr:nth-child(even) {
    background-color: rgba(210, 210, 210,0.3);
}
#tableContent td > a{
    text-decoration: none;
    color: #28a745;
}
#divNextPreviousPage{
    margin: auto;
    width: 15%;
    height:40px;
}
.formatButton{
    border:none;
    border-radius: 2px;
    color: #fff;
    background-color: #28a745;
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
        <h1 id="titleViewContent">View Content</h1>
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
                    <th class="centerHeader" style="width:15%">Action</th>
                </tr>
                <c:forEach var="content" items="${listContent}">
                	<tr>
                		<td class="centerHeader"><div><c:out value="${content.getStt()}" /></div></td>
                		<td class="marginLeftHeader"><div><c:out value="${content.getTitle()}" /></div></td>
                		<td class="marginLeftHeader" id="briefContent"><textarea rows="2"><c:out value="${content.getBrief()}" /></textarea></td>
                		<td class="marginLeftHeader"><div><c:out value="${content.getCreateDate()}" /></div></td>
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
</body>
</html>