<%@ include file="/design/header.jspf" %>


  <%
  									
	Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();
									
	model = (Hashtable<Integer, Pays>)request.getAttribute("bdd");
								
	Collection<Pays> mesPays = model.values();
	
	String name;
	
  %>
  
    <div class="container-fluid">
		<div class="row-fluid">
        
		
        <div class="span9">
        
          <div class="hero-unit">
          
          	<h3> S'INSCRIRE: </h3>
			<form class="form-horizontal" method="get" action="finishInscription.html">
		
			<fieldset>
					
				<legend>Vos coordonnées</legend> <!-- Titre du fieldset -->
				
				<div class="control-group">
					<label class="control-label" for="country">Sexe :</label>
					<div class="controls">
						<label>
							<input name="sex" type="radio" value="H" required/>
							Homme
						</label>
						<label>
							<input name="sex" type="radio" value="F" required/>
							Femme
						</label>
					</div>
				</div>
								
				<div class="control-group">
					<label class="control-label" for="nom">Nom</label>
					<div class="controls">
						<input type="text" name="nom" id="nom" placeholder="Nom" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="prenom">Prénom</label>
					<div class="controls">
						<input type="text" name="prenom" id="prenom" placeholder="Prénom" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="birth">Date de naissance</label>
					<div class="controls">
						<input type="date" name="birth" id="birth" placeholder="Ex: YYYY/MM/DD" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="email" id="email" name="email" placeholder="Ex:membre@faust.fr" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="login">Pseudo</label>
					<div class="controls">
						<input type="text" name="login" id="login" placeholder="login" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="pwd1">Mot de passe</label>
					<div class="controls">
						<input type="password" name="pwd1" id="pwd1" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="pwd2">Mot de passe (confirmation)</label>
					<div class="controls">
						<input type="password" name="pwd2" id="pwd2" required/>
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

			<span class="form_col"></span>
						<input type="submit" value="S'INSCRIRE" />
			<span class="form_col"></span>
						<input type="reset" value="RESET" />
			
			
		</form>
		  

          </div>
          <div class="row-fluid">
      </div><!--/row--> 
        </div><!--/span-->
      </div><!--/row-->

    </div><!--/.fluid-container-->

<%@ include file="/design/footer.jspf" %>