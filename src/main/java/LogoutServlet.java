import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
//@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		HttpSession session= request.getSession();
		session.invalidate();
		out.print("<b>"+"You logged out successfully!!!"+"<br/><br/>");
		out.print("Click <a href='login.html'>HERE</a> to login again!!!!"+"</b><br/><br/>");
		out.println("<img src='https://www.pngkit.com/png/full/675-6752489_like-big-like-comment-likes-namaskaar-youtube-like.png' width='500' height='500'>");
		out.close();
	}


}
