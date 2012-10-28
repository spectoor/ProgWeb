package fr.spring.controller;

import java.util.Hashtable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import fr.spring.model.BDDModel;
import fr.spring.objects.Annonce;
import fr.spring.objects.Membre;
import fr.spring.objects.Pays;
import fr.spring.objects.StatementMysql;

@Controller
public class MonCompteController {
	
	// View URL definition
    @RequestMapping("/monCompte")
    public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse response) {
 
    	// Database test
    	BDDModel mesMembres = new BDDModel();
    	BDDModel mesAnnonces = new BDDModel();
    	BDDModel mesPays = new BDDModel();
    	
    	Hashtable<Integer, Annonce> modelAnnonce = new Hashtable<Integer, Annonce>();
    	Hashtable<Integer, Membre> modelMembre = new Hashtable<Integer, Membre>();
    	Hashtable<Integer, Pays> modelPays = new Hashtable<Integer, Pays>();
    	
    	Hashtable<String, Object> model = new Hashtable<String, Object>();
    	String autorisation = (String)request.getSession().getAttribute("autorisation");
		
		//BUild the "annonce" model from the country
		String val= (String)request.getParameter("tab");
		
		String query = new String();
		System.out.println("****************************"+ val +"************");
		//int idPays = Integer.parseInt(pays);
		
		//getting the session name
		String username =(String)request.getSession().getAttribute("userName");
		
		if(val.equalsIgnoreCase("account")){
			query = "select * from membres where Pseudo = \"" + username +"\"";
			System.out.println("****************************"+ query);		
			modelMembre = mesMembres.BuildModelMembre(query, StatementMysql.stat);
			
			//model.put("annonces", null);
			
		}	
		else if(val.equalsIgnoreCase("annonces")){
			
			if(autorisation.equalsIgnoreCase("user"))
				query = "select * from annonces where Login_Membre =\""+ username +"\"";
			else
				query = "select * from annonces where Checked = 0";
			
			System.out.println("****************************"+ query);			
			modelAnnonce = mesAnnonces.BuildModelAnnonce(query, StatementMysql.stat);	
						
		}
		
		
		
	
		query = "select * from pays order by Nom_Pays desc";
		modelPays = mesPays.BuildModelPays(query, StatementMysql.stat);		
	
		model.put("membre", modelMembre);
		model.put("annonces", modelAnnonce);
		model.put("pays",modelPays);
	    // ******** //
		
   	    
    	// To the View
        return new ModelAndView("monCompte", "bdd", model);
    }

}
