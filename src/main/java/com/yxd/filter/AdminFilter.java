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

import com.yxd.entity.Manager;

public class AdminFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest srequest, ServletResponse sresponse, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest request = (HttpServletRequest)srequest;  
	     HttpServletResponse response = (HttpServletResponse)sresponse;  
		Manager manager =(Manager)(request.getSession().getAttribute("manager"));
		if(manager!=null)
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
