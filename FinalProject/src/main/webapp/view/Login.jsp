<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <link rel="stylesheet" href="LoginRegisStyle.css"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title> 
</head>
	<body>
  		<div class ="Login">
			<h1>Please Sign In </h1>
			 <div class="AfLogin">
				<form action ="LoginController" method ="post" class = "loginform" name="form"  method="post" onsubmit="return validate()">
					<input type ="text" name ="username" id ="b" placeholder="E-mail"/><BR>
					<input type ="password" name ="password" id ="b" placeholder="Pasword" /><BR>
    				<input type="checkbox" name="remember" id ="a" value="remember">Remember me <br>
          <input type="submit" value ="Login" id ="button"/> <br>
   					<a href="Register.jsp" target="_blank"id ="a">Click here to Register</a>
				</form>
        </div>
   		</div>
   
	</body>
</html>
    
   