<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.sql.*"%>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<title>Online Exam</title>
		<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="style.css" />
		
		<script>
<%String clock=request.getParameter("clock");
if(clock==null) clock="180";%>
var timeout=<%=clock%>;
 function timer()
 {
 if(--timeout>0)
 {
   document.forms["myFormTime"].clock.value=timeout;
   window.setTimeout("timer()",1000);
   
  }
  else
  {
	document.forms["myFormTime"].clock.value="time over";
	document.forms["myForm"].submit();
    
 }
 } 
 </script>
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
						<li><a href="feedback">Feedback</a></li>
						<li class="last"><a href="contact.jsp">Contact</a></li>
					</ul>
					<br class="clearfix" />
				</div>
			</div>
			
				
			<div id="page-bottom">
				<div id="page-bottom-content">
					<h3>Click On the correct Choice</h3>
					<p>
<% 
 int score=0;

 %><form name="myFormTime" method="get" action="anssubmit.jsp" >
 Seconds Remaining:<input type="text" name="clock" value="<%=clock%>">
 </form>
 <form name="myForm" method="get" action="anssubmit.jsp" >
  <%
  
	
	 
 if((session.getAttribute("uname")==null) || (session.getAttribute("uname")==""))
	  {
	  out.println("You are not Logged In...Plz log in to continue..");
		RequestDispatcher rd=request.getRequestDispatcher("index.html");
		rd.include(request,response);
		
		}
 		  
else 
	{
		 
		 
	  try
	 {
	    Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver is loaded");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","student554986");
		System.out.println("connection Obtained");
		Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery("select * from btechq");
	 
		  
		  for(int i=1;i<=31 && rs.next();i++)
		  { 
			out.println("<br><h4>"+rs.getString(1)+".");
			out.println(rs.getString(2)+"</h4>");
			out.println("<input type='radio' name=r"+i+" value="+rs.getString(3)+">"+rs.getString(3));
			out.println("<input type='radio' name=r"+i+" value="+rs.getString(4)+">"+rs.getString(4));
			out.println("<input type='radio' name=r"+i+" value="+rs.getString(5)+">"+rs.getString(5));
			out.println("<input type='radio' name=r"+i+" value="+rs.getString(6)+">"+rs.getString(6)+"<br><br>");
	
		 }
		  
%>		 
	
		<input type="submit" value="Submit">
		
	</form>	
<script>
timer();
</script>
	
		 
<%	
		 }//try	
		
		 catch(SQLException se)
	    {
          out.println("Warning!!!!!!SQL Exception");
		  se.printStackTrace();
		  out.println("SQLState="+se.getSQLState());
		  out.println("Error Code="+se.getErrorCode());
		  }
		  
		  catch(ClassNotFoundException cnfe)
		  { 
		   out.println("CNFE");
		   }
	  catch(Exception e)
	  {
	   out.println(" ");
	   e.printStackTrace();
		}
	}//else
%>
					</p>
				</div>
			</div>
		</div>
		
		<div id="footer">
			&copy; 2012-prab2k11@gmail.com | Design by <Strong> Prabhat </strong>| Images by <a href="http://fotogrph.com/">Fotogrph</a>
		</div>
	</body>
</html>