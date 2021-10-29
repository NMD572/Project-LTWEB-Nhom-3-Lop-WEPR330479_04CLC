package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.Member;

public class RegisterDAO {

DAL dal ;
	
	public RegisterDAO() 
	{
		dal=new DAL();
	}
	
	 public String Register(Member regis,String repassword)
     {
         String Username = regis.getUsername(); //Assign user entered values to temporary variables.
         String Password = regis.getPassword();
         String Email = regis.getEmail();
         int id =0;
         
         ResultSet resultSet = null;
         ResultSet resultSetId = null; 
         String sql ="INSERT INTO member (id, username, password,email) VALUES (?,?,?,?)";
         String count ="select count(id)+1 as count from member";
         
 
         try
         {
        	 resultSetId = dal.getData(count);
        	 while(resultSetId.next()) // Until next row is present otherwise it return false
             {
              id = resultSetId.getInt("count") ;//fetch the values present in database
              
             }
        	 resultSet = dal.getDataRegis(sql, id, Username, Password, Email);
        	 if( Password.equals(repassword))
             {
                return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
             }
             
         }
             catch(SQLException e)
             {
                e.printStackTrace();
             }
             return "Invalid user credentials"; // Return appropriate message in case of failure
         }
}

