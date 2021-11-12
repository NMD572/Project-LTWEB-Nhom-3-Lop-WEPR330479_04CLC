package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Content;
import model.Member;

public class RegisterDAO {
	static DAL dal=new DAL() ;
	
	public RegisterDAO() 
	{
		
	}
	private static String insert_query = "INSERT INTO member ( username, password,email) VALUES (?,?,?)";
	private static String update_query = "UPDATE member SET Firstname = ?, Lastname = ?, Phone = ?,Description=? where id = ?";
	
	//delete this function
	

	public static void InsertMember (Member member)
	{		
		
		
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(insert_query)) 
			{  
			
				//fix: don't insert id
				
				stmt.setString(1,member.getUsername());
				stmt.setString(2,member.getPassword());
				stmt.setString(3,member.getEmail());
				stmt.executeUpdate();
				
			
				  
				cnn.close();  				  
			}
		catch(Exception e)
			{ 
				//System.out.println(e);
			e.printStackTrace();
			}			
	}
	public boolean UpdateMember(Member member) throws SQLException
	{
		boolean rowsAffected;
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(update_query)) 
		{
			stmt.setString(1,member.getFirstName()); 
			stmt.setString(2,member.getLastName());  
			stmt.setString(3,member.getPhone()); 
			stmt.setString(4,member.getDescription());
			stmt.setInt(5,member.getId());
			int i=stmt.executeUpdate();  
			rowsAffected = i > 0;	  
			cnn.close();  
		}
		return rowsAffected;
	}
}
	
	

