<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>User Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
       <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Home.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js"></script>
    <script class="u-script" type="text/javascript" src="nicepage.js"></script>
    <meta name="generator" content="Nicepage 3.15.3, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
</head>
<body>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<head>
  <title>Your Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
 <header class="u-clearfix u-header u-header" id="sec-e0f0">
  <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <a href="https://nicepage.com" class="u-image u-logo u-image-1">
          <img src="images/default-logo.png" class="u-logo-image u-logo-image-1">
        </a>
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
            <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
              <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><symbol id="menu-hamburger" viewBox="0 0 16 16" style="width: 16px; height: 16px;"><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</symbol>
</defs></svg>
            </a>
          </div>
          <div class="u-nav-container">
            <ul class="u-nav u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="Home.html" style="padding: 10px 20px;">Home</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="profile.jsp" style="padding: 10px 20px;">Profile</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="logout.html" style="padding: 10px 20px;">Logout</a>
</li></ul>
          </div>
          <div class="u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Home.html">Home</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="profile.jsp">Profile</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="logout.html">Logout</a>
</li></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
      </div></header>

  <%
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizapp","root", "Kiara@373");
        Statement st=con.createStatement();

        HttpSession sess=request.getSession(false);  
        if(session!=null){  
        String name=(String)sess.getAttribute("name");
        String query="SELECT * FROM STUDENTS WHERE SNAME='"+name+"'";
        ResultSet rs=st.executeQuery(query);
        String sid;
        
        while(rs.next()){
        	
%>
 <form class="form" action = "update.jsp" method = "get" id="registrationForm" enctype = "multipart/form-data">
<hr>
<div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-10"><h1></h1></div>
    	<div class="col-sm-2"><img title="profile image" class="img-circle img-responsive" src="images/et-min.jpg" alt="No image saved"></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->


      <div class="text-center">
        <img src="images/et-min.jpg" class="avatar img-circle img-thumbnail" alt="avatar">
          <h6>Upload a different photo...</h6>
   <!--     <input type="file" name="uploadfile" class="text-center center-block file-upload">  -->
      </div><br>


        </div><!--/col-3-->
    	<div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Profile</a></li>
                <li><a data-toggle="tab" href="#messages"></a></li>
                <li><a data-toggle="tab" href="#settings"></a></li>
              </ul>


          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>

                      <div class="form-group">
                        <div class="col-xs-6">
                           <h4><label for="sname">Name</label></h4>
                            <input type="text" class="form-control" name="name" id="sname" placeholder="<% out.print(name);%>">
                        </div>
                    </div>

                          <div class="col-xs-6">
                              <h4><label for="branch">Branch</label></h4>
                              <input type="text" class="form-control" name="branch" id="branch" placeholder="<% out.print(rs.getString("branch"));%>">
                          </div>
                      </div>
                      <div class="form-group">

                      <div class="form-group">

                          <div class="col-xs-6">
                              <h4><label for="phone">Phone</label></h4>
                              <input type="text" class="form-control" name="phone" id="phone" placeholder="<% out.print(rs.getString("phone"));%>">
                          </div>
                      </div>


                          <div class="col-xs-6">
                              <h4><label for="email">Email</label></h4>
                              <input type="email" class="form-control" name="email" id="email" placeholder="<% out.print(rs.getString("email"));%>">
                          </div>
                      </div>
                  
                      <div class="form-group">

                          <div class="col-xs-6">
                              <h4><label for="password">Password</label></h4>
                              <input type="password" class="form-control" name="password" id="password" placeholder="password">
                          </div>
                      </div>
                      <div class="form-group">

                          <div class="col-xs-6">
                            <h4><label for="password2">Verify</label></h4>
                              <input type="password" class="form-control" name="password2" id="password2" placeholder="password2">
                          </div>
                      </div>
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-lg btn-success" type="submit" name="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                               	<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                            </div>
                      </div>
                      </div>
                      </div>
                      </div>
                      </div>
              	</form>
              	<%      }
        }
        else{
        	out.print("Login to Continue");
        }
        }
        
  		catch(Exception e){
  			throw e;
  		}
 %>
              <hr>
<script type="text/javascript">
$(document).ready(function() {


    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }


    $(".file-upload").on('change', function(){
        readURL(this);
    });
});
</script>

<script>
  function delete(){
	  String name=(String)sess.getAttribute("name");
      String query="DELETE FROM STUDENTS WHERE SNAME='"+name+"'";
      ResultSet rs=st.executeQuery(query);
  }</script>
</body>
</html>