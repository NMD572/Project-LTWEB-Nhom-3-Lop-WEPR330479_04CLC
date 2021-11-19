<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<style>
 .Register{
        margin-top: 9%;
        margin-left: 31%;
        margin-right: 31%;
        min-width: 430px;
        
    }
.AfRegis{
           
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
    background-color: green;
    border-color: green;
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
 #a{
    text-decoration: none;
     font-size: 25px;
     margin-top: 15px;
     color:#0086b3;
 }
</style>
<body>
<div class ="Register">
    <div class="AfRegis">
        <form action ="RegisterController" method ="post" class = "registerform" name="form"  method="post" onsubmit="return validate()">
         <div class="row" >
             <div id ="title1">
                Register
             </div>
         </div>
         <div class = "inputform">
            <div class="row">
                <input type ="text" name ="username" id ="b" placeholder="User name"/>

            </div>
            <div class="row">
                <input type ="text" name ="email"id ="b" placeholder="E-mail"/>
            </div>
            <div class="row">
                <input type ="password" name ="password" id ="b" placeholder="Pasword" />
            </div>
            <div class="row">
                <input type ="password" name ="repassword" id ="b" placeholder="Re Pasword" />
            </div>
            <div class="row">
                <input type="submit" value ="Register"id ="button" />
            </div>
            <div class="row">
                <a href="login.tiles" target="_blank"id ="a">Click here to Login</a>
            </div>
        </div>
        </form>
</div>
    		
</body>
</html>