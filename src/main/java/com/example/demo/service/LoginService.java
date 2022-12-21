package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.example.demo.model.Department;
import com.example.demo.model.Student;


@Service
public class LoginService {
	
	private static final Logger log = LoggerFactory.getLogger(LoginService.class);
	 	
	enum DeptName {
		DEPT1, DEPT2, DEPT3;
	}
	
	private static Map<String, String> authMap = new HashMap<>();
	
	static {
	authMap.put("swathi", "1234");
	authMap.put("pramila", "sls");
	}
	
	private static List<Student> studentList = new ArrayList<>();
	
	static {
		studentList.add(new Student("s1", "Blussy", 35, DeptName.DEPT1.toString()));
		studentList.add(new Student("s2", "Merry", 70, DeptName.DEPT1.toString()));
		studentList.add(new Student("s3", "Sampath", 60, DeptName.DEPT1.toString()));
		studentList.add(new Student("s4", "Tharun", 90, DeptName.DEPT1.toString()));
		studentList.add(new Student("s5", "Selvi", 30, DeptName.DEPT2.toString()));
		studentList.add(new Student("s6", "Saranya", 32, DeptName.DEPT3.toString()));
		studentList.add(new Student("s7", "Lakshmi", 70, DeptName.DEPT3.toString()));
		studentList.add(new Student("s8", "Krish", 20, DeptName.DEPT3.toString()));
	}


	public String authenticate(String username, String password) {
		try {
			if(authMap.containsKey(username) && authMap.get(username).equals(password))
					return "SUCCESS";
				return "FAILED";	
		} catch(Exception e) {
			log.info("Error while authenticating user");
			e.printStackTrace();
		}
		return "FAILED";
		
	}
	
	public void studentDetails(ModelMap model) {
		Map<String, List<Student>> deptMap = studentList.stream().collect(Collectors.groupingBy(Student::getDepartment, LinkedHashMap::new, Collectors.toList()));
		List<Department> departList = new ArrayList<>();
		try {
			for(Entry<String, List<Student>> stud : deptMap.entrySet()) {
				Department depart = new Department();
				int passedStudents = 0;
				int noofStudents = 0;
				for(Student scor: stud.getValue()) {
					noofStudents ++;
					if(scor.getMarks() >= 40)
						passedStudents ++;
				}
				double perc = 0;
				if(noofStudents!=0)
					perc = (double) passedStudents/noofStudents*100;
				depart.setDepartment(stud.getKey());
				depart.setStudent(stud.getValue());
				depart.setPass(String.format("%.2f",perc));
				depart.setTotal(noofStudents);
				departList.add(depart);
			}
			model.addAttribute("details", departList);
		} catch (Exception e) {
			log.info("Exception while calculating percentage");
			e.printStackTrace();
		}
		
	}
}
