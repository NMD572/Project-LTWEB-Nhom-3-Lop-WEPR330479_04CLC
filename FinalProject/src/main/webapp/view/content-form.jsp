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
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<caption>
					<h2>
						<c:if test="${content != null}">
            			Edit Content
            		</c:if>
						<c:if test="${content == null}">
            			Add Content
            		</c:if>
					</h2>
				</caption>
				
					<form action="AddContentServlet" method="post">
					
					<fieldset class="form-group">
					<label>Title</label> <input type="text"
						value="<c:out value='${content.title}' />" class="form-control"
						name="title" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Content</label> <input type="text"
						value="<c:out value='${content.brief}' />" class="form-control"
						name="brief">
				</fieldset>

				<fieldset class="form-group">
					<label>Brief</label> <input type="text"
						value="<c:out value='${user.content}' />" class="form-control"
						name="content">
				</fieldset>

				<button type="submit" class="btn btn-success">Submit Button</button>
					
					</form>
				
			</div>
		</div>
	</div>
</body>
</html>
