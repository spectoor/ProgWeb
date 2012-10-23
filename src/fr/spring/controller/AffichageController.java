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
public class AffichageController {
	
	// View URL definition
    @RequestMapping("/affichage")
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
		String cat= request.getParameter("cat");
		String query;
		
		//int idPays = Integer.parseInt(pays);
		
		query = "select * from annonces where Nom_Pays = \"" + pays +"\"";
		
		if(cat != null ){
			query = "select * from annonces where Nom_Pays = \"" + pays + "\" && Nom_Categorie = \"" + cat + "\"";
		}
		
			
		
		
		
		
		/*String query ="select Id_Annonce, Id_Categorie,Id_Pays, Id_Ville, Id_Membre, Nom_Auteur, Prenom_Auteur," +
				" Tel_Auteur, Email_Auteur, Publication, Titre, Description, Prix, Pro, Checked  from annonces " +
				"where Id_Pays =" + idPays;
		*/
		
		
		
		
		
		
		
		modelAnnonce = mesAnnonces.BuildModelAnnonce(query,  StatementMysql.stat);
		
		model.put("categories", modelCategorie);
		model.put("annonces", modelAnnonce);
	    // ******** //
		
   	    
    	// To the View
        return new ModelAndView("affichage", "bdd", model);
    }

}
