package fr.spring.controller;


import java.util.Hashtable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import fr.spring.model.BDDModel;
import fr.spring.objects.Membre;
import fr.spring.objects.Pays;
import fr.spring.objects.StatementMysql;


@Controller
public class InscriptionController {
	
	 @RequestMapping("/inscription")
	    public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse response) {
	 
	    	// Database test 
	    	
	    	Hashtable<String, Object> model = new Hashtable<String, Object>();
	    	Hashtable<Integer, Pays> modelPays = new Hashtable<Integer, Pays>();
	    	Hashtable<Integer, Membre> modelMembres = new Hashtable<Integer, Membre>();
	    	
	    	BDDModel mesPays = new BDDModel();
	    	BDDModel mesMembres = new BDDModel();
	        // Modeling
	    	
			String query = "select * from pays order by Nom_Pays desc"; 
			modelPays = mesPays.BuildModelPays(query, StatementMysql.stat);
			
			query = "select * from membres"; 
			modelMembres = mesMembres.BuildModelMembre(query, StatementMysql.stat);
 	
	 
	    	// To the View
			model.put("pays", modelPays);
			model.put("membres", modelMembres);
			
	        return new ModelAndView("inscription", "bdd", model);
	    }

}
