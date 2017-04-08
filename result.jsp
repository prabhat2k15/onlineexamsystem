<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
  <title>OnlineExamination System</title>

  <link rel="StyleSheet" href="sinorcaish-screen.css" type="text/css" media="screen" />
  <link rel="StyleSheet" href="sinorcaish-print.css" type="text/css" media="print" />
</head>

<body>

<!-- For non-visual or non-stylesheet-capable user agents -->
<div id="mainlink"><a href="#main">Skip to main content.</a></div>


<!-- ======== Header ======== -->

<div id="header">
  <div class="left">
    <p><a href="adminhome.html">Admin<span class="alt">Page</span></a></p>
  </div>


  <div class="subheader">
    <p>
      <span class="hidden">Navigation:</span>
      <a href="adminhome.html">Admin Home</a> |
	  <a href="index.html">Home</a> |
      <a href="about.jsp">About</a> |
      <a href="feedback.jsp">Feedback</a> |
      <a href="contact.jsp">Contact Us</a> |
      
    </p>
  </div>
</div>


<!-- ======== Left Sidebar ======== -->

<div id="sidebar">
  <div>
    <p class="title"><a href="adminhome.html">Back</a></p>
    <ul>
      <li><a href="QuesAns.html"></a></li>
      
        <span class="hidden">(this page)</span></li>
      <li></li>
      <li></li>
    </ul>
  </div>
</div>

<%@ page import="java.sql.*"%>

<br><br><br><br>
<%

//JDBC block
String uname=(String)session.getAttribute("uname");
String fname=(String)session.getAttribute("pwd");

try
	 {
	    Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver is loaded");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","student554986");
		System.out.println("connection Obtained");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("Select * from result");
		
		out.println("<center><TABLE BORDER=0 ROWSPAN=30 COLSPAN=10 CELLSPACING=10 CELLPADDING=5 >");
		 	 out.println("<center><tr>");
			out.println("<td>");
		    out.print("Name</td><td>Fname");
			out.println("</td>");
			
			out.println("<td>");	
			out.print("Marks</td></tr>");
			out.println("</td></tr>");
			out.println("</table>");
		while(rs.next())
		 {
		 out.println("<center><TABLE BORDER=0 ROWSPAN=3 COLSPAN=0 CELLSPACING=10 CELLPADDING=5 >");
		 		
			if(rs.getInt(3)==0)
			{
			out.println("<font color=red");
			 out.println("<center><tr>");
			out.println("<td>");
		    out.print(rs.getString(1));
			out.println("</td>");
			
			out.println("<td>");	
			out.print(rs.getString(2));
			out.println("</td>");
			
			out.println("<td>");	
			out.print(rs.getInt(3));
			out.println("</td></tr>");
			}
			else
			{
			out.println("<font color=black");
			 out.println("<center><tr>");
			out.println("<td>");
		    out.print(rs.getString(1));
			out.println("</td>");
			
			out.println("<td>");	
			out.print(rs.getString(2));
			out.println("</td>");
			
			out.println("<td>");	
			out.print(rs.getInt(3));
			out.println("</td></tr>");
			}
out.println("</table>");

			
		  }//while ends here
}//try ends
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
<div id="footer">
  <hr />
  Copyright &copy; 2014, Prabhat Kumar.  All rights reserved.
  <span class="notprinted">
    <a href="index.html">Terms of Use</a>.
    <a href="index.html">Privacy Policy</a>.
  </span>
  <br />

  <h3>&copy; 2014-prab2k11@gmail.com | Design by <Strong> Prabhat </strong>| </h3>
</div>

</body>
</html>
  