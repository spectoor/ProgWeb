<%@ include file="/design/header.jspf" %>

<%
		Hashtable<String, Object> model = new Hashtable<String, Object>();
		Hashtable<Integer, Membre> modelMembre = new Hashtable<Integer, Membre>();
		Hashtable<Integer, Annonce> modelAnnonce = new Hashtable<Integer, Annonce>();;
		
		model = (Hashtable<String, Object>)request.getAttribute("bdd");
		
		modelMembre = (Hashtable<Integer, Membre>)model.get("membre");
		
		modelAnnonce = (Hashtable<Integer, Annonce>)model.get("annonces");
		
		Collection<Membre> monMembre = modelMembre.values();
		Collection<Annonce> mesAnnonces = modelAnnonce.values();
		
		String nom= new String();
		String prenom= new String();
		String pseudo= new String();
		String birth= new String();
		String email= new String();
		String pays= new String();
		
		String date= new String();
		String titre= new String();
		String paysA= new String();
		String villeA= new String();
		String nomContact= new String();
		int prix= 0;
		
		for(Membre m:monMembre){
			nom=m.getNom();
			prenom=m.getPrenom();
			pseudo=m.getPseudo();
			birth=m.getBirth();
			email=m.getEmail();
			pays=m.getNom_pays();	
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

<script type="text/javascript"> 
 		
	      function closeModalModifAnnonce(){
	    	  
	    	  $('#modalModifAnnonce').modal('hide');
	      }
	      
	      function showModalModifAnnonce(){	    	  
	    	  $('#modalModifAnnonce').modal('show');
	    	  
	      }
</script>


<!-- Modal annonce modification -->
<div class="modal hide fade" id="modalModifAnnonce" style="display: none;" >
	
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" >x</button>
			<h3 id="myModalLabel">Mon Annonce</h3>
		</div>
	
		<div class="modal-body">
		
			<form class="form-horizontal" method="post" action="finishModifAccount.html">

			<fieldset>
					
				<legend>Modification de l'annonce</legend> <!-- Titre du fieldset -->												
							
				<div class="control-group">
					<label class="control-label" for="nom">Titre</label>
					<div class="controls">
						<input type="text" name="titre" id="titre" value="" required/>
					</div>
				</div>
			
				<div class="control-group">
					<label class="control-label" for="prenom">Description</label>
					<div class="controls">
						<input type="text" name="prenom" id="prenom" value="" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="email" id="email" name="email" value="" required/>
					</div>
				</div>
			
				<div class="control-group">
					<label class="control-label" for="pwd1">Ancien Mot de passe</label>
					<div class="controls">
						<input type="password" name="pwd1" id="pwd1" placeholder="**********" />
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="pwd2">Nouveau Mot de passe</label>
					<div class="controls">
						<input type="password" name="pwd2" id="pwd2" placeholder="**********" />
					</div>
				</div>
			
			
				<div class="control-group">
					<label class="control-label" for="country">Pays</label>
					<div class="controls">
						<select name="country" id="country">
							<option value="none">Selectionnez votre pays de residence</option>								
						</select>
					</div>
				</div>
			
			</fieldset>
			
			<div class="control-group">
    			<div class="controls">			    						    			
    				<button type="submit" class="btn">Enregistrer</button>
   				</div>
    		</div>

		</form>
  			
  			</div>
  		
  			<div class="modal-footer">    			
  				<button class="btn" type="reset" data-dismiss="modal" onClick="closeModalModifAnnonce()">Close</button>
  				<button class="btn btn-primary" type="submit">Save changes</button>
  			</div>
</div>          	




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
						<input type="text" name="nom" id="nom" value="<%=nom %>" required/>
					</div>
				</div>
			
				<div class="control-group">
					<label class="control-label" for="prenom">Prenom</label>
					<div class="controls">
						<input type="text" name="prenom" id="prenom" value="<%=prenom%>" required/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="email" id="email" name="email" value="<%=email%>" required/>
					</div>
				</div>
			
				<div class="control-group">
					<label class="control-label" for="pwd1">Ancien Mot de passe</label>
					<div class="controls">
						<input type="password" name="pwd1" id="pwd1" placeholder="**********" />
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="pwd2">Nouveau Mot de passe</label>
					<div class="controls">
						<input type="password" name="pwd2" id="pwd2" placeholder="**********" />
					</div>
				</div>
			
			
				<div class="control-group">
					<label class="control-label" for="country">Pays</label>
					<div class="controls">
						<select name="country" id="country">
							<option value="none">Selectionnez votre pays de residence</option>								
						</select>
					</div>
				</div>
			
			</fieldset>
			
			<div class="control-group">
    			<div class="controls">			    						    			
    				<button type="submit" class="btn">Enregistrer</button>
   				</div>
    		</div>

		</form>
  			
  			</div>
  		
  			<div class="modal-footer">    			
  				<button class="btn" type="reset" data-dismiss="modal" onClick="closeModalModifAccount()">Close</button>
  				<button class="btn btn-primary" type="submit">Save changes</button>
  			</div>
</div>


  
  
	

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">MON COMPTE</li>
              <li><a href="monCompte.html?tab=account">Parametres du compte</a></li>
              <li><a href="monCompte.html?tab=annonces">Mes annonces</a></li>                        
				    
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
          <div class="hero-unit">  	
          <%
          if(monMembre.isEmpty()==false){
          %>
          	<table class="table table-hover">
		    <caption><h4><strong>Parametres generaux du compte</strong></h4></caption>
		    	<thead>
		    		<tr>
		    			<th></th>
		    			<th></th>
		    		</tr>
		    	</thead>
		    	
		    	<tbody>
		    		<tr>
		    			<td>Nom</td>
		   				<td><%=nom%></td>
		   				<td><a href="#" onClick="showModalModifAccount()">modifier</a></td>
		    		</tr>
		    		
		    		<tr>
		    			<td>Prenom</td>
		   				<td><%=prenom%></td>
		   				<td><a href="#">modifier</a></td>
		    		</tr>
		    		
		    		<tr>
		    			<td>Pseudo</td>
		   				<td><%=pseudo%></td>
		   				<td><a href="#">modifier</a></td>
		    		</tr>
		    		
		    		<tr>
		    			<td>Date de Naissance</td>
		   				<td><%=birth%></td>
		   				<td><a href="#">modifier</a></td>
		    		</tr>
		    		
		    		<tr>
		    			<td>Email</td>
		   				<td><%=email%></td>
		   				<td><a href="#">modifier</a></td>
		    		</tr>
		    		
		    		<tr>
		    			<td>Tel</td>
		   				<td>06 70 83 40 48</td>
		   				<td><a href="#">modifier</a></td>
		    		</tr>
		    		
		    		<tr>
		    			<td>Mot de passe</td>
		   				<td>**********</td>
		   				<td><a href="#">modifier</a></td>
		    		</tr>
		    		
		    		
		    	</tbody>
		    </table> 	
        	<%  
          }
          if(mesAnnonces.isEmpty()==false){
          %>
          	<table class="table table-hover">
		    <caption><h4><strong>Mes annonces</strong></h4></caption>
		    	<thead>
		    		<tr>
		    			<th>Postee le</th>
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
		    			%>
		    			<tr>
			    			<td><%=a.getPublication()%></td>
			    			<td><%=a.getNom_pays()%></td>
			    			<td><%=a.getNom_ville()%></td>
			   				<td><a href="annonce.html?country=<%=a.getNom_pays()%>&title=<%=a.getTitre()%>"><%=a.getTitre()%></a></td>		   				
			   				<td><%=a.getPrix()%></td>
			   				<td>Mr <%=a.getNom_auteur()%></td>
			   				<td><%=a.getEmail_auteur()%></td>		   						
		   					<td><a href="#"  onClick="showModalModifAnnonce()"><i class="icon-pencil"></i> </a></td>	   				
		   					<td><a href="#"><i class="icon-trash"></i> </a></td>
		   			
		    			</tr>
	    			
		    			<%
		    		}
		    				    			    		
		    		%>
		    		<tr>
		    			<td>16/10/2012</td>
		    			<td>Gabon</td>
		    			<td>Libreville</td>
		   				<td><a>Vente de Tickets de concert</a></td>		   				
		   				<td>12000 FCFA</td>
		   				<td>Mr Fausther</td>
		   				<td>dblezo@faust.fr</td>
		   				<td><a href="#">modifier</a></td>
		    		</tr>
		    		
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
          }
                 
          %>
          
      
            <h2>AKOYOKA!</h2>
            <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
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
