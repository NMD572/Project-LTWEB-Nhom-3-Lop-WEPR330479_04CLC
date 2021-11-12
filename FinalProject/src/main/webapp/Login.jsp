<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title> 
</head>
<style>
    .Login{
        margin-top: 12%;
        margin-left: 35%;
        margin-right: 35%;
        min-width: 430px;
        
    }
.AfLogin{
           
		border: 1px solid grey;
		border-radius: 2px;
		width: 98%;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        
}
input{
    border: 0.5px solid lightgrey;
    border-radius: 4px;   
    padding-left: 10px;
}   
#title1{
   
        padding: 20px;
        font-size: 20px;
		width: 98.94%;
		background: rgb(240, 240, 240);
        border: 0px solid grey;
		border-radius: 2px;
}
      
#button{
        padding: 20px 30px 20px 30px;
        width:90%;
        position: static;
        font-size: 40px;
        color: #fff;
    border: 0px solid grey;
	border-radius: 6px;
    background-color: #228B22;
    border-color: #228B22;
    margin-top: 20px;
}
      #b{
        width: 90%;
        height: 45px;
        margin: 20px 0 20px;
      }
         
    .inputform{
        margin-left:20px
    }
 .row{
    display: flex;
    
    min-height: 35px;
    min-width: 75%;
   
 }
 #c {
     text-decoration: none;
     font-size: 25px;
     margin-top: 15px;
     color:blueviolet;
 }
</style>
	<body>
  		<div class ="Login">
            
			 <div class="AfLogin">
                <form action ="LoginController" method ="post" class = "loginform" name="form"  method="post" onsubmit="return validate()">
                 <div class="row" >
                     <div id ="title1">
                    Please Sign In 
                     </div>
                 </div>
                 <div class = "inputform">
                    <div class="row">
                        <input type ="text" name ="username" id ="b" placeholder="E-mail"/>

                    </div>
                    <div class="row">
                        <input type ="password" name ="password" id ="b" placeholder="Pasword" />
                    </div>
                    <div class="row">
                        <input type="checkbox" name="remember" id ="a" value="remember">Remember Me 
                    </div>
                    <div class="row">
                        <input type="submit" value ="Login" id ="button"/> 
                    </div>
                    <div class="row">
                        <a href="Register.jsp" target="_blank"id ="c">Click here to Register</a>
                    </div>
                </div>
				</form>
        </div>
   		</div>
	</body>
</html>
   