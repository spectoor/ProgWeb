<%@ include file="design/header.jspf" %>

<%@ include file="design/navigation.jspf" %>

<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.Collection" %>
<%@ page import="fr.spring.objects.Contact" %>

	<%
	
	Hashtable<Integer, Contact> model = (Hashtable<Integer, Contact>)request.getAttribute("bdd");
	Collection<Contact> mesContacts = model.values();
	
	// Read database
	for(Contact c:mesContacts)
	{
		out.write(c.toString());
		%><br><%
	}
	
	%>
	
	<br> <a href="index.jsp">Back</a>
    
<%@ include file="design/footer.jspf" %>