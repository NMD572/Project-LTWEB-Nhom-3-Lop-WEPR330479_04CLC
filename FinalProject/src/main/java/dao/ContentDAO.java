package dao;


//import java.util.ArrayList;
//import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import model.Content;
public class ContentDAO 
{
	static DAL dal=new DAL();
	private static String insert_query = "INSERT INTO content (Title, Brief, Content,CreateDate,UpdateTime,Authorld) VALUES (?, ?, ?,NOW(),NOW(),1)";
	private static String select_content_query = "SELECT * FROM content";
	private static String delete_query = "DELECT from content where id = ?";
	private static String update_query = "UPDATE content SET Title = ?, Brief = ?, Content = ? where id = ?";

	public ContentDAO(){
		
	}
	//PreparedStatement interface
	public static void InsertContent (Content content)
	{					    		
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(insert_query)) 
			{  					
				stmt.setString(1,content.getTitle());  
				stmt.setString(2,content.getBrief()); 
				stmt.setString(3,content.getContent());
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
	
	public boolean UpdateContent(Content content) throws SQLException
	{
		boolean rowsAffected;
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(update_query)) 
		{
			stmt.setString(1,content.getTitle());  
			stmt.setString(2,content.getBrief()); 
			stmt.setString(3,content.getContent());
			int i=stmt.executeUpdate();  
			rowsAffected = i > 0;	  
			cnn.close();  
		}
		return rowsAffected;
	}
	
	public static boolean DeleteContent (int id) throws SQLException
	{
		boolean rowsAffected;
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(delete_query)) 
		{
			stmt.setInt(1,id);  
			int i=stmt.executeUpdate();  
			rowsAffected = i > 0;
			cnn.close();  
		}
		return rowsAffected;
	}
	/*
	public static List<Content> selectContent()
	{
		ArrayList<Content> contents = new ArrayList<Content>();				    		
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(select_content_query)) 
		{  					
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String brief = rs.getString("brief");
				String ct = rs.getString("content");
				contents.add(new Content(id,title,brief,ct));
			}
			rs.close();
			cnn.close();  				  
		}
		catch(Exception e)
		{ 
			//System.out.println(e);
		e.printStackTrace();
		}		
		return contents;
	}
	*/
}
