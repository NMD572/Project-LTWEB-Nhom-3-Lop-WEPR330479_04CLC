package model;

public class Content {
	private int id;
	private String Title;
	private String Brief;
	private String Content;
	private String CreateDate;
	private String UpdateTime;
	private String Sort;
	private String AuthorID;

	public Content(int id, String title, String brief, String content) {
	super();
	this.id = id;
	this.Title = title;
	this.Brief = brief;
	this.Content = content;
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
	public String getAuthorID() {
		return AuthorID;
	}
	public void setAuthorID(String authorID) {
		AuthorID = authorID;
	}
}
