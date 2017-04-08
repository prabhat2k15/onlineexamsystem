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
		<script>
			window.history.forward(1);
			</script>
	</head>
			
	<body>
	
	
		<div id="wrapper">
			<div id="header">
				<div id="logo">
					<h1><a href="#">Online Exam</a></h1>
				</div>
				<div id="menu">
					<ul>
						<li class="first current_page_item"><a href="index.html">Home</a></li>
						 <li><a href="http://www.blogspot.com">Blog</a></li>
						<li><a href="about.jsp">About</a></li>
						<li><a href="feedback.jsp">Feedback</a></li>
						<li class="last"><a href="contact.jsp">Contact</a></li>
					</ul>
					<br class="clearfix" />
				</div>
			</div>
			
					 
		<%String techCourse="";
	
		 
		String stream="";
String cor="0";
if((session.getAttribute("uname")==null) || (session.getAttribute("uname")==""))
	  {
	  out.println("You are not Logged In...Plz log in to continue..");
		RequestDispatcher rd=request.getRequestDispatcher("index.html");
		rd.include(request,response);
		
		}
			  
	  else {
//for answer
Cookie answer=new Cookie("ans",cor);
	 answer.setMaxAge(-10);
	 response.addCookie(answer);
	 
String course="";
Cookie cours[]=request.getCookies();
	  for(int i=0;i<cours.length;i++)
		{
	     if(cours[i].getName().equals("cours"))
		 {
		   course=cours[i].getValue();
		 }
		}	 
	 System.out.println(course);
	 
	Cookie c[]=request.getCookies();
	  for(int i=0;i<c.length;i++)
		{
	     if(c[i].getName().equals("btech"))
		 {
		   stream=c[i].getValue();
		 }
		}
 	%> 
			<div id="page-bottom">
				<div id="page-bottom-content">
					<h3> <u>Rules and Regulations</u></h3>
					<p>
						> Examination is conducted for 30 marks for each subject , There will be 30 questions carrying 1
marks and for each wrong answer 25% marks will be deducted .</p>
 <p>
 
=> Books, bags or any other unauthorized material should be away from the students desk in the
examination centre.</p><p>
=> Upon entering the examination centre, Students become subject to the authority of the
supervisor/invigilators & must comply with their instructions.
					</p><p>
					=> Students should read the instructions which appear after installing the exam software.<br>
					</p>
				</div>Click <a href="next.jsp"> <font size="10"> Next</font></a>To Start Exam
			</div>
		
		<%}//main else%>
	</body>
</html>