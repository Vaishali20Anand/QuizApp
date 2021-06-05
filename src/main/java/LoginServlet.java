import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String n=request.getParameter("sname");
		String p=request.getParameter("password");
		
		if(LoginDao.validate(n,p)) {
			HttpSession sess=request.getSession();
			sess.setAttribute("name",n);
			sess.setAttribute("password",p);
			response.sendRedirect("Home.html");
		}
		else {
			out.print("Username or Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("login.html");
			rd.include(request, response);
		}
		
		out.close();
	}

}
