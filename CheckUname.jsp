<html>

<body>
<p align="right">
<a href="index.html">Home</a>
</p>
</body>
	<%@ page import="java.sql.*"%>
<%
String username,pwd,course="";
boolean u=false,p=false;
	 
	  
	username=request.getParameter("txtuser");
	pwd=request.getParameter("txtpwd");
	 
	  session.setAttribute("uname",username);  
	  session.setAttribute("pwd",pwd);
	  
	  if((session.getAttribute("uname")==null) || (session.getAttribute("uname")==""))
	  {
	  
		RequestDispatcher rd=request.getRequestDispatcher("index.html");
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
	
		 ResultSet rs=st.executeQuery("select * from RegPage");
		 
		 while(rs.next())
		 {
		
			if(rs.getString(4).equals(username))
			{ u=true;   
			 if(rs.getString(5).equals(pwd))
			{ p=true;
			 course=rs.getString(6);
			  session.setAttribute("fname",rs.getString(10));
			}//if pwd
			}//if username
		} 
		Cookie cours=new Cookie("cours",course);
	 cours.setMaxAge(-10);
	 response.addCookie(cours);
		
		System.out.println(course);
		
		//while
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
		if((u) && (p))
		{  out.println("Welcome&nbsp;<strong>"+username.toUpperCase()+"</strong><br>");
		     if((course.equalsIgnoreCase("php")) || (course.equalsIgnoreCase("java")))
			{
			RequestDispatcher rd=request.getRequestDispatcher("rules.jsp");
			 rd.include(request,response);
			 }
			  if((course.equalsIgnoreCase(".net")) || (course.equalsIgnoreCase("android")) || (course.equalsIgnoreCase("oracle")))
			{
			RequestDispatcher rd=request.getRequestDispatcher("rules.jsp");
			 rd.include(request,response);
			 }
 
		}//main if
			 else 
			 {
		%> <h1><%	 out.println("Incorrect Username or Password");%> </h1><%
			 RequestDispatcher rd=request.getRequestDispatcher("body.html");
			 rd.include(request,response);
			 
			  }
		}//else session block
		
		 
%>
</html>