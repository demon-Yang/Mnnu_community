package com.yxd.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxd.entity.User;

public class UserFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest srequest, ServletResponse sresponse, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest request = (HttpServletRequest)srequest;  
	     HttpServletResponse response = (HttpServletResponse)sresponse;  
		User user =(User)(request.getSession().getAttribute("user"));
		if(user!=null)
			chain.doFilter(request, response);
		else {
			response.sendRedirect("/Mnnu_community/index.jsp");
			return;
		}
	}

	@Override
	public void destroy() {
	}

}
