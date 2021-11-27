<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   
    <title>Add User Google</title>
</head>
<style>
	<%@include file="/resource/MyStyle.css"%>
</style>
<body onload="addggaccount()">
	<div class ="displayaddgg">
        <form action ="AddGoogleUserController" method ="post" class = "registerform" id ="registerform" name="form"  method="post" onsubmit="return validate()">
            <div class="rowregis" >
                <div class ="titleregis">
                    Register
                </div>
            </div>
            <div class = "inputform">
                <div class="rowregis">
                    <input type ="text" name ="username" id ="username" class ="registerinput" placeholder="User name"/>

                </div>
                <div class="error">
                    <span id= "username_error"> </span>
                </div>
                <div class="rowregis">
                    <input type ="text" name ="email"id ="email" required class ="registerinput" placeholder="E-mail"/>
                </div>
                <div class="error">
                    <span id= "email_error"> </span>
                </div>
                <div class="rowregis">
                    <input type ="password" name ="password" id ="password"  class ="registerinput" placeholder="Password" />
                </div>
                <div class="error">
                    <span id= "password_error"> </span>
                </div>
                <div class="rowregis">
                    <input type ="password" name ="repassword" id ="passconfirm" class ="registerinput" placeholder="Re Password" />
                </div>
                <div class="error">
                    <span id= "repassword_error" > </span>
                </div>
                <div class="rowregis">
                    <input type="submit" value ="Register" class ="registersubmit" id ="submitbutton" />
                </div>
               
            </div>
        </form>
  	</div>
    
    <script>
    
        function addggaccount(){
        	if(sessionStorage.getItem("checkidGG")!=null)
        		{
        		
        		 document.getElementById("username").value="userGoogle";
        		 document.getElementById("email").value=sessionStorage.getItem("emailGG");
        		 document.getElementById("password").value=makeid(15).toString();
        		 document.getElementById("passconfirm").value=makeid(15).toString();
        		 
        		 document.getElementById('submitbutton').click();
        		}
           
        }
        function makeid(length) {
            var result           = '';
            var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            var charactersLength = characters.length;
            for ( var i = 0; i < length; i++ ) {
              result += characters.charAt(Math.floor(Math.random() * 
         charactersLength));
           }
           return result;
        }
    </script>
</body>
</html>

