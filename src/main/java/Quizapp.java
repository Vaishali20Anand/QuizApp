import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class Quizapp extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

response.setContentType("text/html");
PrintWriter out = response.getWriter();


String n=request.getParameter("sname");
String p=request.getParameter("password");
String e=request.getParameter("email");


try{
	
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/quizapp","root","Kiara@373");

String sql="insert into students(sname,password,email) values(?,?,?)";

PreparedStatement stm = con.prepareStatement(sql);

stm.setString(1,n);
stm.setString(2,p);
stm.setString(3,e);

stm.executeUpdate();
out.println("<b>"+"Registered!!"+"<br/><br/>");
out.println("Click <a href='login.html'>HERE</a> to login now!!!!"+"</b><br/><br/>");
out.println("<img src='https://www.pngkit.com/png/full/675-6752489_like-big-like-comment-likes-namaskaar-youtube-like.png' width='500' height='500'>");

	con.close();
	}
catch(Exception se){
	se.printStackTrace();	}// do nothing
	}//end try

}
