 

<% 
 if((session.getAttribute("uname")==null) || (session.getAttribute("uname")==""))
	  {
	  
		RequestDispatcher rd=request.getRequestDispatcher("index.html");
		rd.include(request,response);
		out.println("You are not Logged In...Plz log in to continue..");
		}
			  
	  else {
String stream=request.getParameter("stream");

 Cookie c=new Cookie("btech",stream);
	 c.setMaxAge(-10);
	 response.addCookie(c);
	 
String sessname=(String)session.getAttribute("uname");
if(sessname==null || sessname=="")
{

  RequestDispatcher rd=request.getRequestDispatcher("index.html");
  rd.include(request,response);
  out.println("You are not Logged in...Plz Log in to continue...");
  }
  else {
		if(stream=="" || stream==null)
			{
		RequestDispatcher rd=request.getRequestDispatcher("Btech.jsp");
		rd.include(request,response);
		out.println("<br><h1>Stream not selected</h1></br>");
			}
		else 
			{
			RequestDispatcher rd=request.getRequestDispatcher("rules.jsp");
			rd.include(request,response);
			}
		
	  }//else	
}//main else	  
  
  %>