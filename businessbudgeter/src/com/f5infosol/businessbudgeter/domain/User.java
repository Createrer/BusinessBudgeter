/**
 * 
 */
package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

/**
 * @author dinesh.bhavsar
 */

public class User implements Serializable,
		org.springframework.security.core.userdetails.UserDetails, Principal {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2834523161672771047L;

	private long UserId;

	private String firstName;
	
	private String lastName;

	private String userName;

	private String password;

	private Date validAfter;
	
	private String emailID;
	
	private Long cellNo;

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}


	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	private Date ValidBefore;

	private Integer failedLoginsCount;
	
	private int companyId;
	
	private String company_name;

	public static boolean isRolePresent(
			Collection<GrantedAuthority> authorities, String role) {
		boolean isRolePresent = false;
		for (GrantedAuthority grantedAuthority : authorities) {
			isRolePresent = grantedAuthority.getAuthority().equals(role);
			if (isRolePresent)
				break;
		}
		return isRolePresent;

	}

	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();

		// ADD USER ROLES
		authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		authList.add(new SimpleGrantedAuthority("ROLE_USER"));

		return authList;
	}

	public long getUserId() {
		return UserId;
	}

	public void setUserId(long userId) {
		UserId = userId;
	}

	

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getValidAfter() {
		return validAfter;
	}

	public void setValidAfter(Date validAfter) {
		this.validAfter = validAfter;
	}

	public Date getValidBefore() {
		return ValidBefore;
	}

	public void setValidBefore(Date validBefore) {
		ValidBefore = validBefore;
	}

	public Integer getFailedLoginsCount() {
		return failedLoginsCount;
	}

	public void setFailedLoginsCount(Integer failedLoginsCount) {
		this.failedLoginsCount = failedLoginsCount;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String getPassword() {
		return this.password;
	}

	@Override
	public String getUsername() {
		return this.userName;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String getName() {
		return this.userName;
	}

	public Long getCellNo() {
		return cellNo;
	}

	public void setCellNo(Long cellNo) {
		this.cellNo = cellNo;
	}

	
}
