<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to books database!</title>
</head>
<body>
	 <form action="register" method="post">
		Name:<input type="text" name="userName" /><br /> Password:<input
			type="password" name="password" /><br /> Email Id:<input
			type="text" name="email" /><br /> Language: <select name="language">
			<option>Hindi</option>
			<option>English</option>
			<option>French</option>
		</select> <br /> <input type="submit" value="Submit" /> 
	</form>
	<a href="/pages/search.jsp"> search page </a>
	<a href="/pages/insert.jsp"> add page </a>
</body>
</html>