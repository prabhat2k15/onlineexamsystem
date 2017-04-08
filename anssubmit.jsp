
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
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
			<div id="inner">
				
				 
			<div id="page-bottom">
				<div id="page-bottom-content">
					<h3>Marks</h3>
					<p>
<%
int marks=0,correctans=0,attemptedques=0;
 String ans[]=new String[32];
 String uname=(String)session.getAttribute("uname");
 String fname=(String)session.getAttribute("fname");
 System.out.println(uname+"of"+fname);
 for(int i=1;i<=31;i++)
 {
	System.out.println(ans[i]=request.getParameter("r"+i));
	if(ans[i]!=null)
	{ attemptedques++;
	}
}

			String stream="";
   Cookie c[]=request.getCookies();
	  for(int i=0;i<c.length;i++)
		{
	     if(c[i].getName().equals("cours"))
		 {
		   stream=c[i].getValue();
		 }
		}

 try
	 {
	    Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver is loaded");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","student554986");
		System.out.println("connection Obtained");
		Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery("select * from "+stream);
		 while(rs.next())
		 {  
		 for(int i=1;i<=31;i++)
		 { 
		  if(rs.getString(7).equals(ans[i]))
			{
				marks++;
				correctans++;
			}
			/*else if(!(rs.getString(7).equals(ans[i])) && ans[i]!=null)
				{
					marks-=0.25;
				} */
		 }//for loop
		  }//while
	out.println("Marks="+marks);
	double pcent= ((double)marks/30)*100;

	//out.println("<td><br>Percentage="+pcent +"%");
	out.println("<br>No of Attempted Question="+attemptedques);
	out.println("<br>No of Correct Answer="+correctans);
	out.println("<br><h1><u>Explanation:-</u></h1>");
	st.executeUpdate("insert into result values('"+uname+"','"+fname+"',"+marks+")");
	
	/*ResultSet rs1=st.executeQuery("select * from "+stream);
	for(int i=1;i<=31 && rs1.next();i++)
	{  
		if(!(ans[i]!=null) && (!(rs1.getString(7).equals(ans[i]))))
		{
		  System.out.println("if");
		}
		else {
		System.out.println("else");
		if(rs1.getString(8)!=null)
		 out.println("<br>"+rs1.getInt(1)+"."+rs1.getString(8));
		 }
	}for loop*/
		
	
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
	%>
		
					</p>
				</div>
			</div>
		</div>
		<div id="footer">
			&copy; 2014-prabhat2k15@gmail.com | Design by <Strong> Prabhat </strong>|
		</div>
	</body>
</html>