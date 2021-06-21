<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*,java.util.*"%>
    
<!doctype html>
<html lang="en">
  <head>
  	<title>Scores</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="style (2).css">

	</head>
<% 	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizapp","root", "Kiara@373");
        Statement st=con.createStatement();

        HttpSession sess=request.getSession(false);  
        if(session!=null){  
        String name=(String)sess.getAttribute("name");
        String query="SELECT * FROM STUDENTS WHERE SNAME='"+name+"'";
        ResultSet rs=st.executeQuery(query);
        rs.next();
        String sid=rs.getString("sid");
        String q="SELECT * FROM RESULT WHERE Sid='"+sid+"'"; 
        ResultSet res=st.executeQuery(q);
		
			
%>
	<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Your Score Card</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table table-striped table-hover">
						  <thead>
						    <tr>
						      <th>Sr.No.</th>
						      <th>Exam ID</th>
						      <th>Max Marks</th>
						      <th>Marks Received</th>
						      <th>Efficiency</th>
						      <th>Result</th>
						    </tr>
						  </thead>
						  <tbody>
						    <%
						    int i=1;
						    while(res.next()){
						    out.print("<tr>");
						    out.print("<th scope='row'>"+i+"</th>");
						    i++;
						    out.print("<td>"+res.getString(1)+"</td>");
						    out.print("<td>"+5+"</td>");
							out.print("<td>"+res.getString(2)+"</td>");
							out.print("<td>"+Integer.parseInt(res.getString(2))*20+"%</td>");
							out.print("<td>"+res.getString(3)+"</td>");
						    out.print("</tr>");
						}
				}
				}
				        catch(Exception e){
				        	throw e;
				        } %>
						      
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="static/js/jquery.min.js"></script>
  <script src="static/js/popper.js"></script>
  <script src="static/js/bootstrap.min.js"></script>
  <script src="static/js/main.js"></script>

	</body>
</html>

