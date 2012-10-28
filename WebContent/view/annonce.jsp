<%@ include file="/design/header.jspf" %>


  
  	<%
		Hashtable<String, Object> model = new Hashtable<String, Object>();			
		Hashtable<Integer, Categorie> modelCategories = new Hashtable<Integer, Categorie>();
		Hashtable<Integer, Annonce> modelAnnonces = new Hashtable<Integer, Annonce>();
		
		
		model = (Hashtable<String, Object>)request.getAttribute("bdd");
		
		modelCategories = (Hashtable<Integer, Categorie>)model.get("categories");
		modelAnnonces = (Hashtable<Integer, Annonce>)model.get("annonces");				
								
		String pays = request.getParameter("country");
				
	%>

    

    <div class="container-fluid">
      <div class="row-fluid">
        
		
        <div class="span9">
		
		<div class="navbar">
			<div class="navbar-inner">
			<a class="brand" href=""><%=pays%></a>
			<ul class="nav">			
			<%																		
				Collection<Categorie> mesCategories = modelCategories.values();				
				String name= new String();
				String name2;
				
				// Read database				
				for(Categorie c:mesCategories)
				{
					name = c.getNomCategorie();
											
					%>								
					<li> 
						<a href="#"><%=name%></a>
							<ul>
							<%
								for(Categorie sc: c.sousCategorie){
									name2=sc.getNomCategorie();
									int id = sc.getId();
									
									%>
									<li>
										<a href="affichage.html?country=<%=pays%>&cat=<%=name2%>"><%=name2%> </a>										
									</li>
									<%									
								}														
							%>
							</ul>							 						
					</li>
					<% 					
											
				}
					
			%>		
			</ul>
			</div>
		</div>
		
		
		<%
		
			Collection<Annonce> mesAnnonces = modelAnnonces.values();
			
			String date;
			String titre;
			int prix;
			
		%>
				
        <%for (Annonce a:mesAnnonces){%>
        	       
        <fieldset> 
		<legend><%=a.getTitre()%></legend> <!-- Titre du fieldset -->
		
			<h5>Postée le: </h5>
			<%=a.getPublication() %>
			<br/>
			
			<h5>Postée par: </h5>
			<%=a.getLogin_membre()%>
			<br/>
			
			<h5>Prix: </h5>
			<%=a.getPrix()%>
			<br/>
						
			<H5>Description: </H5>
			<%=a.getDescription()%>
			<br/>
				
		</fieldset>
		<br/><br/>
		
		<fieldset> 
		<legend><i class="icon-user"></i>CONTACTER</legend> <!-- Titre du fieldset -->			
			
			<H5>Nom: </H5>
			<%=a.getNom_auteur()%>
			<br/>
			
			<h5>Prenom: </H5>
			<%=a.getPrenom_auteur()%>
			<br/>
			
			<H5><i class="icon-remove"></i>Tel: </H5>
			<%=a.getTel_auteur()%>
			<br/>
			
			<H5>Email: </H5>			
			<a href="mailto:<%=a.getEmail_auteur()%>"><%=a.getEmail_auteur()%><i class="icon-envelope"></i></a>
			<br/>
	
		</fieldset>
		       
 <%}
 %>         
          <div class="row-fluid">
                 
            
          </div><!--/row--> 
        </div><!--/span-->
      </div><!--/row-->

    </div><!--/.fluid-container-->

	
  <%@ include file="/design/footer.jspf" %>