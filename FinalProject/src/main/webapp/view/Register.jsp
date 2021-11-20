<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="index.css"/>
    <title>Register</title>
</head>
<style>
    <%@include file="/resource/MyStyle.css"%>
</style>
<body>
<div class ="Register">
    <div class="AfRegis">
        <form action ="RegisterController" method ="post" class = "registerform" id ="register-form" name="form"  method="post" onsubmit="return validate()">
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
                    <span id= "repassword_error"> </span>
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
    <script>
        const inputBtn=document.querySelector('.registersubmit');
        inputBtn.addEventListener("click",(e) =>{

            var flag =true;

            const username = document.getElementById("user-name").value;
            const email = document.getElementById("e-mail").value;
            const password= document.getElementById("pass-word").value;
            const repassword= document.getElementById("pass-confirm").value;

            if(username=="")
            {
                showError('username','Username can not be blank!!');
                flag =false;

            }
            else if(username.length<3 || username.length>30 )
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
            if(repassword==""){
                showError('repassword','Can not be blank!!');
                flag =false;
            }
            else if(repassword.length<8 || repassword.length>30 )
            {
                showError('repassword','Must enter from 8->30 characters');
                flag =false;

            }
            else if(repassword!=password){
                showError('repassword','Not corret Re Password!!');
                flag =false;
            }
            else {
                showError('repassword','');
                flag = true;
            }
            if(email==""){
                showError('email','Can not be blank!!');
                flag =false;
            }
            else if(email.length <5){
                showError('email','Must enter at least 5 characters');
                flag =false;
            }
            else if(!validateEmailAddress(email)){
                showError('email','Pls insert a correct email!!');
                flag =false;
            }
            else {
                showError('email','');
                flag = true;
            }
            if(flag==false){
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

