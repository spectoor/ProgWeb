<%@ include file="/design/header.jspf" %>

  
  <%
		BDDModel mesPays = new BDDModel();
		Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();				
		model = mesPays.BuildModelPays("select Id_Pays, Nom_Pays from pays order by Nom_Pays desc", StatementMysql.stat);						
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
            <h2>AKOYOKA!</h2>           
            <p>This is a template for a simple marketing or informational website. It includes a large callout called
             the hero unit and three supporting pieces of content. Use it as a starting point to create something more
              unique.
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