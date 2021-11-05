package dao;



import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Content;
public class ContentDAO 
{
	static DAL dal=new DAL();
	private static String insert_query = "INSERT INTO content (Title, Brief, Content,CreateDate,UpdateTime,AuthorId) VALUES (?, ?, ?,NOW(),NOW(),?)";
	private static String select_all_content_query = "Select ID,STT, Title, Brief, DATE_FORMAT(CreateDate, \"%d/%m/%Y %H:%i\") as CreateDate From (Select ID,@rownum := @rownum + 1 AS STT,Title,Brief, CreateDate From Content,(SELECT @rownum := 0) r Order by CreateDate desc) as A;";
	private static String select_content_For_Member_query = "Select ID,STT, Title, Brief, DATE_FORMAT(CreateDate, \"%d/%m/%Y %H:%i\") as CreateDate From (Select ID,@rownum := @rownum + 1 AS STT,Title,Brief,CreateDate From Content,(SELECT @rownum := 0) r Where Content.AuthorId=1 Order by CreateDate desc) as A;";
	private static String delete_query = "DELECT from content where id = ?";
	private static String update_query = "UPDATE content SET Title = ?, Brief = ?, Content = ? where id = ?";
	private static String searchAllContent_Procedure = "{ CALL searchAllContent(?) }";
	private static String searchContentForMember_Procedure = "{ CALL searchContentForMember(?,?) }";

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
				stmt.setInt(4, content.getAuthorID());
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
	
	public List<Content> getAllContent()
	{
		List<Content> contents = new ArrayList<Content>();				    		
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(select_all_content_query)) 
		{  					
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt("ID");
				int stt=rs.getInt("STT");
				String title = rs.getString("Title");
				String brief = rs.getString("Brief");
				String createdate = rs.getString("CreateDate");
				contents.add(new Content(id,stt,title,brief,createdate));
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
	public List<Content> getContentForMember(int memberID)
	{
		List<Content> contents = new ArrayList<Content>();				    		
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(select_content_For_Member_query)) 
		{
			stmt.setInt(1, memberID);
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt("ID");
				int stt=rs.getInt("STT");
				String title = rs.getString("Title");
				String brief = rs.getString("Brief");
				String createdate =rs.getString("CreateDate");
				contents.add(new Content(id,stt,title,brief,createdate));
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
	public List<Content> searchAllContent(String search)
	{
		List<Content> contents = new ArrayList<Content>();				    		
		try (Connection cnn = dal.getConnection() ; CallableStatement stmt = cnn.prepareCall(searchAllContent_Procedure)) 
		{
			stmt.setString(1, search);
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt("ID");
				int stt=rs.getInt("STT");
				String title = rs.getString("Title");
				String brief = rs.getString("Brief");
				String createdate =rs.getString("CreateDate");
				contents.add(new Content(id,stt,title,brief,createdate));
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
	public List<Content> searchContentForMember(int memberID,String search)
	{
		
		List<Content> contents = new ArrayList<Content>();				    		
		try (Connection cnn = dal.getConnection() ; CallableStatement stmt = cnn.prepareCall(searchContentForMember_Procedure)) 
		{
			stmt.setInt(1, memberID);
			stmt.setString(2, search);
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt("ID");
				int stt=rs.getInt("STT");
				String title = rs.getString("Title");
				String brief = rs.getString("Brief");
				String createdate =rs.getString("CreateDate");
				contents.add(new Content(id,stt,title,brief,createdate));
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
}
