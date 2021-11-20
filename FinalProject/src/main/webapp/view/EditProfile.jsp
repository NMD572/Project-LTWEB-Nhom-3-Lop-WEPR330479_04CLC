<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    <%@include file="/resource/MyStyle.css"%>
</style>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title> 
</head>
	<body>
        <div class = "titleedit">
            Edit Profile</div>
  		<div class ="Editprofile" id ='editform'>
            
				
        <div class="AfEdit">
				<form action ="EditUserController" method ="post" class = "editform">
                    <div class = rowedit>
                        <div class="divProfilefrom">Profile Form Elements</div>
                     </div>
                    <div class ="inputform">
                        <div class = row>
                            <h3 class ="inputedita">First Name</h3>
                        </div>
                        <div class = rowedit>
                            <input type ="text" name ="firstname" id="fname" class ="inputeditb" placeholder="Enter the first name"/>
                        </div>
                        <div class="error">
                            <span id= "fname_error"> </span>
                             </div>
                        <div class = rowedit>
                            <h3 class ="inputedita">Last Name</h3> 
                        </div>
                        <div class = rowedit>
                            <input type ="text" name ="lastname" id="lname" class ="inputeditb" placeholder="Enter the last name"/>
                        </div>
                        <div class="error">
                            <span id= "lname_error"> </span>
                             </div>
                        <div class = "rowedit">
                            <h3 class ="inputedita">Email</h3>
                        </div>
                        <div class = "rowedit">
                        <p class="displayemail">  your_email@example.com </p>
                        </div>
                        <div class = "rowedit">
                            <h3 class ="inputedita">Phone</h3>
                        </div>
                        <div class = rowedit>
                            <input type ="text" name ="phone" id="phone" class ="inputeditb" placeholder="Enter your phone number"/>
                        </div>
                        <div class="error">
                            <span id= "phone_error"> </span>
                             </div>
                        <div class = "rowedit">
                            <h3 class ="inputedita">Description</h3>
                        </div>
                        <div class = rowedit>
                            <textarea type ="text" id="des"  name ="description"  class ="inputdes"></textarea>
                        </div>
                        <div class="error">
                            <span id= "des_error"> </span>
                             </div>
                       
                    </div>
             <input type="submit" value ="Submit Button" id = "submitbt" class ="buttoneditpro"/> 
             <input type="submit" value ="Reset Button" class ="buttoneditpro"/> <br>
				</form>
        </div>
   		</div>
    
           <script> 
            const inputBtn=document.querySelector('#submitbt');
                inputBtn.addEventListener("click",(e) =>{
                    
                    var flag =true;
                    
                    const fname = document.getElementById("fname").value;
                    const lname = document.getElementById("lname").value;
                    const phone= document.getElementById("phone").value;
                    const des= document.getElementById("des").value;
                    
                    if(fname=="") 
                    {
                        showError('fname','First name can not be blank!!');
                        flag =false;
                    
                     }
                    else if(fname.length<3 || fname.length>30 ) 
                        {
                        showError('fname','Must enter from 3->30 characters');
                        flag =false;
                       
                        }
                    else 
                    {
                    showError('fname','');
                    flag = true;
                    }
                    if(lname=="") 
                    {
                        showError('lname','Last name can not be blank!!');
                        flag =false;
                    
                     }
                    else if(lname.length<3 || lname.length>30 ) 
                        {
                        showError('lname','Must enter from 3->30 characters');
                        flag =false;
                       
                        }
                        else 
                    {
                    showError('lname','');
                    flag = true;
                    }
                    if(phone=="") 
                    {
                        showError('phone','Phone can not be blank!!');
                        flag =false;
                    
                     }
                    else if(phone.length<3 || phone.length>30 ) 
                        {
                        showError('phone','Must enter from 3->30 characters');
                        flag =false;
                       
                        }
                        else 
                    {
                    showError('phone','');
                    flag = true;
                    }
                   
                    if(des=="")
                    {
                    showError('des','');
                    flag = false;
                    }
                    else if(des.length>200 ) 
                        {
                        showError('des','Must enter < 200 characters');
                        flag =false;
                       
                        }
                    else
                    {
                        showError('des','');
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
          