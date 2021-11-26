package dao;



import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	private static String delete_query = "DELETE from content where id = ?";
	private static String update_query = "UPDATE content SET Title = ?, Brief = ?, Content = ? where id = ?";
	private static String getAllContent_Procedure = "{ CALL getAllContent(?,?) }";
	private static String getContentForMember_Procedure = "{ CALL getContentForMember(?,?,?) }"; 
	private static String searchAllContent_Procedure = "{ CALL searchAllContentWithPaging(?,?,?) }";
	private static String searchContentForMember_Procedure = "{ CALL searchContentForMemberWithPaging(?,?,?,?) }";
	private static String selectCountAllContent = "Select count(*) as SLContent From Content;";
	private static String selectCountContentForMember = "Select count(*) as SLContent From Content Where AuthorID=?";
	private static String selectCountAllContentForSearch = "Select count(*) as SLContent From Content Where Concat(Title,Brief,CreateDate) like Concat('%',?,'%')"; 
	private static String selectCountContentForSearchForMember = "Select count(*) as SLContent From Content Where Concat(Title,Brief,CreateDate) like Concat('%',?,'%') and AuthorID=?"; 
	private static String select_contentinfo_from_id = "Select * FROM content where id = ?";
	private static String checkAvailableContent_procedure = "{ CALL checkAvailableContent(?,?,?) }";
	public ContentDAO(){
		
	}
	
	public boolean InsertContent (Content content)
	{
		boolean rowsAffected=false;
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(insert_query)) 
			{  					
				stmt.setString(1,content.getTitle());  
				stmt.setString(2,content.getBrief()); 
				stmt.setString(3,content.getContent());
				stmt.setInt(4, content.getAuthorID());
				int i=stmt.executeUpdate();
				rowsAffected = i > 0;
				System.out.println(i+" records inserted");  
				  
				cnn.close();  				  
			}
		catch(Exception e)
			{ 
				//System.out.println(e);
				e.printStackTrace();
			}
		return rowsAffected;
	}
	
	public boolean UpdateContent(Content content) throws SQLException
	{
		boolean rowsAffected = false;
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(update_query)) 
		{

			stmt.setString(1,content.getTitle());
			stmt.setString(2,content.getBrief());
			stmt.setString(3,content.getContent());
			stmt.setInt(4, content.getId());
			int i=stmt.executeUpdate();  
			rowsAffected = i >= 0;
			cnn.close();  
		}
		catch(Exception e)
		{
			//System.out.println(e);
			e.printStackTrace();
		}
		return rowsAffected;
	}
	
	public boolean DeleteContent (int id) throws SQLException
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
	
	public List<Content> getAllContent(int offset, int limit)
	{
		List<Content> contents = new ArrayList<Content>();				    		
		try (Connection cnn = dal.getConnection() ; CallableStatement stmt = cnn.prepareCall(getAllContent_Procedure)) 
		{
			stmt.setInt(1, offset);
			stmt.setInt(2, limit);
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt("ID");
				String title = rs.getString("Title");
				String brief = rs.getString("Brief");
				String createDate = rs.getString("CreateDate");
				contents.add(new Content(id,title,brief,createDate,1));
			}
			rs.close();
			cnn.close();  				  
		}
		catch(Exception e)
		{ 
			e.printStackTrace();
		}		
		return contents;
	}
	public List<Content> getContentForMember(int memberID,int offset, int limit)
	{
		List<Content> contents = new ArrayList<Content>();				    		
		try (Connection cnn = dal.getConnection() ; CallableStatement stmt = cnn.prepareCall(getContentForMember_Procedure)) 
		{
			stmt.setInt(1, memberID);
			stmt.setInt(2, offset);
			stmt.setInt(3, limit);
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt("ID");
				String title = rs.getString("Title");
				String brief = rs.getString("Brief");
				String createDate =rs.getString("CreateDate");
				contents.add(new Content(id,title,brief,createDate,1));
			}
			rs.close();
			cnn.close();  				  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
		return contents;
	}
	public List<Content> searchAllContent(String search,int offset, int limit)
	{
		List<Content> contents = new ArrayList<Content>();				    		
		try (Connection cnn = dal.getConnection() ; CallableStatement stmt = cnn.prepareCall(searchAllContent_Procedure)) 
		{
			stmt.setString(1, search);
			stmt.setInt(2, offset);
			stmt.setInt(3, limit);
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt("ID");
				String title = rs.getString("Title");
				String brief = rs.getString("Brief");
				String createDate =rs.getString("CreateDate");
				contents.add(new Content(id,title,brief,createDate,1));
			}
			rs.close();
			cnn.close();  				  
		}
		catch(Exception e)
		{ 
			e.printStackTrace();
		}		
		return contents;
	}
	public List<Content> searchContentForMember(int memberID,String search,int offset, int limit)
	{
		List<Content> contents = new ArrayList<Content>();				    		
		try (Connection cnn = dal.getConnection() ; CallableStatement stmt = cnn.prepareCall(searchContentForMember_Procedure)) 
		{
			stmt.setInt(1, memberID);
			stmt.setString(2, search);
			stmt.setInt(3, offset);
			stmt.setInt(4, limit);
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
			{
				int id = rs.getInt("ID");
				String title = rs.getString("Title");
				String brief = rs.getString("Brief");
				String createDate =rs.getString("CreateDate");
				contents.add(new Content(id,title,brief,createDate,1));
			}
			rs.close();
			cnn.close();  				  
		}
		catch(Exception e)
		{ 
			e.printStackTrace();
		}		
		return contents;
	}
	public int countContents()
	{
		int count=0;
		try (Connection cnn = dal.getConnection() ; Statement stmt = cnn.createStatement()) 
		{
			ResultSet rs = stmt.executeQuery(selectCountAllContent);
			if(rs.next()) {
			count=rs.getInt("SLContent");
			}
			rs.close();
			cnn.close();  				  
		}
		catch(Exception e)
		{ 
			e.printStackTrace();
		}		
		return count;
	}
	public int countContentsForMember(int UserID)
	{
		int count=0;
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(selectCountContentForMember)) 
		{
			stmt.setInt(1, UserID);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
			count=rs.getInt("SLContent");
			}
			rs.close();
			cnn.close();  				  
		}
		catch(Exception e)
		{ 
			e.printStackTrace();
		}		
		return count;
	}
	public int countContentsForSearch(String search)
	{
		int count=0;
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(selectCountAllContentForSearch)) 
		{
			stmt.setString(1, search);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("SLContent");
			}
			rs.close();
			cnn.close();  				  
		}
		catch(Exception e)
		{ 
			e.printStackTrace();
		}		
		return count;
	}
	public int countContentsForSearchForMember(String search, int UserID)
	{
		int count=0;
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(selectCountContentForSearchForMember)) 
		{
			stmt.setString(1, search);
			stmt.setInt(2, UserID);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("SLContent");
			}
			rs.close();
			cnn.close();  				  
		}
		catch(Exception e)
		{ 
			e.printStackTrace();
		}		
		return count;
	}
	public Content selectContentInfo(int id)
	{
		Content ct = new Content(id);
		try (Connection cnn = dal.getConnection() ; PreparedStatement stmt = cnn.prepareStatement(select_contentinfo_from_id ))
		{
			stmt.setInt(1,id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				String title = rs.getString("Title");
				ct.setTitle(title);
				String brief = rs.getString("Brief");
				ct.setBrief(brief);
				String content = rs.getString("Content");
				ct.setContent(content);

			}
			rs.close();
			cnn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ct;
	}
	
	
	public static boolean checkAvailableContent (Content content)
	{
		boolean columnsCount = false;
		try (Connection cnn = dal.getConnection(); PreparedStatement stmt = cnn.prepareStatement(checkAvailableContent_procedure))
		{
			stmt.setString(1,content.getTitle());
			stmt.setString(2,content.getBrief());
			stmt.setString(3,content.getContent());
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
			{
				int i = rs.getRow();
				columnsCount = i > 0;
			}
			rs.close();
			cnn.close();
		}
		catch(Exception e)
		{
			//System.out.println(e);
			e.printStackTrace();
		}
		return  columnsCount;
	}
}
