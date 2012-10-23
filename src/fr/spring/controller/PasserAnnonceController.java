package fr.spring.controller;


import java.util.Hashtable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import fr.spring.model.BDDModel;
import fr.spring.objects.Categorie;
import fr.spring.objects.Pays;
import fr.spring.objects.StatementMysql;

@Controller
public class PasserAnnonceController {
	
	 @RequestMapping("/passerAnnonce")
	    public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse response) {
	 
	    	// Database test 
	    	BDDModel mesPays;
	    	BDDModel mesCategories;
	    	Hashtable<String , Object> model = new Hashtable<String,Object>();
	    	
	    	
	        // Modeling
	    	
			mesPays = new BDDModel();
			mesCategories = new BDDModel();
			Hashtable<Integer, Pays> modelPays = mesPays.BuildModelPays("select Id_Pays, Nom_Pays from pays order by Nom_Pays desc", StatementMysql.stat);
			
			Hashtable<Integer,Categorie> modelCategorie = mesCategories.BuildModelCategorie("select Id_Categorie, Nom_Categorie from categories", StatementMysql.stat);
			
			model.put("pays", modelPays);
			model.put("categories",modelCategorie);
	    	
			// ******** //
	
	 
	    	// To the View
	        return new ModelAndView("passerAnnonce", "bdd", model);
	        
	        
	        
	        
	        
	        
	        
	        
	    }


}
