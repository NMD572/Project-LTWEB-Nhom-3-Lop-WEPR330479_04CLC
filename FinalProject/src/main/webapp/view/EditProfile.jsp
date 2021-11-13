<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .title{
        width:82vw;
		
        font-size: 40px;
        font-family: Arial, Helvetica, sans-serif;
        border-bottom: 1px solid #b3b3b3 ;
      	font-weight: bold;
         padding-bottom: 10px;
    }
    #divProfilefrom{
       
        padding-left: 20px;
        padding-top: 10px;
        font-size: 20px;
		width: 80.94vw;
		background: rgb(240, 240, 240);
        border: 0px solid grey;
		border-radius: 2px;
        margin-bottom: 10px;
    }
.Edit{
     margin-top: 25px;
		/* height:600px; */
		border: 1px solid grey;
		border-radius: 2px;
		width: 80vw;
        font-family: Arial, Helvetica, sans-serif;
       
}

#button{
   
  
  color: black;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border: 0.5px solid #28a745; ;
  border-radius: 4px;
  background-color: #28a745;
  margin-left:20px;
  margin-top: 10px;
  color :#fff;
  margin-bottom: 20px;
}
#c{
   padding-top:  15px;
}
#b{
    border: 0.5px solid #b3b3b3 ;
    border-radius: 10px;   
    padding-left: 10px;
     
}      
#a{
   padding-top: 18px;
}
.row{
    display: flex;
    
    min-height: 42px;
    min-width: 72vw;
   
}
.inputform{
    margin-left:20px;
  
     margin-bottom: 10px;
}
#des{
    height: 100px;
    border: 0.5px solid #b3b3b3 ;
    border-radius: 10px;   
    padding-left: 10px;
}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title> 
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
                            <h3 id ="a">First Name</h3>
                        </div>
                        <input type ="text" name ="firstname" class = "row" id ="b" placeholder="Enter the first name"/>
                        <div class = row>
                            <h3 id ="a">Last Name</h3> 
                        </div>
                        <input type ="text" name ="lastname" class = "row" id ="b" placeholder="Enter the last name"/>
                        <div class = "row">
                            <h3 id ="a">Email</h3>
                        </div>
                        <div class = "row">
                        <p id ="c">  your_email@example.com </p>
                        </div>
                        <div class = "row">
                            <h3 id ="a">Phone</h3>
                        </div>
                        <input type ="text" name ="phone" class = "row" id ="b" placeholder="Enter your phone number"/>
                        <div class = "row">
                            <h3 id ="a">Description</h3>
                        </div>
                        <textarea type ="text"name ="description" class = "row"  id ="des"></textarea>
                    </div>
             <input type="submit" value ="Submit Button" id ="button"/> 
             <input type="submit" value ="Reset Button" id ="button"/> <br>
				</form>
        </div>
   		</div>
    
    
   
	</body>
</html>
          