import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;

public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String n=request.getParameter("sname");
		String e=request.getParameter("email");
		String m=request.getParameter("msg");
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/quizapp","root","Kiara@373");

			String sql="insert into contact(name,email,message) values(?,?,?)";

			PreparedStatement stm = con.prepareStatement(sql);

			stm.setString(1,n);
			stm.setString(2,e);
			stm.setString(3,m);

			stm.executeUpdate();
			out.println("<b>"+"Message Sent!!"+"</b><br/><br/>");
			out.println("<b>"+"Go back to <a href='index.html'>Main Page</a>"+"</b><br/><br/>");
			out.println("<img src='https://www.pngkit.com/png/full/675-6752489_like-big-like-comment-likes-namaskaar-youtube-like.png' width='500' height='500'>");

				con.close();
				}
			catch(Exception se){
				se.printStackTrace();	}// do nothing
				}//end try
}