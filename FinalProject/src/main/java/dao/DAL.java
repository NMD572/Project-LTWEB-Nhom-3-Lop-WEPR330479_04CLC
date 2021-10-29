package dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;

public class DAL {
	Connection con;
	Statement stsm;
	public DAL() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/dbcuoiky";
			String user="root";
			String password="0393279375";
			con=DriverManager.getConnection(url, user, password);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		catch(Exception ec)
		{
			ec.printStackTrace();
		}
	}
	public ResultSet getData(String sql) {
		stsm=null;
		try {
			stsm=con.createStatement();
			return stsm.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public ResultSet getDataRegis(String sql,int id,String username,String password,String email) {
		
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, id);
			statement.setString(2, username);
			statement.setString(3, password);
			statement.setString(4, email);
			return statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public boolean updateData(String sql)
	{
		stsm=null;
		try {
			stsm=con.createStatement();
			return stsm.executeUpdate(sql) > 0 ? true : false ;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
