package br.unip.aps.filters;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.unip.aps.dao.GenOper;
import br.unip.aps.dao.OperBD;

//@WebFilter(filterName = "LoginFilter", urlPatterns = { "/admin"})
public class AdminFilter implements Filter  {

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		Connection conn = GenOper.getStoredConnection(request);
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
		
		String login = (String) session.getAttribute("loginedUser");
		 
        String user = null;
   
 
        try {
            user = OperBD.isAdmin(conn, login);    
        } catch (SQLException e) {
            e.printStackTrace();
            e.getMessage();
        }
		
		
		if(user != "Admin") {
			res.sendRedirect(req.getContextPath() + "/home");
			System.out.println("Acesso negado!");
		} else {
            chain.doFilter(request, response);
		} 
			
	} 

}
