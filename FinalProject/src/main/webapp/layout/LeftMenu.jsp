<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
#divMenu{
  background-color: rgb(240, 240, 240);
  border-right:  1px solid rgb(180, 180, 180);
  height: 100vh;
  width: 250px;
}
#divSearch{
  height: 60px;
  padding-top: 12.5px;
  padding-left: 7px;
}
.floatSearch{
  float:left;
}
#divSearch>form>input{
  border: 1px solid rgb(180, 180, 180);
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
  padding-left: 10px;
  height: 35px;
  width: 200px;
}
::placeholder{
  color:grey;
}
#divSearch>form>button{
  height: 35px;
  width: 35px;
  border: 1px solid rgb(180, 180, 180);
  border-left: none;
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
  background-color: white;
  
}
.menuContent{
  border-top: 1px solid rgb(200, 200, 200);
  height: 40px;
}
#divFormContent{
  border-bottom: 1px solid rgb(200, 200, 200);
}
#divViewContent>a, #divFormContent>a{
  width: 250px;
  display: inline-block;
  color: hsl(220, 100%, 40%);
  text-decoration: none;
  line-height: 40px;
  padding-left: 10px;
}
#divViewContent>a>svg,#divFormContent>a>svg{
  padding-top:2px;
  padding-right: 2px;
}
</style>
<body>
<div id="divMenu">
        <div id="divSearch">
            <form action="">
                <input class="floatSearch"type="text" placeholder="Search...">
                <button class="floatSearch">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                </button>
            </form>
        </div>
        <div id="divViewContent" class="menuContent">
            <a href="./ViewContent.html">
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="hsl(220, 100%, 40%)" class="bi bi-table" viewBox="0 0 16 16">
                    <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"/>
                </svg>
                View contents
            </a>
        </div>
        <div id="divFormContent" class="menuContent">
            <a href="">
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="hsl(220, 100%, 40%)" class="bi bi-pencil-square" viewBox="0 0 16 16">
                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                </svg>
                Form contents
            </a>
        </div>
        
    </div>
</body>
</html>