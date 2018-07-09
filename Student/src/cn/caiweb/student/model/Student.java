package cn.caiweb.student.model;

import java.util.Date;

public class Student {

	private String id;
	private String name;
	private String gender;
	private Date birthday;
	private String address;
	
	public Student() {}

	public Student(String name, String gender, Date birthday, String address) {
		super();
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
	}

	public Student(String id, String name, String gender, Date birthday, String address) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", gender=" + gender + ", birthday=" + birthday + ", address="
				+ address + "]";
	}
	
	
}
