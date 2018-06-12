<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!// All the variables and methods declared here act as instance var and methods
	public boolean loginValidate(final String username, final String password) {
		boolean loginFlag = false;
		System.out.println("From loginvalidate() ");
		if ("admin".equals(username) && "admin@123".equals((password)))
			loginFlag = true;
		return loginFlag;
	}%>

	<%
		// The code below is all part of _jspService()
		System.out.println("From scriptlet ");
		String userName = request.getParameter("username");
		String userPassword = request.getParameter("userpassword");
		boolean loginFlag = loginValidate(userName, userPassword);
		if (loginFlag) {
	%>
	<h2>
		<font color="green"> Welcome to the User <%=userName%></font>
	</h2>
	<%
		} else {
	%>
	<h2>
		<font color="red"> Login failed <%=userName %></font>
	</h2>
	<% 
	 	}
	%>

</body>
</html>