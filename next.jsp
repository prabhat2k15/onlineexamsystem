<% String stream="";
if((session.getAttribute("uname")==null) || (session.getAttribute("uname")==""))
	  {
	  
		RequestDispatcher rd=request.getRequestDispatcher("index.html");
		rd.include(request,response);
		out.println("You are not Logged In...Plz log in to continue..");
		}
			  
	  else {
	Cookie c[]=request.getCookies();
	  for(int i=0;i<c.length;i++)
		{
	     if(c[i].getName().equals("cours"))
		 {
		   stream=c[i].getValue();
		 }
		}
		System.out.println(stream);
		
		
if(stream.equalsIgnoreCase("php"))
		{
		RequestDispatcher rd=request.getRequestDispatcher("php.jsp");
		rd.include(request,response);
		}
		else if(stream.equalsIgnoreCase("java"))
		{
		RequestDispatcher rd=request.getRequestDispatcher("java.jsp");
		rd.include(request,response);
		}
		else if(stream.equalsIgnoreCase("android"))
		{
		RequestDispatcher rd=request.getRequestDispatcher("android.jsp");
		rd.include(request,response);
		}
		else if(stream.equalsIgnoreCase(".net"))
		{
		RequestDispatcher rd=request.getRequestDispatcher(".net.jsp");
		rd.include(request,response);
		}
		else if(stream.equalsIgnoreCase("oracle"))
		{
		RequestDispatcher rd=request.getRequestDispatcher("oracle.jsp");
		rd.include(request,response);
		}	
		 
			}
			%>