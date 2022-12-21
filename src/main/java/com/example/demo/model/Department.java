package com.example.demo.model;

import java.util.List;

public class Department {

	private String departName;
	private List<Student> student;
	private String pass;
	private int total;
	
	public String getDepartment() {
		return departName;
	}
	public void setDepartment(String depart) {
		departName = depart;
	}
	public List<Student> getStudent() {
		return student;
	}
	public void setStudent(List<Student> student) {
		this.student = student;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String perc) {
		pass = perc;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
}
