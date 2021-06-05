import java.sql.*;

public class LoginDao {
	public static boolean validate(String name,String password) {
		boolean status=false;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/quizapp","root","Kiara@373");
			
			PreparedStatement ps=con.prepareStatement("SELECT * FROM students WHERE sname=? and password=?");
			ps.setString(1,name);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			status=rs.next();
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return status;

	}
}
