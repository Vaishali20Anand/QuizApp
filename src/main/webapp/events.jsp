<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Events</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Page-1.css" media="screen">
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
  </head>
  <body class="u-body u-gradient" style="background-image: linear-gradient(#478ac9, white);"><header class="u-clearfix u-header u-header" id="sec-e0f0"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <a href="index.html" class="u-image u-logo u-image-1">
          <img src="images/default-logo.png" class="u-logo-image u-logo-image-1">
        </a>
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
            <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
              <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
              <defs><symbol id="menu-hamburger" viewBox="0 0 16 16" style="width: 16px; height: 16px;">
              <rect y="1" width="16" height="2"></rect>
              <rect y="7" width="16" height="2"></rect>
              <rect y="13" width="16" height="2"></rect>
</symbol>
</defs></svg>
            </a>
          </div>
          <div class="u-custom-menu u-nav-container">
            <ul class="u-nav u-unstyled u-nav-1">
            <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base" href="contact.html" style="padding: 10px 20px; color:white;">Contact</a></li>
            <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base" href="index.html" style="padding: 10px 20px; color:white;">Main Page</a></li>
<li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base" href="events.jsp" style="padding: 10px 20px; color:white;">Updates</a></li></ul>
          </div>
          <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2">
                <li class="u-nav-item"><a class="u-button-style u-nav-link" href="contact.html" style="padding: 10px 20px;">Contact</a>
</li><br>     <li class="u-nav-item"><a class="u-button-style u-nav-link" href="index.html" style="padding: 10px 20px;">Main Page</a>
</li><br><li class="u-nav-item"><a class="u-button-style u-nav-link" href="events.jsp" style="padding: 10px 20px;">Updates</a>
</li><br></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
      </div></header>
      <%  try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizapp","root", "Kiara@373");

	        Statement stm = con.createStatement();	        		        
	        String query="SELECT * FROM exam where date>now()";
	        ResultSet rs=stm.executeQuery(query);
	        
	        while(rs.next()) {
	   %>
			<section class="u-clearfix u-section-1" id="sec-9c42">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-align-left u-border-3 u-border-palette-1-dark-1 u-container-style u-expanded-width u-group u-left-0 u-palette-5-light-3 u-radius-22 u-shape-round u-group-1" style="margin:20px">
          <div class="u-container-layout u-valign-middle u-container-layout-1">
          
        <div class="u-clearfix u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-align-left u-container-style u-layout-cell u-left-cell u-size-44 u-layout-cell-1">
                <div class="u-container-layout u-valign-middle-xl u-container-layout-2">
        
                  <h3 class="u-text u-text-1" style="margin:10px;"><%out.println(rs.getString("ename")); %></h3>
                  <p class="u-text u-text-2">Maximum Marks <% out.println(rs.getString("max_marks")+".00"); %></p>
                </div>
              </div>
              <div class="u-align-left u-container-style u-layout-cell u-right-cell u-size-16 u-layout-cell-2">
                <div class="u-container-layout u-valign-middle-xl u-valign-top-sm u-container-layout-3">
                <a href="#" class="u-black u-btn u-button-style u-btn-1"><% out.println(rs.getString("date")); %></a>              </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
        </div>
    </section>
               <%    
	       }
	        out.close();  
	        }
	        catch (Exception e) {
				throw e;
			}  %>
</html>