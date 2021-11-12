<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
* {
    margin:0;
    padding:0;  
    box-sizing: border-box;
}
html{
    font-family: Helvetica, Arial, sans-serif;
}

#header{
    border-bottom: 1px solid rgb(180, 180, 180);  
    background-color: rgb(240, 240, 240);
    height: 50px;
}
#header > div{
    display: inline-block;
    line-height: 50px;
}
#divCMS{
    color: rgb(80, 80, 80);
    padding-left:10px;
    padding-right: 1800px;
    text-transform: uppercase;
}
#divUser{
    position: relative;
    width: 45px;
}
#nav{
    visibility: hidden;
    list-style-type: none;
    position: absolute;
    margin-left: -105px;
    width: 150px;
}

#nav li{
    background-color: #fff;
}
#liProfile{
    border: rgb(180, 180, 180) solid 1px;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
#liLogout{
    border: rgb(180, 180, 180) solid 1px;
    border-top: 0px;
    border-bottom-left-radius: 3px;
    border-bottom-right-radius: 3px
}
#divUser:hover,#nav li:hover {
    background-color: rgb(200, 200, 200);
}
#nav li a{
    color: #000;
    display: inline-block;
    height: 50px;
    width: 148px;
    text-decoration: none;
    line-height: 50px;
}
#liProfile a{
    padding-left: 20px;
    padding-right: 20px;
}
#liLogout a{
    padding-left: 20px;
    padding-right: 55px;
}
#nav li svg{
    padding-top:5px;
    margin-right: 2px;
}
</style>
<body>
<div id="header">
        <div id="divCMS">CMS</div>
        <div id="divUser" onclick="openNav()">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="hsl(220, 100%, 40%)" class="bi bi-person-fill" viewBox="0 0 16 16">
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
            </svg>
            <svg id="svgTriangle" xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="hsl(220, 100%, 40%)" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
            </svg>
            <ul id="nav">
                <li id="liProfile"><a href="editprofile.tiles">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                    </svg>
                    User Profile</a></li>
                <li id="liLogout"><a href="./Login.jsp">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="20" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                    <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                    </svg>
                    Logout</a></li>
            </ul>
        </div>
</div>
<script>
        function openNav(){
            var nav = document.getElementById("nav");
            var visibility = nav.style.visibility;
            if (visibility === "" || visibility === "hidden")
                nav.style.visibility = "visible";
            else
                nav.style.visibility = "hidden";
        }
</script>    
</body>
</html>