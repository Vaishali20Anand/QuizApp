<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Submit</title>
<script type="text/javascript" src="questions.js"></script>

</head>
<body>
<%
String marks=request.getParameter("score");
int mark=Integer.parseInt(marks);
String e2=request.getParameter("id");
int ei=Integer.parseInt(e2);
String status;
if(mark<=2){
	status="FAIL";
}
else{
	status="PASS";
}
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizapp", "root", "Kiara@373");
Statement st=conn.createStatement();

HttpSession sess=request.getSession(false);  
if(session!=null){  
String name=(String)sess.getAttribute("name");
String query="SELECT * FROM STUDENTS WHERE SNAME='"+name+"'";
ResultSet rs=st.executeQuery(query);

while(rs.next()) {
String sid=rs.getString("sid");
int i=st.executeUpdate("insert into result values('"+ei+"','"+mark+"','"+status+"','"+sid+"')");
out.println("<b>"+"Quiz Submitted Successfully!!!!!"+"</b><br/><br/>");
out.println("<b>"+"Go back to <a href='Home.html'>Home page</a> !!!!!"+"</b><br/><br/>");
out.println("<img src='https://www.pngkit.com/png/full/675-6752489_like-big-like-comment-likes-namaskaar-youtube-like.png' width='500' height='500'>");

}
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

</body>
</html>