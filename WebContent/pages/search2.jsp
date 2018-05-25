<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellpadding="5" cellspacing="5">
		<tr>
			<th>Emp ID</th>
			<th>Emp Name</th>
			<th>Salary</th>
			<th>Dept Name</th>
		</tr>

		<c:forEach var="book" items="${bookList}">
			<tr>
				<td>${book.bookId}</td>
				<td>${book.title}</td>
				<td>${book.pageNO}</td>
			</tr>
		</c:forEach>
	</table>

	<%--For displaying Previous link except for the 1st page --%>
	<c:if test="${currentPage != 1}">
		<td><a href="book.do?page=${currentPage - 1}">Previous</a></td>
	</c:if>

	<%--For displaying Page numbers. 
    The when condition does not display a link for the current page--%>
	<table border="1" cellpadding="5" cellspacing="5">
		<tr>
			<c:forEach begin="1" end="${noOfPages}" var="i">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<td>${i}</td>
					</c:when>
					<c:otherwise>
						<td><a href="book.do?page=${i}">${i}</a></td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tr>
	</table>

	<%--For displaying Next link --%>
	<c:if test="${currentPage lt noOfPages}">
		<td><a href="book.do?page=${currentPage + 1}">Next</a></td>
	</c:if>
</body>
</html>