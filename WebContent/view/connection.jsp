<%@ include file="/design/header.jspf" %>

  
    <div class="container-fluid">
		<div class="row-fluid">
        
		
        <div class="span9">
        
          <div class="hero-unit">
          
          	<h3> CONNECTION: </h3>
          	
          	    <form class="form-horizontal" action="finishConnection.html" method="post">
			    	<div class="control-group">
			    		<label class="control-label" for="inputLogin">Login</label>
			    		<div class="controls">
			    			<input type="text" id="login" name="login" placeholder="Login" required/>
			    		</div>
			    	</div>
			    	
			    	<div class="control-group">
			    		<label class="control-label" for="inputPassword">Password</label>
			    		<div class="controls">
			    			<input type="password" id="pwd" name="pwd" placeholder="Password" required/>
			    		</div>
			    	</div>
			    	
			    	<div class="control-group">
			    		<div class="controls">			    						    			
			    			<button type="submit" class="btn">Sign in</button>
			   			</div>
			    	</div>
			    </form>
			    
			    <hr/>
			    Vous n'avez pas encore de compte? <a href="inscription.html">Créer un compte</a>

          </div>
          <div class="row-fluid">
      </div><!--/row--> 
        </div><!--/span-->
      </div><!--/row-->

     
    </div><!--/.fluid-container-->

   <%@ include file="/design/footer.jspf" %>