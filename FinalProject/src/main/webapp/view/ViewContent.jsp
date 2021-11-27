
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Content</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
</head>
<style>
    <%@include file="/resource/MyStyle.css"%>
</style>
<body>
<c:if test="${paging == null}">
 <h1 id="load">Loading</h1>
 <div class="load5s">
</c:if>

    <div class ="form-title-view">
        <h1 id="titleViewContent">View Content</h1>
        <div class ="form-notification" id = "notification">
            <p>${responseMessage}</p>
            <c:remove var="responseMessage" scope="session" />
        </div>
    </div>     
        <hr id="hrViewContent">
        <c:if test="${searchContent == null}">
        	<div id="flexContentContainer">
            	<div id="divViewContentList">View Content List</div>
        </c:if>
        <c:if test="${searchContent != null}">
        	<div id="flexSearchContainer">
        </c:if>
            <div id="divTable" >
            	<table id="tableContent">
                	<tr id="trHeader">
                    	<th class="centerHeader" style="width:7%">#</th>
                    	<th class="marginLeftHeader" style="width:20%">Title</th>
                    	<th class="marginLeftHeader" style="width:38%">Brief</th>
                    	<th class="marginLeftHeader" style="width:20%">Created Date</th>
                    	<th class="centerHeader" style="width:15%">Action</th>
                	</tr>
                	<!-- Tinh toan stt bat dau cho dong dau tien trong table -->         
                	<c:set scope="session" var="incr" value="${(currentPage-1)*10+1}" />
                	<c:if test="${maxPage != null}">
                		<c:set scope="session" var="maxP" value="${maxPage}" />
                	</c:if>
                	<c:forEach var="content" items="${listContent}">
                		<tr>
                			<td class="centerHeader"><div><c:out value="${incr}" /></div></td>
                			<td class="marginLeftHeader"><div><c:out value="${content.getTitle()}" /></div></td>
                			<td class="marginLeftHeader" id="briefContent"><textarea readonly rows="2"><c:out value="${content.getBrief()}" /></textarea></td>
                			<td class="marginLeftHeader"><div><c:out value="${content.getCreateDate()}" /></div></td>
                			<td class="centerHeader">
                				<button class="formatButton buttonTable"><a href="GetContentController?id=<c:out value="${content.getId()}" />" method = "POST">Edit</a></button>   
                        		<button class="formatButton buttonTable"><a href="DeleteContentController?id=<c:out value="${content.getId()}" />&searchString=<c:out value="${searchContent}"/>">Delete</a></button>
            				</td>      
                		</tr>
                	<!-- Tang stt len 1 -->
                	<c:set var="incr" value="${incr+1}" />
                	</c:forEach>
            	</table>
         	</div>
        	<div id="divNextPreviousPage">
       			<c:if test="${currentPage > 1}">
            		<button class="formatButton"><a href="PagingContentController?numberOfPage=1&searchContent=<c:out value="${searchContent}"/>"><<</a></button>
            		<button class="formatButton"><a href="PagingContentController?numberOfPage=<c:out value="${currentPage-1}"/>&searchContent=<c:out value="${searchContent}"/>" ><</a></button>
        		</c:if>
        		<c:if test="${currentPage <= 1}">
            		<button class="formatButton forceHidden"><a href="PagingContentController?numberOfPage=1&searchContent=<c:out value="${searchContent}"/>"><<</a></button>
            		<button class="formatButton forceHidden"><a href="PagingContentController?numberOfPage=<c:out value="${currentPage-1}"/>&searchContent=<c:out value="${searchContent}"/>" ><</a></button>
        		</c:if>
        		<label id="numberOfPage"><c:out value="${currentPage}"/></label>
        		<c:if test="${currentPage < maxP}">
            		<button class="formatButton"><a href="PagingContentController?numberOfPage=<c:out value="${currentPage+1}"/>&searchContent=<c:out value="${searchContent}"/>">></a></button>
            		<button class="formatButton"><a href="PagingContentController?numberOfPage=<c:out value="${maxP}"/>&searchContent=<c:out value="${searchContent}"/>">>></a></button>	
        		</c:if>
        		<c:if test="${currentPage >= maxP}">
            		<button class="formatButton forceHidden"><a href="PagingContentController?numberOfPage=<c:out value="${currentPage+1}"/>&searchContent=<c:out value="${searchContent}"/>">></a></button>
            		<button class="formatButton forceHidden"><a href="PagingContentController?numberOfPage=<c:out value="${maxP}"/>&searchContent=<c:out value="${searchContent}"/>">>></a></button>	
        		</c:if>	
        	</div>
    	</div>
    
<c:if test="${paging == null}">
</div>
</c:if>
<script>

	$('#load').ready(function() {
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