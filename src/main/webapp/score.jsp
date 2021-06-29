<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*,java.util.*"%>
    
<!doctype html>
<html lang="en">
  <head>
  	<title>Scores</title>
  	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="page_type" content="np-template-header-footer-from-plugin">
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Home.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js"></script>
    <script class="u-script" type="text/javascript" src="nicepage.js"></script>
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"url": "index.html",
		"logo": "images/default-logo.png"
}</script>
    <meta charset="utf-8">
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="style (2).css">

	</head>
<header class="u-clearfix u-header u-header" id="sec-e0f0">
  <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <a href="index.html" class="u-image u-logo u-image-1">
          <img src="images/default-logo.png" class="u-logo-image u-logo-image-1">
        </a>
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="letter-spacing: 0px;">
            <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
              <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs>
              <symbol id="menu-hamburger" viewBox="0 0 16 16" style="width: 16px; height: 16px;">
              <rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</symbol>
</defs></svg>
            </a>
          </div>
          <div class="u-nav-container">
            <ul class="u-nav u-unstyled u-nav-1">
            <li class="u-nav-item">
            <a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="Home.html" style="padding: 10px 20px; font-size:16px;">Home</a>
</li>
<li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="profile.jsp" style="padding: 10px 20px;font-size:16px;">View Profile</a>
</li>
<li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="logout" style="padding: 10px 20px;font-size:16px;">Logout</a>
</li></ul>
          </div>
          <div class="u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Home.html">Home</a>
</li><br><li class="u-nav-item"><a class="u-button-style u-nav-link" href="profile.jsp">View Profile</a>
</li><br><li class="u-nav-item"><a class="u-button-style u-nav-link" href="logout">Logout</a>
</li><br></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
      </div></header>

	<body>
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

