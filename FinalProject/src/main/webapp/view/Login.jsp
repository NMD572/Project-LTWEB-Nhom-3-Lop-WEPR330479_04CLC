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
<body>
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
                    <input type ="text"  class ="inputloginb" id= "username" name ="username" placeholder="E-mail"/>

                </div>
                <div class="error">
                    <span id= "username_error"> </span>
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

        <button type="button" class="btn btn-danger" onclick="signOut();">Sign Out</button>

        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </div>

</div>
</div>
<script >
    function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        $("#uid").text(profile.getId());
        $("#name2").text(profile.getName());
        $("#email2").text(profile.getEmail());

        $("#image").attr('src', profile.getImageUrl());
        $(".data").css("display", "block");
        $(".g-signin2").css("display", "none");
        var id_token = googleUser.getAuthResponse().id_token;
        if( id_token !=null)
        {
            window.location.assign("/FinalProject/ViewContentController")
        }
    }

    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            alert("You have been signed out successfully");
            $(".data").css("display", "none");
            $(".g-signin2").css("display", "block");
        });
    }
    //output


    const inputBtn=document.querySelector('.inputsubmit');
    inputBtn.addEventListener("click",(e) =>{

        var flag =true;

        const username = document.getElementById("username").value;
        const password= document.getElementById("password").value;


        if(username=="")
        {
            showError('username','Email can not be blank!!');
            flag =false;

        }
        else if(username.length<5 || username.length>50 )
        {
            showError('username','Must enter from 5->50 characters');
            flag =false;

        }
        else
        {
            showError('username','');
            flag = true;
        }
        if (password=="")
        {
            showError('password','Password can not be blank!!');
            flag =false;

        }
        else if(password.length<8 || password.length>30 )
        {
            showError('password','Must enter from 8->30 characters');
            flag =false;

        }
        else
        {
            showError('password','');
            flag = true;

        }
        if(flag==false){
            e.preventDefault();
        }


    })




    function showError(key,mess){

        document.getElementById(key+ '_error').innerHTML = mess;
    }
</script>

</body>

</html>
   