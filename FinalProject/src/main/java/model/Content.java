package model;

/**
 * @author Nguyen Minh Dang
 *
 */
public class Content {
	private int id;
	private String Title;
	private String Brief;
	private String Content;
	private String CreateDate;
	private String UpdateTime;
	private String Sort;
	private int AuthorID;

	public Content(int id)
	{
		super();
		this.id = id;
	}
	
	public Content(int id, String title, String brief, String content) {
	super();
	this.id = id;
	this.Title = title;
	this.Brief = brief;
	this.Content = content;
	}

	public Content(int id, String title, String brief, String createDate, int mode) {
		super();
		this.id = id;
		Title = title;
		Brief = brief;
		CreateDate = createDate;
	}

	public Content(String title, String brief, String content, int authorID) {
		super();
		Title = title;
		Brief = brief;
		Content = content;
		AuthorID = authorID;
	}

	public Content(String title, String brief, String content) {
	super();
	this.Title = title;
	this.Brief = brief;
	this.Content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBrief() {
		return Brief;
	}
	public void setBrief(String brief) {
		Brief = brief;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(String createDate) {
		CreateDate = createDate;
	}
	public String getUpdateTime() {
		return UpdateTime;
	}
	public void setUpdateTime(String updateTime) {
		UpdateTime = updateTime;
	}
	public String getSort() {
		return Sort;
	}
	public void setSort(String sort) {
		Sort = sort;
	}
	public int getAuthorID() {
		return AuthorID;
	}
	public void setAuthorID(int authorID) {
		this.AuthorID = authorID;
	}
}
