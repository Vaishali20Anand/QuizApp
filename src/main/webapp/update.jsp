<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Update</title>
</head>
<head>
  <title>Your Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
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
out.println("<b>"+"Data Updated!!"+"</b><br/><br/>");
out.println("Click <a href='login.html'>HERE</a> to login again !!!!"+"</b><br/><br/>");
out.println("<img src='https://www.pngkit.com/png/full/675-6752489_like-big-like-comment-likes-namaskaar-youtube-like.png' width='500' height='500'>");

}
}
catch(Exception e){
System.out.println(e);
}
}
else{
	out.println("Passwords are not matching!!");
	out.println("Click <a href='forget.html'>HERE</a> to reset again !!!!"+"</b><br/><br/>");
}
%>
</body>
</html>