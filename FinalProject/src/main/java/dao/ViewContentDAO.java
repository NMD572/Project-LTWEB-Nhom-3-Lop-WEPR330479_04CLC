package dao;

import java.sql.ResultSet;

public class ViewContentDAO {
	DAL dal;
	
	public ViewContentDAO() 
	{
		dal=new DAL();
	}
	public ResultSet getAllContent() 
	{
		return dal.getData("Select Title,Brief,CreateDate From Content");
	}
}
