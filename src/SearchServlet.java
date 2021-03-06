
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dao.Book;
import dao.BookDAO;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet(name = "showBooks", urlPatterns = { "/SearchServlet", "/search" })
public class SearchServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/books-base")
	DataSource ds;

	public SearchServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		int page = 1;
		int recordsPerPage = 5;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		BookDAO dao = new BookDAO();
		List<Book> list = dao.viewAllBooks((page - 1) * recordsPerPage, recordsPerPage, ds);
		int noOfRecords = dao.getNoOfRecords(ds);
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		request.setAttribute("bookList", list);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		// request.getRequestDispatcher("/hello.jsp").forward(request, response);
		RequestDispatcher view = request.getRequestDispatcher("/pages/search2.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
