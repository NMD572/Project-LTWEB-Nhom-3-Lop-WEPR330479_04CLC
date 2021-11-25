package model;

public class Content {
	private int id;
	private String title;
	private String brief;
	private String content;
	private String createDate;
	private String updateTime;
	private String sort;
	private int authorID;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getAuthorID() {
		return authorID;
	}

	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}

	public Content(int id)
	{
		super();
		this.id = id;
	}
	
	public Content(String title, String brief, String content) {
		super();
		this.title = title;
		this.brief = brief;
		this.content = content;
	}

	public Content(int id, String title, String brief, String content) {
		super();
		this.id = id;
		this.title = title;
		this.brief = brief;
		this.content = content;
	}
	

	public Content(int id, String title, String brief, String createDate, int mode) {
		super();
		this.id = id;
		this.title = title;
		this.brief = brief;
		this.createDate = createDate;
	}
	
	public Content(String title, String brief, String content, int authorID) {
		super();
		this.title = title;
		this.brief = brief;
		this.content = content;
		this.authorID = authorID;
	}	
}
