<%@ page import="model.Content" %>
<%@ page import="controller.EditContentController" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Content temp = (Content)request.getAttribute("existContent");
	request.setAttribute("eContent",temp);
%>

<html>
<head>
	<c:if test = "${eContent == null}">
		<title>Add Content</title>
	</c:if>

	<c:if test = "${eContent != null}">
		<title>Edit Content</title>
	</c:if>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--	<script src="<c:url value = "/ckeditor/ckeditor.js"/>"></script>--%>
</head>
<body>
<h1 id="load">Loading</h1>
<div class="load5s">
	<div class = "container">
		<div class = "form-title">

			<c:if test = "${eContent == null}">
				<h1>Add Content</h1>
			<div class ="form-notification" id = "notification">
				<p>${responseMessage}</p>
				<c:remove var="responseMessage" scope="session" />
			</div>
			</c:if>

			<c:if test = "${eContent != null}">
				<h1>Edit Content</h1>
				<div class ="form-notification" id = "notification">
					<p>${responseMessage}</p>
					<c:remove var="responseMessage" scope="session" />
				</div>
				</c:if>
		</div>


	<c:if test = "${eContent == null}">
		<form action="AddContentController" method="post" id ="addForm">
	</c:if>

		<c:if test = "${eContent != null}">
		<form action="EditContentController?id=<c:out value="${existContent.getId()}" />" method="post" id ="editForm">
			</c:if>

			<div class = "content-form-elements">
				<div class = "content-form-elements-title">
					Content Form Elements
				</div>
			</div>

			<div class ="title">
					<b> <label>Title</label> </b>
				<c:if test = "${eContent == null}">
					<input type="text" class="form-control" placeholder="&nbsp Enter the title"
						   name="title" value="<c:out value='${fillContent.getTitle()}' />">
				</c:if>

				<c:if test = "${eContent != null}">
					<input type="text" class="form-control"
						   name="title" value="<c:out value='${existContent.getTitle()}' />">
				</c:if>
			</div>

			<div class = "brief">
				<b> <label>Brief</label> </b>
				<c:if test = "${eContent == null}">
					<textarea type="text" class="form-control" name="brief"><c:out value='${fillContent.getBrief()}'/></textarea>
				</c:if>

				<c:if test = "${eContent != null}">
            		<textarea type="text" class="form-control" name="brief"><c:out value='${existContent.getBrief()}'/></textarea>
				</c:if>
			</div>

			<div class = "content">
				<b> <label>Content</label> </b>
				<c:if test = "${eContent == null}">
					<textarea type="text" id = "text-content" class="form-control" name="content"><c:out value='${fillContent.getContent()}'/></textarea>
				</c:if>
				<c:if test = "${eContent != null}">
            		<textarea type="text"  id = "text-content" class="form-control" name="content" ><c:out value='${existContent.getContent()}'/></textarea>
				</c:if>
			</div>

			<div class = "btn">
			<c:if test = "${eContent == null}">
				<button type="submit" class="btn btn-success" id ="btn-add-submit" method = "POST">Submit Button</button>
				<button type="button" class="btn btn-success" id ="btn-add-reset" method = "GET">Reset Button</button>
			</div>
			</c:if>

			<c:if test = "${eContent != null}">
				<button type="submit" class="btn btn-success" id ="btn-edit-submit" method = "POST">Submit Button</button>
				<button type="button" class="btn btn-success" id ="btn-edit-reset" method = "GET">Reset Button</button>
			</div>
			</c:if>
	</form>
	</div>
</div>

<script>
	//load page 5s
    window.addEventListener("load",function()
	{
		loadPage();

    })
	// Reset form add
	    var addReset = document.querySelector("#btn-add-reset")
		var addForm = document.querySelector("#addForm");
		resetForm(addReset,addForm);

	//Reset form edit
		var editReset = document.querySelector("#btn-edit-reset")
		var editForm = document.querySelector("#editForm");
		resetForm(editReset,editForm);

	//Các function sử dụng
	function loadPage(){
		const timeLimit=1;  //đơn vị: second
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

	function resetForm(button,form)
	{
		if (button != null) {
			button.addEventListener('click', (e) => {
				e.preventDefault();
				$("#notification").html("");
				document.querySelector("#notification").style.display = "initial";
				form.reset();
				$('#notification').html(`Reset data successfully`);
			})
		}
	}

</script>
</body>
</html>
<style>
	<%@include file="/resource/MyStyle.css"%>
</style>