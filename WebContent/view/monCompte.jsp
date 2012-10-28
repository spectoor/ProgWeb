<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ include file="/design/header.jspf" %>

<%
		Hashtable<String, Object> model = new Hashtable<String, Object>();
		Hashtable<Integer, Membre> modelMembre = new Hashtable<Integer, Membre>();
		Hashtable<Integer, Annonce> modelAnnonce = new Hashtable<Integer, Annonce>();
		Hashtable<Integer, Pays> modelPays = new Hashtable<Integer, Pays>();;
		
		model = (Hashtable<String, Object>)request.getAttribute("bdd");		
		modelMembre = (Hashtable<Integer, Membre>)model.get("membre");		
		modelAnnonce = (Hashtable<Integer, Annonce>)model.get("annonces");		
		modelPays = (Hashtable<Integer, Pays>)model.get("pays");
		
	
		Collection<Membre> monMembre = modelMembre.values();
		Collection<Annonce> mesAnnonces = modelAnnonce.values();
		Collection<Pays> mesPays  = modelPays.values();
		
		
		Membre profil = new Membre();

		
		String date= new String();
		String titre= new String();
		String paysA= new String();
		String villeA= new String();
		String nomContact= new String();
		int prix= 0;
		
		for(Membre m:monMembre){			
			profil = m;			
		}				
		
  %>
    

<script type="text/javascript"> 
 		
	      function closeModalModifAccount(){    	  
	    	  $('#modalModifAccount').modal('hide');
	      }
	      
	      function showModalModifAccount(){	    	  
	    	  $('#modalModifAccount').modal('show');
	    	  
	      }
</script> 	


<!-- Modal account modification -->
<div class="modal hide fade" id="modalModifAccount" style="display: none;" >
	
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" >x</button>
			<h3 id="myModalLabel">Mon Compte</h3>
		</div>
	
		<div class="modal-body">
		
			<form class="form-horizontal" method="post" action="finishModifAccount.html">

			<fieldset>
					
				<legend>Modification du compte</legend> <!-- Titre du fieldset -->												
							
				<div class="control-group">
					<label class="control-label" for="nom">Nom</label>
					<div class="controls">
						<input type="text" maxlength="30" pattern="[A-Za-z]*" name="nom" id="nom" value="<%=profil.getNom()%>" required/>
					</div>
				</div>
			
				<div class="control-group">
					<label class="control-label" for="prenom">Prenom</label>
					<div class="controls">
						<input type="text" maxlength="30" pattern="[A-Za-z]*" name="prenom" id="prenom" value="<%=profil.getPrenom()%>" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="email"maxlength="30" id="email" name="email" value="<%=profil.getEmail()%>" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputTel">Tel</label>
					<div class="controls">
						<input type="tel" maxlength="16" pattern="[0-9]*" id="tel" name="tel" value="<%=profil.getTel()%>" required/>
					</div>
				</div>
			
				<div class="control-group">
					<label class="control-label" for="pwd1">Ancien Mot de passe</label>
					<div class="controls">
						<input type="password" maxlength="30" pattern="[A-Za-z0-9]*" name="pwd1" id="pwd1" placeholder="**********" />
					</div>										
				</div>
				
				<div class="control-group">
					<label class="control-label" for="pwd2">Nouveau Mot de passe</label>
					<div class="controls">
						<input type="password" maxlength="30" pattern="[A-Za-z0-9]*" name="pwd2" id="pwd2" placeholder="**********" />
					</div>
				</div>
			
			
				<div class="control-group">
					<label class="control-label" for="country">Pays</label>
					<div class="controls">
						<select name="country" id="country">
							<option value="<%=profil.getNom_pays() %>"><%=profil.getNom_pays() %></option>
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
					<label class="control-label" for="country">Ville</label>
					<div class="controls">
						<select name="city" id="city">
							<option value="<%=profil.getNom_ville()%>"><%=profil.getNom_ville()%></option>
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
			
			</fieldset>
			
			  <hr>
			
			<div class="control-group">
    			<div class="controls">			    						    			    				
    				<button class="btn" type="reset" data-dismiss="modal" onClick="closeModalModifAccount()">Annuler</button>
   					<button type="submit" class="btn btn-primary">Enregistrer</button>
   				</div>
    		</div>

		</form>
  			
  			</div>
  		
  			<div class="modal-footer">    			
  				  				
  			</div>
</div>


    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">MON COMPTE</li>
              <li><a href="monCompte.html?tab=account">Parametres du compte</a></li>
              <%if(autorisation.equalsIgnoreCase("admin")){ %>
              <li><a href="monCompte.html?tab=annonces"> Annonces a valider</a></li>
              <%}
              else{%>
              <li><a href="monCompte.html?tab=annonces">Mes annonces</a></li>
              <%}%>                       
				    
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
          <div class="hero-unit">  	
          <%
          if(monMembre.isEmpty()==false){
          %>
          	<table class="table table-hover">
		    <caption><h4><strong>Parametres generaux du compte</strong></h4>
		    
		    </caption>
		    	<thead>
		    		<tr>
		    			<th></th>		    			
		    			<th><a href="#" onClick="showModalModifAccount()">modifier</a></th>
		    		</tr>
		    	</thead>
		    	
		    	<tbody>
		    		<tr>
		    			<td>Nom</td>
		   				<td><%=profil.getNom()%></td>		   				
		    		</tr>
		    		
		    		<tr>
		    			<td>Prenom</td>
		   				<td><%=profil.getPrenom()%></td>		   				
		    		</tr>
		    		
		    		<tr>
		    			<td>Pseudo</td>
		   				<td><%=profil.getPseudo()%></td>		   				
		    		</tr>
		    		
		    		<tr>
		    			<td>Date de Naissance</td>
		   				<td><%=profil.getBirth()%></td>		   			
		    		</tr>
		    		
		    		<tr>
		    			<td>Email</td>
		   				<td><%=profil.getEmail()%></td>		   				
		    		</tr>
		    		
		    		<tr>
		    			<td>Tel</td>
		   				<td><%=profil.getTel()%></td>		   				
		    		</tr>
		    		
		    		<tr>
		    			<td>Mot de passe</td>
		   				<td>**********</td>		   				
		    		</tr>
		    		
		    		<tr>
		    			<td>Pays</td>
		   				<td><%=profil.getNom_pays()%></td>		   				
		    		</tr>
		    		
		    		<tr>
		    			<td>Ville</td>
		   				<td><%=profil.getNom_ville()%></td>		   				
		    		</tr>
		    		
		    		
		    	</tbody>
		    </table> 	
        	<%  
          }
          if(mesAnnonces.isEmpty()==false || monMembre.isEmpty()){
          %>
          	<table class="table table-hover">
		    <caption><h4><strong>Mes annonces</strong></h4></caption>
		    	<thead>
		    		<tr>
		    			<th>Postee le</th>
		    			<th>Par</th>
		    			<th>Pays </th>
		    			<th>Ville </th>
		    			<th>Titre</th>		    			
		    			<th>Prix</th>
		    			<th>Contact</th>
		    			<th>Email</th>
		    			
		    			
		    		</tr>
		    	</thead>
		    	
		    	<tbody>
		    	
		    		<% 
		    		for(Annonce a:mesAnnonces){
		    			
		    			if(a.getChecked()==1){%>
		    				<tr class="success">
		    			<%}
		    			else{%>
		    			<tr>
		    			<%} %>		    					    			
			    			<td><%=a.getPublication()%></td>
			    			<td><%=a.getLogin_membre()%></td>
			    			<td><%=a.getNom_pays()%></td>
			    			<td><%=a.getNom_ville()%></td>
			   				<td><a href="annonce.html?country=<%=a.getNom_pays()%>&title=<%=a.getTitre()%>"><%=a.getTitre()%></a></td>		   				
			   				<td><%=a.getPrix()%></td>
			   				<td>Mr <%=a.getNom_auteur()%></td>
			   				<td><%=a.getEmail_auteur()%></td>
			   						
			   				<%if(autorisation.equalsIgnoreCase("user")){%>   						
		   					<td><a href="modifAnnonce.html?id=<%=a.getId_annonce()%>"  ><i class="icon-pencil"></i> </a></td>	   				
		   					<%}%>
		   					<%if(autorisation.equalsIgnoreCase("admin")){%>   						
		   					<td><a href="validateAnnonce.html?id=<%=a.getId_annonce()%>"  ><i class="icon-ok"></i> </a></td>	   				
		   					<%}%>		   					
		   					
		   					<td><a href="deleteAnnonce.html?id=<%=a.getId_annonce()%>"><i class="icon-trash"></i> </a></td>		   							   					
		    				
		    				<%
		    				//Si on est en mode administrateur
		    				if( autorisation.equalsIgnoreCase("admin")){ %>
		    				<td><a href="mailto:<%=a.getEmail_auteur()%>"><i class="icon-envelope"></i></a></td>
		    				<% }%>
		    			</tr>
	    			
		    			<%
		    		}
		    				    			    		
		    		%>		    		
		    		
		    		<tr>
		    			<td>...</td>
		    			<td>...</td>
		    			<td>...</td>
		   				<td>...</td>		   				
		   				<td>...</td>
		   				<td>...</td>
		   				<td>...</td>
		   				<td>...</td>
		    		</tr>		    		   		
		    		
		    	</tbody>
		    </table>
        	
        	<%
        	if(mesAnnonces.isEmpty() && autorisation.equalsIgnoreCase("user")){%>
        		
        		 <div class="alert alert-block">
			    	<button type="button" class="close" data-dismiss="alert">X</button>
			    	Vous n'avez pas encore d'annonces...
			    </div>
        		
        	<%}
        	else if(mesAnnonces.isEmpty()==false && autorisation.equalsIgnoreCase("user")){%>
        	
        	    <div class="alert alert-info">
        	    	<button type="button" class="close" data-dismiss="alert">X</button>
			    	<strong>Info: </strong>Les annonces validees par l'administrateur sont en vert...
   				</div>
        	
        		
        	<%}
          }                 
          %>
               
            <h2>AWANA W'AFRICA!</h2>
            <p>
            AWANA W'AFRICA (les enfants d'Afrique) est une plateforme Web communautaire de troc dediee aux pays africains. <br/>												
			Elle permet de poster une annonce en tant qu'utilisateur authentifie, de gerer son compte et ses annonces. <br/>
			Pour chercher une annonce, cliquez sur le pays de votre choix. <br/>
			Ou           
			</p>
            <p><a class="btn btn-primary btn-large" href="passerAnnonce.html">Passer une annonce ! &raquo;</a></p>
        
          </div>        
    
          <div class="row-fluid">        	
            <div class="span4">
              
            </div><!--/span-->
                    
          </div><!--/row-->
         
        </div><!--/span-->
      </div><!--/row-->

    </div><!--/.fluid-container-->
   
<%@ include file="/design/footer.jspf" %>
