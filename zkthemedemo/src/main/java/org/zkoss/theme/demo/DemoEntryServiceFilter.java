package org.zkoss.theme.demo;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.zkoss.web.servlet.Servlets;

public class DemoEntryServiceFilter implements Filter {
	
	/* package */static ServletContext servletContext;

	public void init(FilterConfig filterConfig) throws ServletException {
		servletContext = filterConfig.getServletContext();	
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest htReq = ((HttpServletRequest) request);

		String uri = htReq.getRequestURI();
		String context = htReq.getContextPath();
		String path = uri.replaceFirst(context, "");
		
		if (path != null && path.length() > 1 && path.startsWith("/") &&
				path.indexOf('.') == -1 && !path.contains("/zkau") && !path.equals("/demo/")) {
			request.setAttribute("topic", path.substring(1));
			Servlets.forward(servletContext, request, response, "/demo/index.zul");
			return;
		}
		chain.doFilter(request, response);
	}

	public void destroy() {	
	}
}

