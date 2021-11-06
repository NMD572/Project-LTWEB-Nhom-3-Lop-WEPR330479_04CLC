<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

   
<!DOCTYPE html>
<style>
    .title{
        width:1100px;
		
        font-size: 40px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        border-bottom: 1px solid ;
    }
    .divProfilefrom{
        padding: 10px;
		width: 1400px;
		background: lightgrey;
    }
.Edit{
     margin-top: 5px;
	margin-bottom: 10px;
		/* height:600px; */
		border: 1px solid grey;
		border-radius: 6px;
		width: 1400px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
       
}

.AfEdit{
    margin-left:20px
}
#button{
   
  
  color: black;
  padding: 10px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border: 0.5px solid #b3b3b3 ;
  border-radius: 6px;
  background-color: whitesmoke;
}
#b{
        width: 450px;
        height: 55px;
        margin: 5px 0 5px;
        border: 0.5px solid #b3b3b3 ;
         border-radius: 6px;
}      

</style>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title> 
</head>
	<body>
        <div class = "title">
            Edit Profile</div>
  		<div class ="Edit" id ='editform'>
            
				<div class="divProfilefrom">Profile Form Elements</div>
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
          
    
   
    
   
   
    
   