package Wrapper;

import java.util.ArrayList;
import java.util.List;

public class _Quiz_09 {

	public static void main(String[] args) {

		/*
		 * ArrayList를 이용하여 학샐별 프로그래밍 언어 자격증 취득 정보를 관리하고
		 * 자바 자격증을 보유한학생이름을 출력하세요
		 * 
		 */
		List<Student> stu = new ArrayList<>();
		stu.add(new Student("유재석", "파이썬"));
		stu.add(new Student("박명수", "자바"));
		stu.add(new Student("김종국", "자바"));
		stu.add(new Student("조세호", "C"));
		stu.add(new Student("서장훈", "파이썬"));
		
		for(Student n : stu) {
			if(n.cer.contains("자바")) {
				System.out.println(n.name);
			}
		}
		
		
	}
}

class Student{
	public String name;
	public String cer;
	public Student(String name, String cer) {
		super();
		this.name = name;
		this.cer = cer;
	}
}