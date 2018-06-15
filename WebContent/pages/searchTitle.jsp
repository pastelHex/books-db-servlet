<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<title>Book search(TM)</title>
</head>
<body>
	<div class="jumbotron text-center">
		<h1>Book search</h1>
		<p>Find books in our database!</p>
	</div>
	<div class="jumbotron">
		<h1>Title search</h1>
		<p>Enter title you wanna find:</p>
		<div class="form-group">
			<label for="usr">Title:</label> <input type="text"
				class="form-control" id="title" name="searchTitle">
		</div>
		<div class="row">
			<a href="search/title" class="btn btn-info" role="button">Search
				title</a><p> </p><a href="search" name="search" href="search"
				class="btn btn-info" role="button">All books</a>
		</div>
	</div>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>page number</th>
					<th>ISBN</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${bookList}">
					<tr>
						<td>${book.id}</td>
						<td>${book.title}</td>
						<td>${book.pageNO}</td>
						<td>${book.ISBN}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="container">
		<ul class="pagination">
			<li class="page-item"><a class="page-link"
				href="search/title?page=${currentPage - 1}">Previous</a></li>
			<li class="page-item"><a class="page-link" href="search/title">1</a></li>
			<li class="page-item"><a class="page-link"
				href="search/title?page=2">2</a></li>
			<c:if test="${noOfPages > 3}">
				<li class="page-item"><a class="page-link" href="">...</a></li>
			</c:if>
			<c:if test="${currentPage > 3}">
				<li class="page-item"><a class="page-link" href="">${currentPage}</a></li>
				<c:if test="${noOfPages > currentPage+1}">
					<li class="page-item"><a class="page-link" href="">...</a></li>
				</c:if>
			</c:if>
			<c:if test="${noOfPages > 2}">
				<li class="page-item"><a class="page-link"
					href="search/title?page=${noOfPages}">${noOfPages}</a></li>
			</c:if>
			<li class="page-item"><a class="page-link"
				href="search/title?page=${currentPage + 1}">Next</a></li>
		</ul>
	</div>
</body>
</html>