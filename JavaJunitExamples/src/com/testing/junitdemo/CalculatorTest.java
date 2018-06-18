package com.testing.junitdemo;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CalculatorTest {

	private static Calculator calc;
	
	//@BeforeClass
	//@AfterClass
	
	
	@Before
	public void init() {
		System.out.println("init()");
		calc = new Calculator();
	}
	
	@After
	public void destroy() {
		System.out.println("destroy()");
		calc = null;
	}
	
	
	@Test(timeout = 50)
	// The below method is a test method
	public void testAdd() {
//		Calculator c1 = new Calculator();
		try {
			int calculatedValue = calc.add(20, 30);
			int expectedValue = 50;
			assertEquals(expectedValue, calculatedValue);
		} catch (NegativeNumberException e) {
			// TODO Auto-generated catch block
			System.out.println("Negative number");
		}
		
	}
	
	

	@Test // New test annotation without a try/catch
	public void testAdd1() {
//		Calculator c1 = new Calculator();
		
			try {
				int calculatedValue = calc.add(-20, 30);
				int expectedValue = 10;
				assertEquals(expectedValue, calculatedValue);
			} catch (NegativeNumberException e) {
				// TODO Auto-generated catch block
//				e.printStackTrace();
				System.out.println("Negative number");
			}
	}

}
