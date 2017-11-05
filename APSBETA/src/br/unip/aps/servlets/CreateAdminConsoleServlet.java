package br.unip.aps.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unip.aps.dao.OperBD;
import br.unip.aps.dao.GenOper;
import br.unip.aps.models.ContaUsuario;

@WebServlet(urlPatterns = { "/admincreate" })
public class CreateAdminConsoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
    public CreateAdminConsoleServlet() {
        super();
    }
 
    // Show product creation page.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/jsps/createAdminView.jsp");
        dispatcher.forward(request, response);
    }
    
 // When the user enters the product information, and click Submit.
    // This method will be called.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = GenOper.getStoredConnection(request);
 
        String matriculaStr = (String) request.getParameter("matricula");
        String nome = (String) request.getParameter("nome");
        String login = (String) request.getParameter("login");
        String senha = (String) request.getParameter("senha");
        String tipoacesso = (String) request.getParameter("tipoacesso");
        
        int matricula = 0;
        try {
            matricula = Integer.parseInt(matriculaStr);
        } catch (Exception e) {
        }
        
        ContaUsuario user = new ContaUsuario (matricula,nome,login,senha,tipoacesso);
 
 
        String errorString = null;
 
        // Product ID is the string literal [a-zA-Z_0-9]
        // with at least 1 character
        String regex = "\\w+";
 
        if (matriculaStr == null || !matriculaStr.matches(regex)) {
            errorString = "Código de matricula inválido!";
        }
 
        if (errorString == null) {
            try {
                OperBD.insertUser(conn, user);
            } catch (SQLException e) {
                e.printStackTrace();
                errorString = e.getMessage();
            }
        }
 
        // Store infomation to request attribute, before forward to views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("user", user);
 
        // If error, forward to Edit page.
        if (errorString != null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/jsps/createAdminView.jsp");
            dispatcher.forward(request, response);
        }
        // If everything nice.
        // Redirect to the product listing page.
        else {
            response.sendRedirect(request.getContextPath() + "/admin");
        }
    }
 
}
