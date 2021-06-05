<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Submit</title>
</head>
<body>
<%

int eid=1;
int last_name=2;

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
out.println("Inserting"+sid+eid+last_name+city_name);

int i=st.executeUpdate("insert into result values('"+eid+"','"+last_name+"''"+city_name+"','"+sid+"')");
out.println("Data is successfully inserted!");
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