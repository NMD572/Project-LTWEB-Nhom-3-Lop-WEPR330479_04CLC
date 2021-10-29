package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.*;

public class LoginDAO {
DAL dal ;
	
	public LoginDAO() 
	{
		dal=new DAL();
	}
	
	 public String authenticateUser(Member login)
     {
         String Username = login.getUsername(); //Assign user entered values to temporary variables.
         String Password = login.getPassword();
         
         
         
         ResultSet resultSet = null;
         
         String sql ="select Username,Password from member";
         String userNameDB = "";
         String passwordDB = "";
         
 
         try
         {
        	 
        	 resultSet = dal.getData(sql);
             
             while(resultSet.next()) // Until next row is present otherwise it return false
             {
              userNameDB = resultSet.getString("Username"); //fetch the values present in database
              passwordDB = resultSet.getString("Password");
 
               if(Username.equals(userNameDB) && Password.equals(passwordDB))
               {
                  return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
               }
             }
         }
             catch(SQLException e)
             {
                e.printStackTrace();
             }
             return "Invalid user credentials"; // Return appropriate message in case of failure
         }
}
