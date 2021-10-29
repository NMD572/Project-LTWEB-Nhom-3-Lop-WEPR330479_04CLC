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
	//DAL dal ;
	private static String jdbcURL = "jdbc:mysql://localhost/dbcuoiky";
	private static String jdbcUser = "root";
	private static String jdbcPass = "19110269";
	
	private static String insert_query = "INSERT INTO member (id, username, password,email) VALUES (?,?,?,?)";
	private static String count ="select count(id)+1 as count from member";
	public static Connection getConnection()
	{	
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    String url = jdbcURL;
		    String user = jdbcUser;
		    String password = jdbcPass;
		    return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return null;
	};

	public static void InsertMember (Member member)
	{		
		ResultSet resultSet = null;
		int id=0;
		Statement stsm;
		
 	 
		
		try (Connection cnn = getConnection() ; PreparedStatement stmt = cnn.prepareStatement(insert_query)) 
			{  
			try {
				stsm=cnn.createStatement();
				resultSet= stsm.executeQuery(count);
				 while(resultSet.next()) // Until next row is present otherwise it return false
		             {
		              id = resultSet.getInt("count") ;//fetch the values present in database
		              
	             }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				stmt.setInt(1,id);  
				stmt.setString(2,member.getUsername());
				stmt.setString(3,member.getPassword());
				stmt.setString(4,member.getEmail());
				int i=stmt.executeUpdate();  
				System.out.println(i+" records inserted");  
				  
				cnn.close();  				  
			}
		catch(Exception e)
			{ 
				//System.out.println(e);
			e.printStackTrace();
			}			
	}
	
	public RegisterDAO() 
	{
		//dal=new DAL();
	}
	
//	 public String Register(Member regis,String repassword)
//     {
//         String Username = regis.getUsername(); //Assign user entered values to temporary variables.
//         String Password = regis.getPassword();
//         String Email = regis.getEmail();
//         int id =0;
//         
//         ResultSet resultSet = null;
//         ResultSet resultSetId = null; 
//         String sql ="INSERT INTO member (id, username, password,email) VALUES (?,?,?,?)";
//         String count ="select count(id)+1 as count from member";
//         
// 
//         try
//         {
//        	 resultSetId = dal.getData(count);
//        	 while(resultSetId.next()) // Until next row is present otherwise it return false
//             {
//              id = resultSetId.getInt("count") ;//fetch the values present in database
//              
//             }
//        	 resultSet = dal.getDataRegis(sql, id, Username, Password, Email);
//        	 if( Password.equals(repassword))
//             {
//                return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
//             }
//             
//         }
//             catch(SQLException e)
//             {
//                e.printStackTrace();
//             }
//             return "Invalid user credentials"; // Return appropriate message in case of failure
//         }
}

