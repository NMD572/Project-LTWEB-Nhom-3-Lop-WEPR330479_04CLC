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
	private static String getmember_query = "SELECT Firstname,Lastname, Email,Phone,Description from member Where id = ?";
	private static String getemail_query = "SELECT  Email from member Where Email= ?";
	//delete this function
	
	public static boolean checkEmail(String email) throws SQLException
	{
		 //String Username = login.getUsername(); //Assign user entered values to temporary variables.
        //String Password = login.getPassword();
         String emailDB = "";
         
         try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(getemail_query)) 
			{
        	 stmt.setString(1, email);
        	 ResultSet rs = stmt.executeQuery();
        	 

        	 while (rs.next())
 			{
        		 emailDB = rs.getString("Email"); //fetch the values present in database
        		 if(emailDB.equals(email))
              		return true;
              	
  
 			}
 			rs.close();
 			cnn.close();
 			
			}
		return false;
         	
	}
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
	public static void GetMember(int memberID,Member member)
    {
        
        String fNameDB = "";
        String lNameDB = "";
        String EmailDB = "";
        String PhoneDB = "";
        String DescriptionDB = "";
        
        try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(getmember_query)) 
			{
       	 stmt.setInt(1, memberID);
       	 ResultSet rs = stmt.executeQuery();
       	 
       	 while (rs.next())
			{
       		 fNameDB = rs.getString("Firstname"); //fetch the values present in database
                lNameDB = rs.getString("Lastname");
                EmailDB = rs.getString("Email");
                PhoneDB= rs.getString("Phone");
                DescriptionDB=rs.getString("Description");
                member.setFirstName(fNameDB);
                member.setLastName(lNameDB);
                member.setEmail(EmailDB);
                member.setPhone(PhoneDB);
                member.setDescription(DescriptionDB);
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
	
	

