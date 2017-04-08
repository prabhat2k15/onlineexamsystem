<%@ page import="java.sql.*"%>

<a href="index.html">Home</a><br><br><br>
<head>
<script>
<%String clock=request.getParameter("clock");
if(clock==null) clock="186";%>
var timeout=<%=clock%>;
 function timer()
 {
 if(--timeout>0)
 {
   document.forms["myForm"].clock.value=timeout;
   window.setTimeout("timer()",1000);
   
  }
  else
  {
	document.forms["myForm"].clock.value="time over";
	return submit_me();
 }
 }
	setInterval(submit_me,6000);
	function submit_me()
	{ 
		document.forms["myForm"].submit();
	}
</script>
</head>

<style type="text/css">
#p
{
 width:1400px;
 height:60px;
 background:black;
 font size:20px;
 color:white;
 font size:45px;
 padding:10px;
 }
 
</style>
 
<div id="p">
 <font size="10">Online Examination </font>
</div>
<body background="pattern2.jpg">
<% int score=0,marks=0;
Cookie answer[]=request.getCookies();
	 /* if(request.getParameter("r"+current).equals(rs.getString(7)))
			{ 		for(int i=0;i<answer.length;i++)
						{
						if(answer[i].getName().equals("ans"))
							{
							marks+=Integer.parseInt(answer[i].getValue());
							// answer[i].setValue=(String)marks;
							}
						}
		
			}*/
 int current=0;
 %>
 <form name="myForm" method="get" action="<%=request.getRequestURL()%>" >
 Seconds Remaining:<input type="text" name="clock" value="<%=clock%>">
 
 <%
 if(request.getParameter("hidden")!=null)
	{
		current=Integer.parseInt(request.getParameter("hidden"));
	}
	
	/*else 
	{
	if(rs.getString(7).equals(request.getParameter("r"+current)))
	 { score++;  }
	 }*/
	 
 if((session.getAttribute("uname")==null) || (session.getAttribute("uname")==""))
	  {
		RequestDispatcher rd=request.getRequestDispatcher("index.html");
		rd.include(request,response);
		out.println("You are not Logged In...Plz log in to continue..");
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
		 if(request.getParameter("hidden2")!=null)
	{
		score=Integer.parseInt(request.getParameter("hidden2"));
	}
		 for(int i=0;i<current;i++)
		 { rs.next(); }
		 if(!rs.next())
		 { out.println("Over");} 
		 else
		 {  
		 
			out.println("<br><h4><font color=black>"+rs.getString(1)+".");
			out.println(rs.getString(2)+"</font></h4>");
			out.println("<input type='radio' name=r"+current+" value="+rs.getString(3)+">"+rs.getString(3));
			out.println("<input type='radio' name=r"+current+" value="+rs.getString(4)+">"+rs.getString(4));
			out.println("<input type='radio' name=r"+current+" value="+rs.getString(5)+">"+rs.getString(5));
			out.println("<input type='radio' name=r"+current+" value="+rs.getString(6)+">"+rs.getString(6)+"<br><br>");
		   
		   
		 }
		 
		 out.println("score="+score);
		 
%>		 
	<input type="hidden" name="hidden" value="<%=current+1%>">
	
	<input type="hidden" name="hidden2" value="<%=score+1%>">
		<input type="submit" value="NEXT">
		
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