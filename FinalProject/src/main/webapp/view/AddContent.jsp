<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<title>Content form</title>
</head>
<body>
	<div class = "container">

		<div class = "form-title"> <h1>Add Content</h1> </div>

		<form action="AddContentController" method="post">

			<div class = "content-form-elements">
				<div class = "content-form-elements-title">
					Content Form Elements
				</div>
			</div>
			<div class ="title">
				<b> <label>Title</label> </b>
				<input type="text" value="<c:out value='${content.title}' />" class="form-control" placeholder="&nbsp Enter the title"
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
	.form-title
	{
		font-family: Arial, Helvetica, sans-serif;
		border-bottom: 1px solid lightgrey;
		/* border: 1px solid lightgrey; */
		width: 1400px;
		height: 50px;
		justify-content: center;
	}
	.container form .title
	{
		width:1100px;
		height: 90px;
		margin-top:10px;
		margin-left: 20px;
		/*border: 1px solid black;*/
		display: flex;
		flex-direction: column;
		font-family: Arial, Helvetica, sans-serif;

	}
	.container form .title ::placeholder{
		color: lightgray
	}
	.container form .title input
	{
		margin-top: 5px;
		height: 40px;
		padding: 10px;
	}
	.container form .brief
	{
		width:1100px;
		margin-left:20px;
		/*border: 1px solid red;*/
		display: flex;
		flex-direction: column;
		font-family: Arial, Helvetica, sans-serif;
	}
	.container form .brief textarea
	{
		height: 100px;
		margin-top: 5px;
		padding: 10px;
		font-family: Arial, Helvetica, sans-serif;
	}
	.container form .content
	{
		width:1100px;
		margin-left:20px;
		/* border: 1px solid green;  */
		display: flex;
		flex-direction: column;
		font-family: Arial, Helvetica, sans-serif;
	}
	.container form .content textarea
	{
		height: 220px;
		margin-top: 5px;
		margin-bottom:15px;
		padding: 10px;
		font-family: Arial, Helvetica, sans-serif;
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
		margin-top: 20px;
		margin-bottom: 20px;
		/* height:600px; */
		border: 1px solid grey;
		border-radius: 2px;
		width: 1400px;
	}
	.container form .content-form-elements
	{
		font-family: Arial, Helvetica, sans-serif;
		padding: 10px;
		width: 1398px;
		background: rgb(240, 240, 240);
		/* border: 1px solid black; 		 */
	}
	.container form .content-form-elements .content-form-elements-title
	{
		margin-left: 10px;
	}
	.container form .btn
	{
		margin-left: 10px;
		margin-bottom: 15px;
		font-size: 15px;
		font-family: Arial, Helvetica, sans-serif;
		height: 30px;

		width: 250px;
		justify-content: center;
		display: flex;
	}
	.container form .btn button
	{
		line-height: 30px;
	}
</style>
