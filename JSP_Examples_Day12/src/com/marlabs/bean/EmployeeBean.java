package com.marlabs.bean;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

public class EmployeeBean implements Serializable {

	private int empNumber;
	private String empName;
	private double empSalary;
	private int deptNumber;

	public int getEmpNumber() {
		return empNumber;
	}

	public String getEmpName() {
		return empName;
	}

	public double getEmpSalary() {
		return empSalary;
	}

	public int getDeptNumber() {
		return deptNumber;
	}

	public void setEmpNumber(int empNumber) {
		this.empNumber = empNumber;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public void setEmpSalary(double empSalary) {
		this.empSalary = empSalary;
	}

	public void setDeptNumber(int deptNumber) {
		this.deptNumber = deptNumber;
	}

	public static Connection getConnection() {
		Connection connection = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "System", "root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			// TODO: handle exception
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return connection;

	}

	public boolean registerEmployee() {

		boolean registrationFlag = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			System.out.println("CONNECTION:  " + connection);
			final String INSERT_QUERY = "INSERT INTO employee VALUES(?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(INSERT_QUERY);
			preparedStatement.setInt(1, getEmpNumber());
			preparedStatement.setString(2, getEmpName());
			preparedStatement.setDouble(3, getEmpSalary());
			preparedStatement.setInt(4, getDeptNumber());

			int updateCount = 0;
			updateCount = preparedStatement.executeUpdate();

			if (updateCount > 0) {
				registrationFlag = true;
			} else
				registrationFlag = false;

		} catch (SQLIntegrityConstraintViolationException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (preparedStatement != null)
					preparedStatement.close();
			} catch (SQLException e) {

			}

		}

		return registrationFlag;

	}

}
