<%@ page language="java" contentType="text/html; charset=ISO-8859-9" import="java.io.*, java.util.*, java.util.Date, java.sql.*, javax.servlet.*, java.text.* "
	pageEncoding="ISO-8859-9"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en"> <!--<![endif]-->
<head>
<jsp:include page="header.jsp" />

<title>Login - Environment Tracking Software</title>


<script type="text/javascript">

	function setFocus() {
		var input = document.getElementById("username");
		input.focus();
	}
	
</script>

</head>

<%
	// If the viewing device is not mobile, then fit the content to any screen
	if(session.getAttribute("isMobile").toString().equalsIgnoreCase("false"))
	{
  		%>
			<!-- START OF Div's to make the footer fixed at bottom and page content fixed vertically on any screen -->
			<div id="container" style="background: #FBFBFB; display: table; height: 100%; width: 100%; #position: relative; overflow: hidden;">
			<div id="body" style="#position: absolute; #top: 50%;display: table-cell; vertical-align: middle;">
			<!-- END OF Div's to make the footer fixed at bottom on any screen -->
		<%
	}
%>

<body class="withAnimation" onload="setFocus();">

<!-- FOR MOBILE DEVICES -->

<!-- left navbar -->
<div class="snap-drawers-button">
    <button type="button" class="navbar-toggle">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
</div>
<div class="snap-drawers">
    <div class="snap-drawer snap-drawer-left">
        <div>
            <div class="navbar-collapse collapse">
	                <ul class="nav navbar-nav navbar-right">
	                    <li class="active">
	                        <a href="login.jsp">Login</a>
	                    </li>
	                    <li>
	                        <a href="login.jsp?username=demo&password=demo">Demo Login</a>
	                    </li>
	                    <li>
	                        <a href="aboutUs.jsp">About</a>
	                    </li>
	                </ul>
	                <a class="btn btn-border active" style="border-color: #FF9A00; background: #FF9A00; font-size: 14px; font-weight: normal;" href="contactUs.jsp">Contact us!</a>
            </div>
        </div>
    </div>
</div>
<!-- / left navbar -->

<!-- / FOR MOBILE DEVICES -->

<!-- snap content -->
<div id="boxedWrapper" class="snap-content">

<nav class="navbar navbar-default navbar-transparent navbar-fixed-top" style="background-color: black;" role="navigation">
    <div class="container" style="position: relative; z-index: 100;">
        <div class="navbar-header">
            <button type="button" id="navbar-toggle" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp" data-logo="images/ETS-Logo.png"><img src="images/ETS-Logo.png" alt="" title=""></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right" style="position: relative; z-index: 100;">
                <li class="active dropdown">
                    <a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown">Home</a>
                </li>
                <li class="dropdown">
                    <a href="aboutUs.jsp" class="dropdown-toggle" data-toggle="dropdown">About</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Reports</a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="queryDatabase.jsp">Query<span>Query the database</span></a></li>
                        <li><a href="plotGraph.jsp">Graph<span>Plot a graph</span></a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Settings</a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="userSettings.jsp">User Settings<span>Update your profile</span></a></li>
                        <li><a href="serverSettings.jsp">Server Settings<span>Change mote settings</span></a></li>

                    </ul>
                </li>
                <li><a class="btn btn-border" style="border-color: #FF9A00; background: #FF9A00; font-size: 14px; font-weight: normal;" href="contactUs.jsp">Contact us!</a></li>
                <li><a class="btn btn-border" style="border-color: #DF2D1C; background: #DF2D1C; font-size: 14px; font-weight: normal;" href="#" onclick="return askForLogout();">Logout</a></li>
                <br/>
                <div align="right">Welcome, <a href="userSettings.jsp"><% //out.print(userName+"."); %></a></div>
                <br/>
            </ul>
        </div>
    </div>
</nav>
<!-- / navbar -->





<!-- header -->
<header class="height">

<!-- 
    <div data-image-mobile="assets/images/content/13-404page-banner.jpg" data-image="assets/images/content/13-404page-banner.jpg" data-type="parallax" data-height="400" data-stellar-background-ratio="0" class="media-section">

        <div class="display-table">
            <div class="inner">

                <div class="flexslider std-slider center-controls" data-height="" data-loop="true" data-smooth="false" data-slideshow="true" data-speed="15000" data-animspeed="550" data-controls="false" data-dircontrols="true">
                    <ul class="slides">
                        <li>
                            <div class="container">
                                <div class="text-left width inner">
                                    <h2 class="page-title animated" data-fx="fadeInDown">ABOUT US</h2>

                                    <h3 class="animated" data-fx="bounceIn">
                                        Want to learn more about the ETS and the team behind this plot?<br/>
                                        Cool, scroll down a bit and find out!
                                    </h3>
                                </div>
                            </div>
                        </li>



                    </ul>
                </div>

            </div>
        </div>
    </div>
    
     -->
     
</header>
<!-- / header -->


<%@ page import="com.marinamanagementsystem.conf.*" %>


<!--  section icon box -->
<div class="grey content-area" id="iconbuttons" style="background-color: #FBFBFB;">

 <div class="container">
 
 	<div class="row">
	    

		
		<!-- To make the whole blue area clickable
		<a href="login.jsp">
			<div style="position: absolute; top: 28.3%; right: 31%; width: 100px; height: 240px; background-color: rgba(100, 100, 100, 0.5); opacity: .0001;">
			</div>
		</a>
		 -->
			
			<%
			// If the viewing device is not mobile, then browse the login form  for computers
			if(session.getAttribute("isMobile").toString().equalsIgnoreCase("false"))
			{
		  		%>
		  		<link rel="stylesheet" type="text/css" href="assets/css/style_for_login.css" media="all" />
		  		<br/>
				<div id="loginContainer">
					<form action="login.jsp" id="loginForm" name="loginForm"
						method="post">
						<div class="login">
							<font style="text-shadow: 0 0 10px #ffffff;">LOGIN</font>
						</div>
						<div class="username-text">
							<font style="text-shadow: 0 0 10px #ffffff;">Username:</font>
						</div>
						<div class="password-text">
							<font style="text-shadow: 0 0 10px #ffffff;">Password:</font>
						</div>
						<div class="username-field">
							<input type="text" name="username" id="username" value="<%  %>" required="" />
						</div>
						<div class="password-field">
							<input type="password" name="password" id="password" required="" />
						</div>
		
						<div class="forgot-usr-pwd">
							<font color=red style="text-shadow: 0 0 10px #c61a1a;">
									<%
										
									%>
							</font>
						</div>
						<input type="submit" name="submit" value="GO" />
					</form>
				</div>
		  		<%
			}
			// If the viewing device is mobile, then view a simple login form
	  		else
	  		{
	  			%>
				<div class="section-top">
				    <h2 class="uppercase hr-mid text-center">Login</h2>
				    <p>Please enter your username and password to login to ETS.</p>
				    
				    <%
				    
				    String warningMessage= "", warningType = "";
				    if(warningMessage != null && !warningMessage.isEmpty())
				    {
				    	%>
						    <div class=" alert alert-<% out.print(warningType); %> alert-dismissable">
			            		<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			            	<% out.print("<p style='font-size: 15px;'>"+warningMessage+"</p>"); %>
			       			</div>
				    	<%
				    }
				    %>
				    
				    <div class="row">
				        <div class="col-sm-12">
				            <form action="login.jsp" class="form-horizontal" method="post">
				                <div class="form-group">
				                    <label class="col-sm-2 control-label" for="inputEmail3">Username:</label>
				                    <div class="col-sm-10">
				                        <input type="text" placeholder="Your username" name="username" id="username" class="form-control" required="">
				                    </div>
				                </div>
				                <div class="form-group">
				                    <label class="col-sm-2 control-label" for="inputPassword3">Password:</label>
				                    <div class="col-sm-10">
				                        <input type="password" placeholder="Your password" name="password" id="password" class="form-control" required="">
				                    </div>
				                </div>
				                <div class="form-group">
				                    <div class="col-sm-offset-2 col-sm-10">
				                        <button class="btn btn-border" type="submit">Login</button>
				                    </div>
				                </div>
				            </form>
				        </div>
				    </div>
				</div>
	  			<%
	  		}
	  		%>
			
			<br>
		</div>
	</div>
</div>
        
<!-- / section -->

<br>
<!-- footer -->

<jsp:include page="footer.jsp" />