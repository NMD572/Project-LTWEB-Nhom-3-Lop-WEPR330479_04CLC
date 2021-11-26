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
	private static String getID ="select id from member Where Email=? ";
	private static String sql ="select Email,Password from member Where Email=?";
	public int getUserID(String email)
	{
		int id=5;
		Connection connection = dal.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(getID);
			preparedStatement.setString(1, email);
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
         String emailDB = "";
         String passWordDB = "";
         try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(sql)) 
			{
        	 stmt.setString(1, login.getEmail());
        	 ResultSet rs = stmt.executeQuery();
        	 

        	 while (rs.next())
 			{
        		 emailDB = rs.getString("Email"); //fetch the values present in database
                 passWordDB = rs.getString("Password");
                 login.setEmail(emailDB);
                 login.setPassword(passWordDB);
 			}
 			rs.close();
 			cnn.close();  	
			}
		catch(Exception e)
			{ 
				//System.out.println(e);
				e.printStackTrace();
			}		
 

     }
}
