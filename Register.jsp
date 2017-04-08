<html>
 
<body>

<jsp:useBean id="mybean" class="mybeanproject.ProjectAddRecord"/>

<jsp:setProperty name="mybean" property="*"/>
<%
 if(mybean.register())
 {
%>
<h1>Registration Successfull</h1> 
<jsp:include page="index.html"/>

<% 
}
	else
	{
	out.println("Record Cannot be Inserted");
	}
 
%>

</body>
</html>

