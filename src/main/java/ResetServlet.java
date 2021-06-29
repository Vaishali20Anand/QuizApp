import java.io.IOException;   
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;  
import jakarta.servlet.http.HttpServlet;  
import jakarta.servlet.http.HttpServletRequest;  
import jakarta.servlet.http.HttpServletResponse;  
import jakarta.servlet.http.HttpSession;  
public class ResetServlet extends HttpServlet {  
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                      throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizapp","root", "Kiara@373");

        Statement stm = con.createStatement();
        HttpSession session=request.getSession(false);  
        
        
        String email=request.getParameter("e");
        String password1=request.getParameter("p1");
        String password2=request.getParameter("p2");
        if(password1.equals(password2)){
           stm.executeUpdate("update students set password='"+password1+"' where email='"+email+"'");
        	out.println("Password Updated!!"+"<br/><br/>");
        	out.println("Go back to <a href='index.html'>Main Page</a><br/><br/>");
        	out.println("<img src='https://www.pngkit.com/png/full/675-6752489_like-big-like-comment-likes-namaskaar-youtube-like.png' width='500' height='500'>");
        	}
        	else{
        		out.println("Passwords are not matching!!");
        	}
       }
        catch (Exception e) {
			e.printStackTrace();
		}
    }  
}  