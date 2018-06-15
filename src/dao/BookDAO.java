package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

public class BookDAO {
	/*
	 * @Resource(name = "jdbc/books-base") DataSource ds;
	 */

	public List<Book> viewAllBooks(int i, int recordsPerPage, DataSource ds) {
		ArrayList<Book> list = new ArrayList<>();
		try {
			Connection conn = ds.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM BOOK LIMIT " + i + ", " + recordsPerPage);
			int id;
			String title;
			int pageNO;
			String ibsn;
			while (rs.next()) {
				id = rs.getInt(1);
				title = rs.getString(2);
				pageNO = rs.getInt(3);
				ibsn = rs.getString(4);
				list.add(new Book(id, ibsn, title, pageNO));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public int getNoOfRecords(DataSource ds) {
		int result = 0;
		try {
			ResultSet rs = query("select count(id) from book;", ds);
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getNoOfTitleRecords(String title, DataSource ds) {
		int result = 0;
		try {
			ResultSet rs = query("select count(*) from book where title like '%" + title + "%'", ds);
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Book> searchTitle(int i, int recordsPerPage, String stitle, DataSource ds) {
		ArrayList<Book> list = new ArrayList<>();
		try {
			ResultSet rs = query(
					"select * from book where title like '%" + stitle + "%' limit " + +i + ", " + recordsPerPage, ds);
			int id;
			String title;
			int pageNO;
			String ibsn;
			while (rs.next()) {
				id = rs.getInt(1);
				title = rs.getString(2);
				pageNO = rs.getInt(3);
				ibsn = rs.getString(4);
				list.add(new Book(id, ibsn, title, pageNO));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	private ResultSet query(String query, DataSource ds) throws SQLException {
		Connection conn = ds.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		return rs;
	}
}
