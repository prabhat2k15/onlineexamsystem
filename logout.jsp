<html>
<%
//HttpSession session=request.getSession();
session.invalidate();
%>
You have Successfully Logged Out....<br>
<%@include file="index.html"%>

</html>
