<%@ include file="/design/header.jspf" %>


  <%
		Hashtable<String, Object> model = new Hashtable<String, Object>();
		Hashtable<Integer, Pays> modelPays = new Hashtable<Integer, Pays>();
		Hashtable<Integer, Annonce> modelAnnonces = new Hashtable<Integer, Annonce>();
		
		model = (Hashtable<String, Object>)request.getAttribute("bdd");
		
		modelPays = (Hashtable<Integer, Pays>)model.get("pays");		
		modelAnnonces = (Hashtable<Integer, Annonce>)model.get("annonces");
		
		Collection<Pays> mesPays = modelPays.values();
		Collection<Annonce> mesAnnonces = modelAnnonces.values();
		
		String name;
		String name2;
		Annonce aModif= new Annonce();
		
		for(Annonce a:mesAnnonces)
			aModif=a;
				
	%>

    <div class="container-fluid">
		<div class="row-fluid">
        
		
        <div class="span9">
        
          <div class="hero-unit">
          
          	<h3> Modifier votre annonce: </h3>
			<form class="form-horizontal" method="post" action="finishModifAnnonce.html" >
		
			<fieldset>
				<legend>A contacter</legend> <!-- Titre du fieldset -->
				<div class="control-group">
					<label class="control-label" for="nom">Nom</label>
					<div class="controls">
						<input type="text" pattern="[A-Za-z]{2,24}" maxlength="30" name="nom" id="nom" value="<%=aModif.getNom_auteur()%>" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="prenom">Prénom</label>
					<div class="controls">
						<input type="text" pattern="[A-Za-z]{2,30}" maxlength="30" name="prenom" id="prenom" value="<%=aModif.getPrenom_auteur()%>" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="email" id="email" name="email" maxlength="50" value="<%=aModif.getEmail_auteur()%>" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="tel">Tel</label>
					<div class="controls">
						<input type="tel" pattern="[0-9]{2,24}" maxlength="30" id="tel" name="tel" value="<%=aModif.getTel_auteur()%>">
					</div>
				</div>
												
								
				<br/> <br/>
			</fieldset>
			
			<fieldset>
				<legend>Votre annonce</legend> <!-- Titre du fieldset -->
								
				<div class="control-group">
					<label class="control-label" for="titre">Titre de l'annonce</label>
					<div class="controls">
						<input type="text" pattern="[A-Za-z]{1,100}" maxlength="100" name="titre" id="titre" value="<%=aModif.getTitre()%>" required/>
					</div>
				</div>
							
				<div class="control-group">
					<label class="control-label" for="description"> Description de l'annonce</label>
					<div class="controls">						
						<textarea name="description" id="description" maxlength="500" ><%=aModif.getDescription()%></textarea>
					</div>
				</div>
				

				<div class="control-group">
					<label class="control-label" for="titre">Prix</label>
					<div class="controls">
						<input type="text" pattern="[0-9]*" maxlength="10" name="prix" id="prix" value="<%=aModif.getPrix()%>" required/>
					</div>
				</div>
											
				<input type="hidden" name="idAnnonce" id="idAnnonce" value="<%=aModif.getId_annonce()%>"/>
			
				
			</fieldset>
			
			<div class="control-group">
    			<div class="controls">		
    				<a class="brand btn" href="monCompte.html?tab=annonces">Annuler</a>	    						    			
    				<button type="submit" class="btn">Enregistrer les Modifications</button>  				
   				</div>	
   				 							
    		</div>
    		
  		</form>
		  

          </div>
          <div class="row-fluid">
      </div><!--/row--> 
        </div><!--/span-->
      </div><!--/row-->

    </div><!--/.fluid-container-->

  
  <%@ include file="/design/footer.jspf" %> 
