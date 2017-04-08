<%
 String sub=request.getParameter("sub");
 
 session.setAttribute("sub",sub); 
  RequestDispatcher rd=request.getRequestDispatcher("QuesAns.jsp");
		rd.forward(request,response);
  
 
%>