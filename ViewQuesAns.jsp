<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<h1><a href="adminhome.html">&raquoback </a></h1>
<%
String vsub=request.getParameter("viewsub");
 

try
	 {
	    Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver is loaded");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","student554986");
		System.out.println("connection Obtained");
		Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery("select * from "+vsub);
		 while(rs.next())
		 {  
		 out.println(rs.getInt(1)+".");
		 out.println(rs.getString(2)+"<br>");
		 out.println("a)"+rs.getString(3)+"&nbsp&nbsp");
		 out.println("b)"+rs.getString(4)+"&nbsp&nbsp");
		 out.println("c)"+rs.getString(5)+"&nbsp&nbsp");
		 out.println("d)"+rs.getString(6)+"<br>");
		 out.println("correct)"+rs.getString(7));
		 out.println("Expl)"+rs.getString(8)+"<br><br>");
		 }//while
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