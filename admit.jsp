<!DOCTYPE html>
<HTML>
<p align="right">
<a href="index.html">Home</a>
</p>
<%@ page import="java.sql.*"%>
<HEAD>
 
</HEAD>
<body background="bg.jpg">


<CENTER>
<FONT SIZE=10 color="red" face="lucida bright" >
 
 
</FONT>	
</CENTER>

<BODY>

<style type="text/css">
#p
{
 width:1400px;
 height:60px;
 background:brown;
 font size:20px;
 color:white;
 font size:45px;
 padding:10px;
 }
 
</style>

<!--<div id="p">
 <font size="10"><center> Admit Card</center></font>
</div>-->
<FONT color="black" SIZE="5">
<FORM name="myForm" action="window.print()" onSubmit="return regForm()">
 
<%
try
	 {
	    Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver is loaded");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","student554986");
		System.out.println("connection Obtained");
		Statement st=con.createStatement();
		 
		 ResultSet rs=st.executeQuery("select * from regpage");
		 
		 while(rs.next())  
		 {  
		  if(rs.getString(4).equals(request.getParameter("username")) && rs.getString(5).equals(request.getParameter("pwd")))
		
		  {
%>	
<center>
 <div id="container" style="width:500px">

<div id="header" style="background-color:#FFA500;">
<h1 style="margin-bottom:0;">Admit Card</h1></div>

<div id="menu" style="background-color:#FFD700;height:538px;width:100px;float:left;">
<b></b><br />
Home<br />
<br />
</div>

<div id="content" style="background-color:#EEEEEE;height:510px;width:400px;float:left;">	
 			
<table>
			
			 <!--<tr><td>Roll No:</td><td  width="50%" align="center"   ><%out.println( );%></h2></td></tr>-->
			 <tr><td>Name:</td><td> <%out.println(rs.getString(1));%></td></tr>  
			 <tr><td>Father's Name:</td><td><%out.println(rs.getString(10));%></td></tr>  
			 <tr><td>Mother's Name:</td><td><%out.println(rs.getString(11));%></td></tr>  
			 <tr><td>Sex:</td><td><%out.println(rs.getString(3));%></td></tr> 
			 <tr><td>Address:</td><td><%out.println(rs.getString(12));%></td></tr>
			 <tr><td>District:</td><td><%out.println(rs.getString(13));%></td></tr>			 
			 <tr><td>State:</td><td><%out.println(rs.getString(17));%></td></tr>
			 <tr><td>Pin Code:</td><td><%out.println(rs.getString(14));%></td></tr>
			 <tr><td>Contact No:</td><td>+91<%out.println(rs.getString(16));%></td></tr>
			 <tr><td>ID Mark:</td><td><%out.println(rs.getString(15));%></td></tr>
			 <tr><td>Username:</td><td><%out.println(rs.getString(4));%></td></tr>  
			 <tr><td>Password:</td><td><%out.println(rs.getString(5));%></td></tr> 
			 <tr><td>Stream: </td><td><%out.println(rs.getString(6));%> </td></tr>  
			
			</table>
		 
			 
<%			
		System.out.println("f"+rs.getString(10));  }
}//while		  
%><table>
<tr><td><INPUT TYPE="button" value="Print" onclick="window.print()"></td>
<td><INPUT TYPE="SUBMIT"></td>
<td><INPUT TYPE="RESET"></td></tr></BR>
  </div>

<div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
Copyright © Prabhat</div>

</div>

 
 </center>
</FONT>

</FORM>
<%}//try

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
</BODY>
</HTML>


 