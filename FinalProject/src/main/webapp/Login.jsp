<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="LoginRegisStyle.css"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title> 
</head>
<style>
.login{
	margin:auto;
  border: 0.25px solid green;
  padding: 20px 30px 20px 30px;
  width:520px;
  position: static;
}
.Register{
  border: 0.25px solid green;
  padding: 20px 30px 20px 30px;
        width:520px;
 
}
h1{
  
    background-color: #DCDCDC;
    border-color: #DCDCDC;
}

.Aflogin{
        
       
        font-size: 40px
      
      }
      
#button{
        padding: 20px 30px 20px 30px;
        width:500px;
        position: static;
        font-size: 40px
              color: #fff;
    
    background-color: #228B22;
    border-color: #228B22;
}
      #b{
        width: 500px;
        height: 55px;
        margin: 5px 0 10px;
      }
         
     div {
    display: block;
}
</style>
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
    
   