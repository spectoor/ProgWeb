<%@ include file="/design/header.jspf" %>


  <%
  									
  	Hashtable<String, Object> model = new Hashtable<String, Object>();
	Hashtable<Integer, Pays> modelPays = new Hashtable<Integer, Pays>();
	Hashtable<Integer, Membre> modelMembres = new Hashtable<Integer, Membre>();
	
	model = (Hashtable<String, Object>)request.getAttribute("bdd");
	
	modelPays = (Hashtable<Integer, Pays>)model.get("pays");
	
	modelMembres = (Hashtable<Integer, Membre>)model.get("membres");
	
	Collection<Pays> mesPays = modelPays.values();
	Collection<Membre> mesMembres = modelMembres.values();

	
	String name;
	
  %>
  
  	<script type="text/javascript"> 
 		
	      function checkLogin(){
	    	  //check if the login is not already used 
	    	  alert("OK");
	    	  
	      }
	      
	      
  
	  </script>
  
    <div class="container-fluid">
		<div class="row-fluid">
        		
        <div class="span9">
        
          <div class="hero-unit">
          
          	<h3> S'INSCRIRE: </h3>
			<form class="form-horizontal" method="get" action="finishInscription.html">
		
			<fieldset>
					
				<legend>Vos coordonnées</legend> <!-- Titre du fieldset -->
								
				<div class="control-group">
					<label class="control-label" for="nom">Nom</label>
					<div class="controls">
						<input type="text" name="nom" id="nom" placeholder="Nom" pattern="[A-Za-z]*" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="prenom">Prénom</label>
					<div class="controls">
						<input type="text" name="prenom" id="prenom" placeholder="Prénom" pattern="[A-Za-z]*" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="birth">Date de naissance (Ex:YYYY/MM/DD)</label>
					<div class="controls">
						<input type="date" name="birth" id="birth" placeholder="Ex: YYYY/MM/DD"  pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="email" id="email" name="email" placeholder="Ex:membre@faust.fr" pattern="[A-Za-z0-9]*@[a-z]*.[a-z]{2,3}" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputTel">Tel</label>
					<div class="controls">
						<input type="tel" id="tel" name="tel" placeholder="Tel:06 24 17 22" pattern="[0-9]*"/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="login">Pseudo</label>
					<div class="controls">
						<input type="text" name="login" id="login" placeholder="login" onchange="checkLogin()" pattern="[A-Za-z0-9]{3,24}" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="pwd1">Mot de passe</label>
					<div class="controls">
						<input type="password" name="pwd1" id="pwd1" pattern="[A-Za-z0-9]{5,12}" onchange="form.pwd2.pattern = this.value;" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="pwd2">Mot de passe (confirmation)</label>
					<div class="controls">
						<input type="password" name="pwd2" id="pwd2" title="" required/>
					</div>
				</div>
				
				
				<div class="control-group">
					<label class="control-label" for="country">Pays</label>
					<div class="controls">
						<select name="country" id="country">
							<option value="none" >Selectionnez votre pays de residence</option>
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