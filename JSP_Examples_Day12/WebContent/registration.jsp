<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.lang.Exception"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
</head>
<body>

	<%!
	// similar to instance variables and instance methods
	private Connection connection;
	private PreparedStatement pstStatement;
	public void jspInit(){
		System.out.println("I'm inside jspInit() ");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "System", "root");
			
			pstStatement = connection.prepareStatement("INSERT INTO employee values(?, ?, ?, ?)");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			// TODO: handle exception
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	public void jspDestroy(){
		
		System.out.println("inside destroy() ");
		try{
			if(pstStatement != null)
				pstStatement.close();
			if(connection != null)
				connection.close();
		}
		catch(SQLException e){
			System.out.println("SQL Exception occured ");
		}
		
		
	}
	
	%>


	<%
	// Scriptlet holds the business logic --> _jspService(){  }
		System.out.println(" Inside scriptlet ");
		int empNumber = Integer.parseInt(request.getParameter("empNumber"));
		String empName = request.getParameter("empName");
		double salary = Double.parseDouble(request.getParameter("empSalary"));
		int deptNumber = Integer.parseInt(request.getParameter("deptNumber"));
		
		try{
			pstStatement.setInt(1, empNumber);
			pstStatement.setString(2, empName);
			pstStatement.setDouble(3, salary);
			pstStatement.setInt(4, deptNumber);
			int updateCount = 0;
			updateCount = pstStatement.executeUpdate();
			if(updateCount > 0){
				out.println("Employee record inserted successfully --> " + empName);
			}
			
		}
		catch(SQLException e){
			System.out.println("Exception occured");
		}
	%>
	
</body>
</html>