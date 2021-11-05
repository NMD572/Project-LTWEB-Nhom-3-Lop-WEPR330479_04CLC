<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<title>Content form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class = "container">

		<div class = "title"> <h1>Add Content</h1> </div>

		<form action="AddContentController" method="post">

			<div class = "content-form-elements">
				Content Form Elements
			</div>

			<div class ="title">
				<b> <label>Title</label> </b>
				<input type="text" value="<c:out value='${content.title}' />" class="form-control"
					   name="title" required="required">
			</div>

			<div class = "brief">
				<b> <label>Content</label> </b>
				<textarea type="text" value="<c:out value='${content.brief}' />" class="form-control"
						  name="brief" required="required">
				</textarea>
			</div>

			<div class = "content">
				<b> <label>Brief</label> </b>
				<textarea type="text" value="<c:out value='${user.content}' />" class="form-control"
						  name="content" required="required">
			</textarea>
			</div>

			<div class = "btn">
				<button type="submit" class="btn btn-success">Submit Button</button>
				<button type="submit" class="btn btn-success">Reset Button</button>
			</div>

		</form>
	</div>
</body>
</html>


<style>
	.container form .title
	{
		width:1100px;
		margin-left: 20px;
	}
	.container form .brief
	{
		width:1100px;
		margin-left:20px
	}
	.container form .brief textarea
	{
		height: 70px;
	}
	.container form .content
	{
		width:1100px;
		margin-left:20px;
	}
	.container form .content textarea
	{
		height: 220px;
	}
	.container form .form-control
	{
		margin-bottom: 20px;
	}
	.container
	{
		margin-top: 5px;
		/* background: #71b7e6; */
		border: 2px black;
	}
	.container form
	{
		margin-top: 5px;
		margin-bottom: 20px;
		/* height:600px; */
		border: 1px solid grey;
		border-radius: 2px;
		width: 1400px;
	}
	.container form .content-form-elements
	{
		padding: 10px;
		width: 1400px;
		background: lightgrey;
		/* border: 1px solid black; 		 */
	}
	.container form .btn
	{
		margin-left: 4px;
		margin-bottom: 4px;
	}
</style>
