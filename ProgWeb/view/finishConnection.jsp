<%@page import="fr.spring.objects.Categorie"%>
<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.Collection" %>
<%@ page import="fr.spring.objects.Pays" %>
<%@ page import="fr.spring.objects.Membre" %>
<%@ page import="fr.spring.objects.StatementMysql" %>
<%@ page import="fr.spring.model.BDDModel" %>


<!DOCTYPE HTML>	
<HTML lang="fr">

	<HEAD>
	 	
	</HEAD>
	
	<BODY >
		<!-- Corps de la page -->
		<h1>Redirection</h1>
		
		
		<%
						
			Hashtable<Integer, Membre> model = new Hashtable<Integer, Membre>();
			
			
			model = (Hashtable<Integer, Membre>)request.getAttribute("bdd");
			
			Collection<Membre> mesMembres = model.values();			
									
			String pays = request.getParameter("country");
			String login = new String("");
			int id = 0;
			
			for(Membre m:mesMembres){
				
				login = m.getPseudo(); 
				id = m.getId_membre();
				
			}
			
			String href = new String("");
			
			if(id >0)
				href ="index.jsp?login=" + login ;
			else
				href ="connection.html";
			
		%>
				
		
		<script type="text/javascript">			
			window.location.href="<%=href%>";
		</script>
	</BODY>
</HTML> 