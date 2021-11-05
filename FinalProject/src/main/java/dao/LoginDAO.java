package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.*;

public class LoginDAO {
	static DAL dal=new DAL() ;
	
	public LoginDAO() 
	{
		
	}
	private static String getID ="select id from member Where username=? ";
	private static String sql ="select Username,Password from member Where username=?";
	public int getUserID(String username)
	{
		int id=5;
		Connection connection = dal.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(getID);
			preparedStatement.setString(1, username);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next())
			{
				 id = rs.getInt("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	//fix: chi lay thong tin chu khong xu ly
	 public static void authenticateUser(Member login)
     {
         //String Username = login.getUsername(); //Assign user entered values to temporary variables.
        //String Password = login.getPassword();
         String userNameDB = "";
         String passwordDB = "";
         try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(sql)) 
			{  			
        	 ResultSet rs = stmt.executeQuery();
        	 stmt.setString(1, login.getUsername());

        	 while (rs.next())
 			{
        		 userNameDB = rs.getString("Username"); //fetch the values present in database
                 passwordDB = rs.getString("Password");
                 login.setUsername(userNameDB);
                 login.setPassword(passwordDB);
 			}
 			rs.close();
 			cnn.close();  	
			}
		catch(Exception e)
			{ 
				//System.out.println(e);
				e.printStackTrace();
			}		
 
//         try
//         {
//        	 //fix
//        	 //resultSet = dal.getData(sql);
//             
//             while(resultSet.next()) // Until next row is present otherwise it return false
//             {
//              userNameDB = resultSet.getString("Username"); //fetch the values present in database
//              passwordDB = resultSet.getString("Password");
//              
//               if(Username.equals(userNameDB) && Password.equals(passwordDB))
//               {
//                  return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
//               }
//             }
//         }
//             catch(SQLException e)
//             {
//                e.printStackTrace();
//             }
//             return "Invalid user credentials"; // Return appropriate message in case of failure
     }
}
