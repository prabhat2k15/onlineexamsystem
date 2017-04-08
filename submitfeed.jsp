<%@ page import="java.sql.*"%>
<%	 
String name=request.getParameter("txtname");
String fb=request.getParameter("fback");
	  try
	 {
	    Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver is loaded");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","student554986");
		System.out.println("connection Obtained");
		Statement st=con.createStatement();
		st.executeUpdate("insert into feedback (name,feedback) values('"+name+"','"+fb+"')");
		out.println("<h1>Feedback Submitted</h1>");
		RequestDispatcher rd=request.getRequestDispatcher("feedback.jsp");
		rd.include(request,response);
		
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