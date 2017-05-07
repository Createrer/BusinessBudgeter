package com.f5infosol.businessbudgeter.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.f5infosol.businessbudgeter.domain.User;
import com.f5infosol.businessbudgeter.exception.UserNotLoginException;

public class UserUtil {
	public static User getUser() throws UserNotLoginException {

		if (SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal() instanceof User) {
			return (User) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
		}
		else {
			throw new UserNotLoginException("User Not Login");
		}
	}
	
}
