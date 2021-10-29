package dao;

import java.sql.DriverManager;
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
			String url="jdbc:mysql://localhost/webproject";
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
