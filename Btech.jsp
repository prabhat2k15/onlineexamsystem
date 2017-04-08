<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
	<p align="right">
	<a href="logout.jsp">Logout</a></p>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<title>Online Exam</title>
		<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>

	<body>
	<a href="http://www.facebook.com/"><img width="25" height="25"  src="fbLogo.png" </img></a>  

<a href="http://www.gmail.com"/><img width="25" height="25" src="gmailLogo.jpg"</img></a>  

<a href="http://www.yahoo.com/"><img width="25" height="25" src="yahooLogo.jpg" </img></a>  

<a href="http://www.twitter.com/"><img width="25" height="25" src="twitterLogo.jpg" </img></a>  

<a href="http://www.Songs.pk/"><img width="25" height="25" src="sonspkLogo.jpg"</img></a>   
		<div id="wrapper">
			<div id="header">
				<div id="logo">
					<h1><a href="#">Online Exam</a></h1>
				</div>
				<div id="menu">
					<ul>
						<li class="first current_page_item"><a href="index.html">Home</a></li>
						 
						<li><a href="blog.jsp">Blog</a></li>
						<li><a href="about.jsp">About</a></li>
						<li><a href="feedback.jsp">Feedback</a></li>
						<li class="last"><a href="contact.jsp">Contact</a></li>
					</ul>
					<br class="clearfix" />
				</div>
			</div>
			<div id="inner">
				<div id="splash">
					<img src="hcldragon.jpg" width="900" height="260" alt="" class="image" />
				</div>
				<%String course="";
Cookie cours[]=request.getCookies();
	  for(int i=0;i<cours.length;i++)
		{
	     if(cours[i].getName().equals("cours"))
		 {
		   course=cours[i].getValue();
		 }
		}


%>

	<font size="7">Branch:<%=course.toUpperCase()%></font></center>
 
 
				<div id="page">
					<div id="content">
						<div class="box">
							 
							 
			<div id="page-bottom">
				<div id="page-bottom-content">
					<h3>Select Your Stream</h3>
					<p>
						 <table>
	<form name="myForm" action="course.jsp"  onsubmit="return validateStream()">
	<tr><td>
	<big>	PHP</td><td>
		<input type="Radio" name="stream" value="me"></big></td>
		
		<tr><td><big>Java</big></td><td>
		<input type="Radio" name="stream" value="ece"></td></tr>
		
		<tr><td><big>Android</big></td><td>
		<input type="Radio" name="stream" value="ce"></td></tr>
		
		<tr><td><big>.Net</big></td><td>
		<input type="Radio" name="stream" value="cse"></td></tr>
		
		<tr><td><big>Information Technology</big></td><td>
		<input type="Radio" name="stream" value="it"></td></tr>
		<tr><td>
		<input type="submit"></td></tr>
	</form>
	</table>
					</p>
				</div>
			</div>
		</div>
		<div id="footer">
			&copy; 2012-prab2k11@gmail.com | Design by <Strong> Prabhat </strong>| Images by <a href="http://fotogrph.com/">Fotogrph</a>
		</div>
	</body>
</html>