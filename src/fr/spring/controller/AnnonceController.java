package fr.spring.controller;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import fr.spring.model.BDDModel;
import fr.spring.objects.Annonce;
import fr.spring.objects.Categorie;
import fr.spring.objects.StatementMysql;

@Controller
public class AnnonceController {
	
	// View URL definition
    @RequestMapping("/annonce")
    public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse response) {
 
    	// Database test
    	BDDModel mesCategorie = new BDDModel();
    	BDDModel mesAnnonces = new BDDModel();
    	
    	Hashtable<Integer, Annonce> modelAnnonce = new Hashtable<Integer, Annonce>();
    	Hashtable<Integer, Categorie> modelCategorie = new Hashtable<Integer, Categorie>();
    	
    	Hashtable<String, Object> model = new Hashtable<String, Object>();
    	
    	
    	
	    // Modeling
		modelCategorie = mesCategorie.BuildModelCategorie("select * from categories", StatementMysql.stat);
		
		//BUild the "annonce" model from the country
		String pays= request.getParameter("country");
		String titre= request.getParameter("title");
		String query;
		
		//int idPays = Integer.parseInt(pays);
		
		query = "select * from annonces where Nom_Pays = \"" + pays +"\"";
		
		if(titre != null ){
			query = "select * from annonces where Nom_Pays = \"" + pays + "\" && Titre = \"" + titre + "\"";
		}
		
		modelAnnonce = mesAnnonces.BuildModelAnnonce(query,  StatementMysql.stat);
		
		model.put("categories", modelCategorie);
		model.put("annonces", modelAnnonce);
	    // ******** //
		
   	    
    	// To the View
        return new ModelAndView("annonce", "bdd", model);
    }

}
