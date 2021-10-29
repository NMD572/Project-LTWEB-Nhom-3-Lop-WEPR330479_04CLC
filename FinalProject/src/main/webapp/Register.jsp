<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <link rel="stylesheet" href="LoginRegisStyle.css"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<style>
.login{
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