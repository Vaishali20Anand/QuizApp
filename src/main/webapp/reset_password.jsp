<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizapp","root","Kiara@373");
Statement st=con.createStatement();
String email=request.getParameter("email");
String strQuery = "SELECT password FROM students where email='"+email+"'";
ResultSet rs = st.executeQuery(strQuery);
while(rs.next()){
String Countrow = rs.getString(0);
if(Countrow.equals("1")){
	out.print("hello");
}
out.println("Password send to your email id successfully !");

}
}
catch (Exception e){
e.printStackTrace();
}
%>

</html>