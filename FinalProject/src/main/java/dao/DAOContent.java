package dao;

import java.sql.ResultSet;

public class DAOContent {
	DAL dal;
	
	public DAOContent() 
	{
		dal=new DAL();
	}
	public ResultSet getAllContent() 
	{
		return dal.getData("Select Title,Brief,CreateDate From Content");
	}
}
