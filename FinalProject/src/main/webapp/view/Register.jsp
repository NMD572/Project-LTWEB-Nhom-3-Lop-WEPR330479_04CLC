<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <link rel="stylesheet" href="LoginRegisStyle.css"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class ="Register">
    		<h1>Register </h1>
				<form action ="RegisterController" method ="post" class = "registerform" name="form"  method="post" onsubmit="return validate()">
 					<input type ="text" name ="username" id ="b" placeholder="User name"/><BR>
					<input type ="text" name ="email"id ="b" placeholder="E-mail"/><BR>
  			  <input type ="password" name ="password" id ="b" placeholder="Pasword" /><BR>
           <input type ="password" name ="repassword" id ="b" placeholder="Re Pasword" /><BR>
					<input type="submit" value ="Register"id ="button" /><BR>
          <a href="Login.jsp" target="_blank"id ="a">Click here to Login</a>
		</form>
    	</div>
</body>
</html>