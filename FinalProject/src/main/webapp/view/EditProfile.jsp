<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .title{
        width:82vw;
		
        font-size: 40px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        border-bottom: 1px solid #b3b3b3 ;
      	font-weight: bold;
        
    }
    #divProfilefrom{
        left: 0px;
        padding: 10px;
        font-size: 20px;
		width: 80.94vw;
		background: rgb(240, 240, 240);
        border: 0px solid grey;
		border-radius: 2px;
        margin-bottom: 10px;
    }
.Edit{
     margin-top: 5px;
	 
     
    
		/* height:600px; */
		border: 1px solid grey;
		border-radius: 2px;
		width: 80vw;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
       
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
  border-radius: 4px;
  background-color: whitesmoke;
  margin-left:20px;
  margin-top: 20px;
}
input{
    border: 0.5px solid #b3b3b3 ;
    border-radius: 10px;   
    padding-left: 10px;
     margin-bottom: 10px;
}      
.row{
    display: flex;
    
    height: 55px;
    min-width: 72vw;
   
}
.inputform{
    margin-left:20px;
    
     margin-bottom: 20px;
    
    
}
#des{
    height: 100px;
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
            
				
        <div class="AfEdit">
				<form action ="EditUserController" method ="post" class = "editform">
                    <div class = row>
                        <div id="divProfilefrom">Profile Form Elements</div>
                     </div>
                    <div class ="inputform">
                        <div class = row>
                            <h3>First Name</h3>
                        </div>
                        <input type ="text" name ="firstname" class = "row"  placeholder="Enter the first name"/>
                        <div class = row>
                            <h3>Last Name</h3> 
                        </div>
                        <input type ="text" name ="lastname" class = "row" placeholder="Enter the last name"/>
                        <div class = "row">
                            <h3>Email</h3>
                        </div>
                        <div class = "row">
                        <p>  your_email@example.com </p>
                        </div>
                        <div class = "row">
                            <h3>Phone</h3>
                        </div>
                        <input type ="text" name ="phone" class = "row" placeholder="Enter your phone number"/>
                        <div class = "row">
                            <h3>Description</h3>
                        </div>
                        <textarea type ="text"name ="description" class = "row" id ="des"></textarea>
                    </div>
             <input type="submit" value ="Submit Button" id ="button"/> 
             <input type="submit" value ="Reset Button" id ="button"/> <br>
				</form>
        </div>
   		</div>
    
    
   
	</body>
</html>
          