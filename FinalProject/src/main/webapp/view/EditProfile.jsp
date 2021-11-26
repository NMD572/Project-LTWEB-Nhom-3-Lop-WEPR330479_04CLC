<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<style> 
    <%@include file="/resource/MyStyle.css"%>
</style>

<html>
<head>
<meta charset="UTF-8">
	<jsp:useBean id="a" class ="dao.RegisterDAO" scope ="request"> </jsp:useBean>
<title>Edit Profile</title> 
</head>
	<body onload="getggdata()">
		
        <div class = "titleedit">
            Edit Profile</div>
  		<div class ="Editprofile" id ='editform'>
            
				
        <div class="AfEdit">
            <div class = "editform">
				<form action ="EditUserController" method ="post">
                    <div class = rowedit>
                        <div class="divProfilefrom">Profile Form Elements</div>
                     </div>
                    <div class ="inputform">
                        <div class = row>
                            <h3 class ="inputedita">First Name</h3>
                        </div>
                        <div class = rowedit>
                            <input type ="text" name ="firstname" value ="${viewfname}" id="fname" class ="inputeditb" placeholder="Enter the first name"/>
                        </div>
                        <div class="error">
                            <span id= "fname_error"> </span>
                             </div>
                        <div class = rowedit>
                            <h3 class ="inputedita">Last Name</h3> 
                        </div>
                        <div class = rowedit>
                            <input type ="text" name ="lastname" value ="${viewlname}" id="lname" class ="inputeditb" placeholder="Enter the last name"/>
                        </div>
                        <div class="error">
                            <span id= "lname_error"> </span>
                             </div>
                        <div class = "rowedit">
                            <h3 class ="inputedita" ">Email</h3>
                        </div>
                        <div class = "rowedit">
                        <p class="displayemail" id ="displayemail">  <c:out value="${viewemail}"/></p>
                         <img id="image" class="rounded-circle" name="image" width="120" height="120" />
                        </div>
                        <div class = "rowedit">
                            <h3 class ="inputedita">Phone</h3>
                        </div>
                        <div class = rowedit>
                            <input type ="text" value ="${viewphone}" name ="phone" id="phone" class ="inputeditb" placeholder="Enter your phone number"/>
                        </div>
                        <div class="error">
                            <span id= "phone_error"> </span>
                             </div>
                        <div class = "rowedit">
                            <h3 class ="inputedita">Description</h3>
                        </div>
                        <div class = "rowedit">
                            <textarea type ="text" id="des"  name ="description"  class ="inputdes">${viewdes}</textarea>
                        </div>
                        <div class="error">
                            <span id= "des_error"> </span>
                             </div>
                       
                    </div>
                    <div class = "rowedit">
                        <input type="submit" value ="Submit Button" id = "submitbt" class ="buttoneditpro1"/> 
                        
                            </form>
                            <form action ="ViewMemberController" method ="post" class ="buttoneditpro1">
                        <input type="submit" value ="Reset Button" class ="buttoneditpro2" /> <br>
                            </form>
                            </div>
                              
   							 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                    
            </div>
        </div>
   		
	</body>
</html>
 <script> 
           const inputBtn=document.querySelector('#submitbt');
           inputBtn.addEventListener("click",(e) =>{
               
               var flagFname =true;
               var flagLname = true;
               var flagPhone = true;
               var flagDes= true;

               
               const fname = document.getElementById("fname").value;
               const lname = document.getElementById("lname").value;
               const phone= document.getElementById("phone").value;
               const des= document.getElementById("des").value;
               
               if(fname=="") 
               {
                   showError('fname','First name can not be blank!!');
                   flagFname =false;
               
                }
               else if(fname.length<3 || fname.length>30 ) 
                   {
                   showError('fname','Must enter from 3->30 characters');
                   flagFname =false;
                  
                   }
               else 
               {
               showError('fname','');
               flagFname = true;
               }
               if(lname=="") 
               {
                   showError('lname','Last name can not be blank!!');
                   flagLname =false;
               
                }
               else if(lname.length<3 || lname.length>30 ) 
                   {
                   showError('lname','Must enter from 3->30 characters');
                   flagLname =false;
                  
                   }
                   else 
               {
               showError('lname','');
               flagLname = true;
               }
               if(phone=="") 
               {
                   showError('phone','Phone can not be blank!!');
                   flagPhone =false;
               
                }
               else if(phone.length<3 || phone.length>30 ) 
                   {
                   showError('phone','Must enter from 3->30 characters');
                   flagPhone =false;
                  
                   }
                   else 
               {
               showError('phone','');
               flagPhone = true;
               }
              
              
               if(des.length>200 ) 
                   {
                   showError('des','Must enter < 200 characters');
                   flagDes =false;
                  
                   }
               else
               {
                   showError('des','');
               flagDes = true;
               }
              
               if(flagDes==false || flagFname==false || flagLname==false ||flagPhone==false){
                   e.preventDefault();
               }
              
              
           })
       
          
   
    
    
	     function showError(key,mess){
	         
	         document.getElementById(key+ '_error').innerHTML = mess;
	     }
           
           function getggdata(){
        	   if(sessionStorage.getItem("checkidGG")!=null){ 
        		   console.log(sessionStorage.getItem("imageGG"));
        	       $('#image').attr('src', sessionStorage.getItem("imageGG"));
        	       console.log(sessionStorage.getItem("imageGG"));
        	   }
        	   else {
        		   $('#image').css("display", "none"); 
        		   
        	   }
        	   
           }
            </script>
          