
<%@page import="com.marlabs.bean.EmployeeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
</head>
<body>
	<%
	// Scriptlet holds the business logic --> _jspService(){  }
		System.out.println(" Inside scriptlet ");
		int empNumber = Integer.parseInt(request.getParameter("empNumber"));
		String empName = request.getParameter("empName");
		double salary = Double.parseDouble(request.getParameter("empSalary"));
		int deptNumber = Integer.parseInt(request.getParameter("deptNumber"));
		
		EmployeeBean employeeBean = new EmployeeBean();
		employeeBean.setEmpNumber(empNumber);
		employeeBean.setEmpName(empName);
		employeeBean.setEmpSalary(salary);
		employeeBean.setDeptNumber(deptNumber);
		
		boolean registrationFlag = employeeBean.registerEmployee();
		if(registrationFlag){
			
	%>
	
	<h2>	
		<font color="green">Employee Registered Successfully with Number:  <%= empNumber %>
		</font>
	</h2>
	<% } else { %>
	<h2>	
		<font color="red">Employee Registration failed <%= empNumber %>
		</font>
	</h2>
	
	<% } %>
	
</body>
</html>