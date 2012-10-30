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
	
	boolean used = false;	
	
  %>
  
  
  	<script type="text/javascript"> 
 		
	      function checkLogin(){
	    	//check if the login is not already used 
	    	
	    	var l= 	$('#login').attr("value");	 
	    	var ok = 1;
	    	$("#alertLogin").alert();
	    	<% 
	    	for(Membre m: mesMembres){
	    		String log = m.getPseudo();%>
	    			    		
	    		var loginTest ='<%=log%>';
	    		if(loginTest == l){	    		    			
	    			$('#login').attr("value","");	    			
	    			$("#alertLogin").attr("style","display:yes;");
	    			ok = 0;	    			
	    		}
	    		
	    		
	    	<%}%>
	    	
	    	//si le login est valide
	    	if(ok==1){	    		
	    		$("#alertLogin").attr("style","display:none;");
	    	}	    	
  	  
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
						<input type="text" name="nom" id="nom" placeholder="Nom" maxlength="30" pattern="[A-Za-z]*" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="prenom">Prénom</label>
					<div class="controls">
						<input type="text" name="prenom" id="prenom" placeholder="Prénom" maxlength="30" pattern="[A-Za-z]*" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="birth">Date de naissance (Ex:YYYY/MM/DD)</label>
					<div class="controls">
						<input type="date" name="birth" id="birth"  maxlength="11" placeholder="Ex: YYYY/MM/DD"  pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="email" id="email" name="email" placeholder="Ex:membre@faust.fr" maxlength="50" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputtelf">Tel</label>
					<div class="controls">
						<input type="text" id="tel" name="tel" placeholder="Ex:06241722" maxlength="20" pattern="[0-9]{2,20}" required/>
					</div>
				</div>															
		
				<div class="control-group">
					<label class="control-label" for="login">Pseudo</label>
					<div class="controls">
						<input type="text" name="login" id="login" placeholder="login" onchange="checkLogin()" maxlength="30" pattern="[A-Za-z0-9]{3,30}" required/>
					</div>
					
					<div id="alertLogin"  class="alert alert-block" style="display:none;">				    	
				    	Pseudo déja utilisé ! Veuillez choisir un autre.
				    </div>
				    
				</div>								
					
				<div class="control-group">
					<label class="control-label" for="pwd1">Mot de passe</label>
					<div class="controls">
						<input type="password" name="pwd1" id="pwd1" maxlength="30" pattern="[A-Za-z0-9]{5,30}" onchange="form.pwd2.pattern = this.value;" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="pwd2">Mot de passe (confirmation)</label>
					<div class="controls">
						<input type="password"  maxlength="30" name="pwd2" id="pwd2" title="" required/>
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
									%>								
										<option value="<%=c.getNom()%>"><%=c.getNom()%></option>
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
																						
									%>								
										<option value="<%=c.getNom()%>"><%=c.getNom()%></option>
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
						<input class="btn btn-primary" type="submit" value="S'INSCRIRE" />
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