<%@ page import="java.sql.*"%>
<%
String username,pwd;
boolean u=false,p=false;
	 
	  
	username=request.getParameter("txtuser");
	pwd=request.getParameter("txtpwd");
	 
	session.setAttribute("uname",username);  
	  session.setAttribute("pwd",pwd);
	  
	 if((session.getAttribute("uname")==null) || (session.getAttribute("uname")==""))
	  {
	  
		RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
		rd.include(request,response);
		out.println("You are not Logged In...Plz log in to continue..");
		}
			  
	  else {
try
	 {
	    Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver is loaded");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","student554986");
		System.out.println("connection Obtained");
		Statement st=con.createStatement();
		ResultSet rs2=st.executeQuery("Select * from admin");//Admin resultset
		 while(rs2.next())
		 {
		 if(rs2.getString(1).equals(username) && rs2.getString(2).equals(pwd))
		 {
		 RequestDispatcher rd2=request.getRequestDispatcher("adminhome.html");
		 rd2.forward(request,response);
		 }
		 else{out.println("Wrong username or password");}
		 }//while rs2 ends here
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
		}
		%>