<%@ include file="/design/header.jspf" %>

  
  <%
		BDDModel mesPays = new BDDModel();
		Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();				
		model = mesPays.BuildModelPays("select * from pays order by Nom_Pays desc", StatementMysql.stat);						
		Collection<Pays> mesPaysC = model.values();	
		String name;		
  %>	   
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header"><i class="icon-globe"></i>LISTE DES PAYS <hr/></li>                                      
				<%	
					//Read database					
					for(Pays c:mesPaysC)
					{
						name = c.getNom();						
						%>								
						<li><a href="affichage.html?country=<%=name%>"> <%=name%> </a> </li>
						<% 											
					}																	
				%>		         
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
          <div class="hero-unit">
            <h2>AWANA W'AFRICA!</h2>           
            <p>
            AWANA W'AFRICA (les enfants d'Afrique) est une plateforme Web communautaire de troc dédiée aux pays africains. <br/>												
			Elle permet de poster une annonce en tant qu'utilisateur authentifié, de gérer son compte et ses annonces. <br/>
			Pour chercher une annonce, cliquez sur le pays de votre choix. <br/>
			Ou
			
			
			
			
            </p>
            <p><a class="btn btn-primary btn-large" href="passerAnnonce.html">Passer une annonce ! &raquo;</a></p>
        
          </div>
          
          <img src="design/img/afrique.jpg" id="afriqueMap" alt="Carte d'Afrique" />
          
          <div class="row-fluid">        	
            <div class="span4">
              
            </div><!--/span-->
                    
          </div><!--/row-->
         
        </div><!--/span-->
      </div><!--/row-->
      </div>         
    
    
<%@ include file="/design/footer.jspf" %>