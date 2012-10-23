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
	
		<table class="table table-hover">
			<caption>
			<% 
				String caption = new String();
				if(mesAnnonces.isEmpty()){
					caption = "Pas d'annonces pour ce Pays ou cette categorie";
				
				}						
			%>
			
			<%=caption%>
			</caption>
			<thead>
				<tr>
					<th>Date</th>
					<th>Titre</th>
					<th>Prix</th>
				</tr>
			</thead>
			
			<tbody>
				<%						
					// Read database
					
					for(Annonce a:mesAnnonces)
					{
						date = a.getPublication();
						titre = a.getTitre();
						prix = a.getPrix();
											
						%>
						<tr>
							<td>
								<%=date%>	
							</td>							
							<td>
								<a href="annonce.html?country=<%=pays%>&title=<%=titre%>"><%=titre%> </a>							
							</td>						
							<td>
								<%=prix%>							
							</td>							
						</tr>					
						<% 																	
					}
				
				%>
		
				<tr>
					<td>...</td>
					<td>...</td>
					<td>...</td>
				</tr>
			</tbody>   
		</table>
		
          
          <div class="row-fluid">
                 
            
          </div><!--/row--> 
        </div><!--/span-->
      </div><!--/row-->

    </div><!--/.fluid-container-->
    
    <%@ include file="/design/footer.jspf" %>

    