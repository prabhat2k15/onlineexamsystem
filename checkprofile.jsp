<%@ page import="java.sql.*"%>

<%

//JDBC block
boolean u=false, p=false;
String username=request.getParameter("name11");
	String pwd=request.getParameter("fname11");
	 session.setAttribute("uname",username);  
	  session.setAttribute("pwd",pwd);
	try
	 {
	    Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver is loaded");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","student554986");
		System.out.println("connection Obtained");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("Select * from regpage");
		 
		 while(rs.next())
		 {
			if(rs.getString(1).equals(username))
			{ u=true; }  
			 if(rs.getString(10).equals(pwd))
			{ p=true;}
		}//while ends
		if(u && p)
		{
		RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
		rd.include(request,response);
		}
		else {
		RequestDispatcher rd=request.getRequestDispatcher("adminhome.jsp");
		rd.include(request,response);
		out.println("No such name in DataBase...");}
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
		