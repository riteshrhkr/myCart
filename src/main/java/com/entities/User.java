package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userPassword;
	private String userPic;
	@Column(length = 1500)
	private String userAddress;
	private String userType;
	private boolean userBlocked;

	public User() {
		super();
		this.userName = "";
		this.userPhone = "";
		this.userEmail = "";
		this.userPassword = "";
		this.userAddress = "";

		this.userPic = "default.png";
		this.userType = "normal";
		this.userBlocked = false;
	}

	public User(String userName, String userPhone, String userEmail, String userPassword, String userAddress) {
		super();
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userAddress = userAddress;

		this.userPic = "default.png";
		this.userType = "normal";
		this.userBlocked = false;

	}

	//	Getters and Setters
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPic() {
		return userPic;
	}

	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public boolean isUserBlocked() {
		return userBlocked;
	}

	public void setUserBlocked(boolean userBlocked) {
		this.userBlocked = userBlocked;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPhone=" + userPhone + ", userEmail="
				+ userEmail + ", userPassword=" + userPassword + ", userPic=" + userPic + ", userAddress=" + userAddress
				+ ", userType=" + userType + ", userBlocked=" + userBlocked + "]";
	}

}
