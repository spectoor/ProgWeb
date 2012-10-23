<%@ include file="/design/header.jspf" %>


  <%
		Hashtable<String, Object> model = new Hashtable<String, Object>();
		Hashtable<Integer, Pays> modelPays = new Hashtable<Integer, Pays>();
		Hashtable<Integer, Categorie> modelCategories = new Hashtable<Integer, Categorie>();
		
		model = (Hashtable<String, Object>)request.getAttribute("bdd");
		
		modelPays = (Hashtable<Integer, Pays>)model.get("pays");
		
		modelCategories = (Hashtable<Integer, Categorie>)model.get("categories");
		
		Collection<Pays> mesPays = modelPays.values();
		Collection<Categorie> mesCategories = modelCategories.values();
		
		String name;
		String name2;
				
	%>

    <div class="container-fluid">
		<div class="row-fluid">
        
		
        <div class="span9">
        
          <div class="hero-unit">
          
          	<h3> Passer une annonce: </h3>
			<form class="form-horizontal" method="get" action="finishAnnonceForm.html">
		
			<fieldset>
				<legend>Vos coordonnées</legend> <!-- Titre du fieldset -->
				<div class="control-group">
					<label class="control-label" for="nom">Nom</label>
					<div class="controls">
						<input type="text" pattern="[a-z]*" name="nom" id="nom" placeholder="Nom" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="prenom">Prénom</label>
					<div class="controls">
						<input type="text" name="prenom" id="prenom" placeholder="Prénom" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="email" id="email" name="email" placeholder="Ex:membre@faust.fr" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="tel">Tel</label>
					<div class="controls">
						<input type="tel" id="tel" name="tel" placeholder="Tel">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="country">Pays</label>
					<div class="controls">
						<select name="country" id="country">
							<option value="none">Selectionnez votre pays de residence</option>
							
							<%								
								// Read database
								
								for(Pays c:mesPays)
								{
									name = c.getNom();
									int id = c.getId_pays();
									
									%>								
										<option value="<%=name%>"><%=name%></option>
									<% 
															
								}																	
							%>					
						</select>
					</div>
				</div>
				
				
				<div class="control-group">
					<label class="control-label" for="city">Ville</label>
					<div class="controls">
						<select name="city" id="city">
							<option value="none">Selectionnez votre ville de residence</option>
							<%																				
								// Read database
								
								for(Pays c:mesPays)
								{
									name = c.getNom();																		
									%>								
										<option value="<%=name%>"><%=name%></option>
									<% 															
								}																	
							%>	
						</select>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="country">Vous etes :</label>
					<div class="controls">
						<label>
							<input name="type" type="radio" value="part" required/>
							Particulier
						</label>
						<label>
							<input name="type" type="radio" value="pro" required/>
							Profesionnel
						</label>
					</div>
				</div>
				<br/> <br/>
			</fieldset>
			
			<fieldset>
				<legend>Votre annonce</legend> <!-- Titre du fieldset -->
	
				<div class="control-group">
					<label class="control-label" for="categorie">Categorie de l'annonce</label>
					<div class="controls">
						<select name="categorie" id="categorie">
							<option value="none">Selectionnez votre categorie de l'annonce</option>
							<% 					
								for(Categorie c: mesCategories)
								{
										name = c.getNomCategorie();
										
										%>
										<option value="<%=name%>" style="background-color:#dcdcc3" disabled id ="<%=name%>"><%=name%></option>
										<%
																
										for(Categorie sc: c.sousCategorie){
											name2=sc.getNomCategorie();
											int id=sc.getId();
											
											%>
											<option value="<%=name2%>" id ="<%=name2%>"><%=name2%></option>
											<%											
										}																									
								}																					
							%>
						</select>
					</div>
				</div>
								
				<div class="control-group">
					<label class="control-label" for="titre">Titre de l'annonce</label>
					<div class="controls">
						<input type="text" name="titre" id="titre" placeholder="Titre" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="description">Description de l'annonce</label>
					<div class="controls">						
						<textarea name="description" id="description" cols="40" rows="4"></textarea>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="titre">Prix</label>
					<div class="controls">
						<input type="text" pattern="[0-9]*" name="prix" id="prix" placeholder="" required/>
					</div>
				</div>
			
				
			</fieldset>
			
			<span class="form_col"></span>
						<input type="submit" value="VALIDER L'ANNONCE" />
			
			
		</form>
		  

          </div>
          <div class="row-fluid">
      </div><!--/row--> 
        </div><!--/span-->
      </div><!--/row-->

    </div><!--/.fluid-container-->

  
  <%@ include file="/design/footer.jspf" %> 
