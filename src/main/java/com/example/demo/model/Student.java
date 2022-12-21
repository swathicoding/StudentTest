package com.example.demo.model;

public class Student {

	private String department;
	private String id;
	private String name;
	private Float mark;
	
	public Student (String id, String name, float marks, String dept1) {
		this.department = dept1;
		this.name = name;
		this.mark = marks;
		this.id = id;
	}
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String depart) {
		department = depart;
	}
	public String getStudentId() {
		return id;
	}
	public void setStudentId(String studentId) {
		id = studentId;
	}
	public String getStudentName() {
		return name;
	}
	public void setStudentName(String studentName) {
		name = studentName;
	}
	public float getMarks() {
		return mark;
	}
	public void setMarks(float marks) {
		mark = marks;
	}
}
