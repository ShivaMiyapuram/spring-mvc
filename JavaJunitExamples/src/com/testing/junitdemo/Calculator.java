package com.testing.junitdemo;

public class Calculator {
	
	
	public int add(int a, int b) throws NegativeNumberException {
		
		if(a < 0 || b < 0) {
			throw new NegativeNumberException();
		}
			return a+b;
	}
	
	public int divide(int a, int b) {
		
		if(a < 0 || b < 0) {
			throw new NegativeNumberException();
		}
		if(b == 0)
			throw new ArithmeticException();
		
		return a / b;
		
		
	}
	

}
