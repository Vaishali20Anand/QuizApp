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
public class ProfileServlet extends HttpServlet {  
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
        if(session!=null){  
        String name=(String)session.getAttribute("name");
        
        String query="SELECT * FROM STUDENTS WHERE SNAME='"+name+"'";
        ResultSet rs=stm.executeQuery(query);
        
        while(rs.next()) {
        String password=rs.getString("password");
        String branch=rs.getString("branch");
        String phone=rs.getString("phone");
       out.print("Hello, "+name+" Welcome to Profile<br/>");
       out.print("Your password is "+password+"<br/>");
       out.print("Your branch is "+branch+"<br/>");
       out.print("Your phone no. is "+phone); 
       RequestDispatcher rd=request.getRequestDispatcher("profile.html");  
       rd.include(request, response);
       }
        }  
        else{  
            out.print("Please login first");  
            request.getRequestDispatcher("login.html").include(request, response);  
        }  
        out.close();  
        }
        catch (Exception e) {
			e.printStackTrace();
		}
    }  
}  