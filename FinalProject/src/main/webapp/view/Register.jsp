<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <title>Register</title>
</head>
<style>
    <%@include file="/resource/MyStyle.css"%>
</style>
<body >
<div class ="Register" >
    <div class="AfRegis">
        <form action ="RegisterController" method ="post" class = "registerform" id ="register-form" name="form"  method="post" >
            <div class="rowregis" >
                <div class ="titleregis">
                    Register
                </div>
            </div>
            <div class = "inputform">
                <div class="rowregis">
                    <input type ="text" name ="username" id ="user-name" class ="registerinput" placeholder="User name"/>

                </div>
                <div class="error">
                    <span id= "username_error"> </span>
                </div>
                <div class="rowregis">
                    <input type ="email" name ="email"id ="e-mail" required class ="registerinput" placeholder="E-mail"/>
                </div>
                <div class="error">
                    <span id= "email_error"> </span>
                </div>
                <div class="rowregis">
                    <input type ="password" name ="password" id ="pass-word"  class ="registerinput" placeholder="Password" />
                </div>
                <div class="error">
                    <span id= "password_error"> </span>
                </div>
                <div class="rowregis">
                    <input type ="password" name ="repassword" id ="pass-confirm" class ="registerinput" placeholder="Re Password" />
                </div>
                <div class="error">
                    <span id= "repassword_error" name ="huhu" value="haha"> </span>
                </div>
                <div class="rowregis">
                    <input type="submit" value ="Register" class ="registersubmit" />
                </div>
                <div class="rowregis">
                    <a href="login.tiles" target="_blank" class ="registera">Click here to Login</a>
                </div>
            </div>
        </form>
    </div>
    </div>
    
    <script>
    const inputBtn=document.querySelector('.registersubmit');
    inputBtn.addEventListener("click",(e) =>{

        var flagUsername =true;
        var flagEmail =true;
        var flagPassword =true;
        var flagRepassword =true;

        const userName = document.getElementById("user-name").value;
        const email = document.getElementById("e-mail").value;
        const passWord= document.getElementById("pass-word").value;
        const rePassword= document.getElementById("pass-confirm").value;

        if(userName=="")
        {
            showError('username','Username can not be blank!!');
            flagUsername =false;

        }
        else if(userName.length<3 || userName.length>30 )
        {
            showError('username','Must enter from 5->50 characters');
            flagUsername =false;

        }
        else
        {
            showError('username','');
            flagUsername = true;
        }
        if (passWord=="")
        {
            showError('password','Password can not be blank!!');
            flagPassword =false;

        }
        else if(passWord.length<8 || passWord.length>30 )
        {
            showError('password','Must enter from 8->30 characters');
            flagPassword =false;

        }
        else
        {
            showError('password','');
            flagPassword = true;

        }
        if(rePassword==""){
            showError('repassword','Can not be blank!!');
            flagRepassword =false;
        }
        else if(rePassword.length<8 || rePassword.length>30 )
        {
            showError('repassword','Must enter from 8->30 characters');
            flagRepassword =false;

        }
        else if(rePassword!=passWord){
            showError('repassword','Not corret Re Password!!');
            flagRepassword =false;
        }
        else {
            showError('repassword','');
            flagRepassword = true;
        }
        if(email==""){
            showError('email','Can not be blank!!');
            flagEmail =false;
        }
        else if(email.length <5){
            showError('email','Must enter at least 5 characters');
            flagEmail =false;
        }
        else if(!validateEmailAddress(email)){
            showError('email','Pls insert a correct email!!');
            flagEmail =false;
        }
        else {
            showError('email','');
            flagEmail = true;
        }
        if(flagEmail==false || flagPassword==false || flagRepassword==false || flagUsername==false){
            e.preventDefault();
        }


    })



        function validateEmailAddress(email) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }

        function showError(key,mess){

            document.getElementById(key+ '_error').innerHTML = mess;
        }
        
    </script>
</body>
</html>

