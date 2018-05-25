package dao;

import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

public class BookDAO {
	@Resource(name = "jdbc/books-base")
	DataSource ds;

	public List<BookDAO> viewAllBooks(int i, int recordsPerPage) {
		// TODO Auto-generated method stub
		return null;
	}

	public int getNoOfRecords() {
		// TODO Auto-generated method stub
		return 0;
	}
}
