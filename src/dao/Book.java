package dao;

public class Book {
	
	public int id;
	public String ISBN;
	public String title;
	public int pageNO;
	
	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public int getPageNO() {
		return pageNO;
	}

	public void setPageNO(int pageNO) {
		this.pageNO = pageNO;
	}

	public Book(int id, String title) {
		super();
		this.id = id;
		this.title = title;
	}

	public Book(int id, String iSBN, String title, int pageNO) {
		super();
		this.id = id;
		ISBN = iSBN;
		this.title = title;
		this.pageNO = pageNO;
	}

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

}
