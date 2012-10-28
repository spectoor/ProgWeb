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
public class RechercheController {
	
	@RequestMapping("/recherche")
    public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse response) {
 
    	// Database test 
    	BDDModel mesPays;
    	BDDModel mesCategories;
    	Hashtable<String , Object> model = new Hashtable<String,Object>();
    	Hashtable<Integer, Pays> modelPays = new Hashtable<Integer,Pays>();
    	Hashtable<Integer,Categorie> modelCategorie = new Hashtable<Integer,Categorie>();
        // Modeling
    	
		mesPays = new BDDModel();
		mesCategories = new BDDModel();
		String query = "select * from pays order by Nom_Pays desc";
		modelPays = mesPays.BuildModelPays(query, StatementMysql.stat);	
		
		query = "select * from categories";
		modelCategorie = mesCategories.BuildModelCategorie(query, StatementMysql.stat);
		
		model.put("pays", modelPays);
		model.put("categories",modelCategorie);
    	
		// ******** //

 
    	// To the View
        return new ModelAndView("recherche", "bdd", model);
        
        
        
        
        
        
        
        
    }


}
