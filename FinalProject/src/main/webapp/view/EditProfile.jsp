<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<style>
.Edit{
  border: 0.25px solid green;
  padding: 20px 30px 20px 30px;
  width:520px;
  position: relative;
}
#editform > h2{
  
    background-color: #DCDCDC;
    border-color: #DCDCDC;
}
.AfEdit{
  
}
#button{
        padding: 5px 5px 5px 5px;
        width:120px;
        position: static;
        font-size: 10px        
    	background-color: #228B22;
    	border-color: #228B22;
}
#b{
        width: 450px;
        height: 55px;
        margin: 5px 0 10px;
}      
.edit{
    display: block;
}
</style>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title> 
</head>
	<body>
    
  		<div class ="Edit" id ='editform'>
        <h1>Edit Profile</h1>
			<h2>Profile From Elements</h2>
        <div class="AfEdit">
				<form action ="EditUserController" method ="post" class = "editform">
				<h3>First Name</h3><input type ="text" name ="firstname" id ="b" placeholder="Enter the first name"/><BR>
         <h3>Last Name</h3> <input type ="text" name ="lastname" id ="b" placeholder="Enter the last name"/><BR>
          	<h3>Email</h3>
           <input type ="text" name ="email" id ="b" placeholder="Enter your mail"/><BR>
          <h3>Phone</h3>
          <input type ="text" name ="phone" id ="b" placeholder="Enter your phone number"/><BR>
          <h3>Description</h3>
					<input type ="text"name ="description" id ="b"  /><BR>
    				
          <input type="submit" value ="Submit Button" id ="button"/> 
           <input type="submit" value ="Reset Button" id ="button"/> <br>
				</form>
        </div>
   		</div>
    
    
   
	</body>
</html>
          
    
   
    
   