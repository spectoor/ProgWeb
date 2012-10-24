package fr.spring.controller;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import fr.spring.model.BDDModel;
import fr.spring.objects.Annonce;
import fr.spring.objects.Categorie;
import fr.spring.objects.StatementMysql;

@Controller
@RequestMapping("/affichage")
public class AffichageController {
	
	// View URL definition
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse response) {
 
    	// Database test
    	BDDModel mesCategorie = new BDDModel();
    	BDDModel mesAnnonces = new BDDModel();
    	
    	Hashtable<Integer, Annonce> modelAnnonce = new Hashtable<Integer, Annonce>();
    	Hashtable<Integer, Categorie> modelCategorie = new Hashtable<Integer, Categorie>();
    	
    	Hashtable<String, Object> model = new Hashtable<String, Object>();
    	String pays= request.getParameter("country");
		String cat= request.getParameter("cat");
		String search = request.getParameter("search");				
		
    	
    	
	    // Modeling
		modelCategorie = mesCategorie.BuildModelCategorie("select * from categories", StatementMysql.stat);
		
		//BUild the "annonce" model from the country						
		
		String query = "select * from annonces where Nom_Pays = \"" + pays +"\" && Checked = 1";
		
		if(cat != null ){
			query = "select * from annonces where Nom_Pays = \"" + pays + "\" && Nom_Categorie = \"" + cat + "\" && Checked = 1";
		}
		
		
		/*
		if(search != null){
			query = "select * from annonces where  Checked = 1 && (Titre like  \"%" + search + "%\" || Description like \"%" + search + "%\" )";
			
			//searching by country
			if(pays.equalsIgnoreCase("none")==false){
				query ="select * from annonces where Checked = 1 && Nom_Pays= \"" + pays + "\" && (Titre like  \"%" + search + "%\" || Description like \"%" + search + "%\")";
			}
			
			if(cat.equalsIgnoreCase("none")==false){
				query ="select * from annonces where Checked = 1 && Nom_Categorie= \"" + cat + "\" && (Titre like  \"%" + search + "%\" || Description like \"%" + search + "%\")";
				if(pays.equalsIgnoreCase("none")==false){
					query ="select * from annonces where Checked = 1 && Nom_Categorie = \"" + cat + "\" && Nom_Pays= \"" + pays + "\" && (Titre like  \"%" + search + "%\" || Description like \"%" + search + "%\")";
				}
			}
			
			
		}
		*/
		
		
		//research mode
		if(search != null){
			query = "select * from annonces where  Checked = 1 && (Titre like  \"%" + search + "%\" || Description like \"%" + search + "%\")";
			
			//searching by country
			if(pays!=null){
				
				if(pays.equalsIgnoreCase("none")==false){
					query +=" && Nom_Pays= \"" + pays + "\"";
				}
				
			}
			
			if(cat!=null){
				if(cat.equalsIgnoreCase("none")==false){
					query +=" && Nom_Categorie= \"" + cat + "\"";				
				}
			}
			
			if(request.getParameter("prix")!= null ){
				
				if(! request.getParameter("prix").isEmpty()){
					
					int prix = Integer.parseInt(request.getParameter("prix"));
					String plusOumoins = request.getParameter("moinsplus");
					
					if(plusOumoins.equalsIgnoreCase("moins"))
						query +=" && Prix < " + prix;
					else
						query +=" && Prix > " + prix;
					
				}			
				
			}
						
		}
		
	
		System.out.println(search);
		System.out.println(query);
	
		modelAnnonce = mesAnnonces.BuildModelAnnonce(query,  StatementMysql.stat);
		
		model.put("categories", modelCategorie);
		model.put("annonces", modelAnnonce);
	    // ******** //
		   	    
    	// To the View
        return new ModelAndView("affichage", "bdd", model);
    }

}
