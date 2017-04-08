
<%@ page import="java.sql.*"%>
 
<%
String ques,A,B,C,D,correct,exp;
int no=Integer.parseInt(request.getParameter("qno"));
ques=request.getParameter("ques");
A=request.getParameter("A");
B=request.getParameter("B");
C=request.getParameter("C");
D=request.getParameter("D");
correct=request.getParameter("Correct");
exp=request.getParameter("Expl");
//JDBC block
	try
	 {
	    Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver is loaded");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","student554986");
		System.out.println("connection Obtained");
		Statement st=con.createStatement();
		st.executeUpdate("Insert into php values("+no+",'"+ques+"','"+A+"','"+B+"','"+C+"','"+D+"','"+correct+"','"+exp+"');");
		 
		 	
		RequestDispatcher rd=request.getRequestDispatcher("index.html");
		rd.include(request,response);
		out.println("Inserted");
		}//try
		
		 catch(SQLException se)
	    {
		se.printStackTrace();
          System.out.println("Warning!!!!!!SQL Exception");	   
		   System.out.println("SQLState="+se.getSQLState());
		    System.out.println("Error Code="+se.getErrorCode());
		  }
	  catch(Exception e)
	  {
	   System.out.println("Warning!!!!!!!!!!!!!!!!!");
	   e.printStackTrace();
		}
	
%>