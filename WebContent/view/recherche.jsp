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
	
  %>
  
    <div class="container-fluid">
		<div class="row-fluid">
        		
        <div class="span9">
        
          <div class="hero-unit">
          
          	<h3> RECHERCHE AVANCEE: </h3>
			<form class="form-horizontal" method="get" action="affichage.html">
		
			<fieldset>
				<legend>Par Mot clé</legend> <!-- Titre du fieldset -->
				<div class="control-group">
					<label class="control-label" for="nom">Rechercher:</label>
					<div class="controls">
						<input type="text" name="search" id="search" placeholder="search" pattern="[A-Za-z]*" required>
					</div>
				</div>			
			</fieldset>
			
			
			<fieldset>
					
				<legend>Par Categorie</legend> <!-- Titre du fieldset -->
								
				<div class="control-group">
					<label class="control-label" for="categorie">Categorie de l'annonce</label>
					<div class="controls">
						<select name="cat" id="cat">
							<option value="none">Selectionnez votre categorie de l'annonce</option>
							<% 					
								for(Categorie c: mesCategories)
								{																				
									%>
									<option value="<%=c.getNomCategorie()%>" style="background-color:#dcdcc3" disabled id ="<%=c.getNomCategorie()%>"><%=c.getNomCategorie()%></option>
									<%															
									for(Categorie sc: c.sousCategorie){																				
										%>
										<option value="<%=sc.getNomCategorie()%>" id ="<%=sc.getNomCategorie()%>"><%=sc.getNomCategorie()%></option>
										<%											
									}																									
								}																					
							%>
						</select>
					</div>
				</div>								
			
			</fieldset>
			
			
			<fieldset>
			<legend>Pays</legend> <!-- Titre du fieldset -->
				<div class="control-group">
					<label class="control-label" for="country">Par Pays</label>
					<div class="controls">
						<select name="country" id="country">
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
			</fieldset>
			
			
			<fieldset>
			<legend>Ville</legend> <!-- Titre du fieldset -->
			
				<div class="control-group">
					<label class="control-label" for="city">Par Ville</label>
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
			
			</fieldset>
			
			<fieldset>
			<legend>Prix</legend> <!-- Titre du fieldset -->
				<div class="control-group">
					<label class="control-label" for="country">Par Prix :</label>
					<div class="controls">
						<label>
							<input name="moinsplus" type="radio" value="moins"/>
							Moins de:
						</label>
						<label>
							<input name="moinsplus" type="radio" value="plus" />
							Plus de:
						</label>
					</div>
					<div class="controls">
						<input type="text" name="prix" id="prix" placeholder="" pattern="[0-9]*">
					</div>
				</div>			
			</fieldset>
			

			<span class="form_col"></span>
						<input class="btn btn-primary" type="submit" value="RECHERCHER" />
			<span class="form_col"></span>
						<input class="btn" type="reset" value="RESET" />
			
			
		</form>
		  

          </div>
          <div class="row-fluid">
      </div><!--/row--> 
        </div><!--/span-->
      </div><!--/row-->

    </div><!--/.fluid-container-->

<%@ include file="/design/footer.jspf" %>