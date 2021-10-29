package model;

import dao.DAL;
import java.sql.ResultSet;
public class Content {
	DAL dal;
	public Content() 
	{
		dal=new DAL();
	}
	public ResultSet getAllContent() 
	{
		return dal.getData("Select Title,Brief,CreateDate From Content");
	}
}
