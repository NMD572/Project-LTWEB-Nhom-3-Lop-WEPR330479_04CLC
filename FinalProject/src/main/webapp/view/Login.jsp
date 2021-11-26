<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="google-signin-client_id" content="552028656930-v0kr541qgbv29pcd47e76vrcrnr6dcap.apps.googleusercontent.com">
    <title>Login</title>
</head>
<style>
    <%@include file="/resource/MyStyle.css"%>
</style>
<body  onload="getcookiedata()">
<div class ="Login">

    <div class="AfLogin">
        <form action ="LoginController" method ="post" class = "loginform"  >
            <div class="rowlogin" >
                <div class ="titlelogin">
                    Please Sign In
                </div>
            </div>
            <div class = "inputform">
                <div class="rowlogin">
                    <input type ="text"  class ="inputloginb" id= "email" name ="email" placeholder="E-mail"/>

                </div>
                <div class="error">
                    <span id= "email_error"> </span>
                </div>
                <div class="rowlogin">
                    <input type ="password" name ="password" class ="inputloginb" id= "password" placeholder="Pasword" />

                </div>
                <div class="error">
                    <br> <span id= "password_error"> </span>
                </div>
                <div class="rowlogin">
                    <div class="rememberme">
                        <input type="checkbox" name="remember"  value="remember" id= "remember-me">Remember Me
                    </div>
                </div>
                <div class="rowlogin">
                    <input type="submit" value ="Login"  class ="inputsubmit" />
                </div>

                <div class="rowlogin">
                    <a href="register.tiles" target="_blank" class ="inputloginc" >Click here to Register</a>
                </div>
            </div>
        </form>
        <div class="g-signin2" data-onsuccess="onSignIn"></div>

       

        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://accounts.google.com/gsi/client" async defer></script>
    </div>

</div>
<script >
    function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        
    	
    	sessionStorage.setItem("fullnameGG",profile.getName());
		sessionStorage.setItem("emailGG",profile.getEmail());
		sessionStorage.setItem("imageGG",profile.getImageUrl());
       	sessionStorage.setItem("checkidGG",profile.getId());
        //var id_token = googleUser.getAuthResponse().id_token;
        //if( id_token !=null)
       // {
        	
           // window.location.assign("/FinalProject/ViewContentController")
        //}
        if((profile.getId())!=null)
        	signOut();
        alert("You have been signed in successfully");
        	window.location.assign('addUserGoogle.tiles')
    }

    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            
        });
    }
    //output


    const inputBtn=document.querySelector('.inputsubmit');
    inputBtn.addEventListener("click",(e) =>{
    	sessionStorage.removeItem("checkidGG");
    	//check remember thi moi luu
    	 var check = document.getElementById('remember-me');
         if(check.checked){
        	 setcookie();
         }
        var flagEmail =true;
        var flagPassword =true;
        const email = document.getElementById("email").value;
        const passWord= document.getElementById("password").value;


        if(email=="")
        {
            showError('email','Email can not be blank!!');
            flagEmail =false;

        }
        else if(email.length<5 || email.length>50 )
        {
            showError('email','Must enter from 5->50 characters');
            flagEmail =false;

        }
        else
        {
            showError('email','');
            flagEmail = true;
        }
        if (passWord=="")
        {
            showError('password','Password can not be blank!!');
            flagPassword =false;

        }
        else if(passWord.length<8 || password.length>30 )
        {
            showError('password','Must enter from 8->30 characters');
            flagPassword =false;

        }
        else
        {
            showError('password','');
            flagPassword = true;

        }
        if(flagPassword==false|| flagEmail==false){
            e.preventDefault();
        }


    })





    function showError(key,mess){

        document.getElementById(key+ '_error').innerHTML = mess;
    }
    function setcookie(){
        var u =document.getElementById('email').value;
        var p =document.getElementById('password').value;
	//set host
        document.cookie="myusrname="+u+";path=http://localhost:8080/FinalProject/";
        document.cookie="mypswd="+p+";path=http://localhost:8080/FinalProject/";
       }

	
       function getcookiedata(){

        console.log(document.cookie);

        var user=getCookie('myusrname');
        var pswd=getCookie('mypswd');

        document.getElementById('email').value=user;
        document.getElementById('password').value=pswd;
        //var check = document.getElementById('remember-me');
        //console.log(check.checked);
       }



//lay ra cookie
  function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
   }
</script>

</body>

</html>
   