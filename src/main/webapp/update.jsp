<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String name=request.getParameter("name");
String branch=request.getParameter("branch");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String password1=request.getParameter("password");
String password2=request.getParameter("password2");
if(password1.equals(password2)){
try{
Connection conn = null;
Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizapp","root", "Kiara@373");
Statement st=null;
st=conn.createStatement();
HttpSession sess=request.getSession(false);  
if(session!=null){  
String sname=(String)sess.getAttribute("name");
st.executeUpdate("update students set sname='"+name+"',branch='"+branch+"',phone="+phone+",email='"+email+"',password='"+password1+"' where sname='"+sname+"'");
out.println("Data Updated!!");
}
}
catch(Exception e){
System.out.println(e);
}
}
else{
	out.println("Passwords are not matching!!");
}
%>
</body>
</html>