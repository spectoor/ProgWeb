package fr.spring.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import fr.spring.model.SendQueryModel;
import fr.spring.objects.Pays;
import fr.spring.objects.StatementMysql;

@Controller
@RequestMapping("/finishAnnonceForm")
public class FinishPasserAnnonceController {
	
	// View URL definition
	
			@RequestMapping(method=RequestMethod.POST)
		    public ModelAndView HandleRequest(HttpServletRequest request, HttpServletResponse response) {
		 
		    	// Database test   	
		    	SendQueryModel sendInscription = new SendQueryModel();
		    	Hashtable<Integer, Pays> model = new Hashtable<Integer, Pays>();
		    	
		    					
			        // Modeling
			    //Getting form data
		    	
		    	String nom = request.getParameter("nom");
		    	String prenom = request.getParameter("prenom");
		    	String email = request.getParameter("email");
		    	String tel = request.getParameter("tel");
		    	String pays = request.getParameter("country");
		    	String ville = request.getParameter("city");
		    	//String membre = request.getParameter("membre");
		    	String categorie = request.getParameter("categorie");
		    	
		    	String titre = request.getParameter("titre");
		    	String description = request.getParameter("description");		    	
		    	int prix = 1;//Integer.parseInt(request.getParameter("prix"));
		    	String type = request.getParameter("type");
		    	
		    	String date = "";
	    	
		    	int pro=1; 
		    	int checked=0;
		    	
		    	//getting the member login TO DO CODE
		    	String login  = (String)request.getSession().getAttribute("userName");
		    			    
		    	//getting the person type (particular or professional)
		    	if(request.getParameter(type)=="part"){
		    		pro=0;
		    	}
		    	else{
		    		pro=1;
		    		
		    	}
		    	
	    	
		    	
		    	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		    	java.util.Date today = new java.util.Date();
		    	
		    	date = format.format(today);
		    	
		    	
		    	//getting the uploaded image
		    	/*DiskFileItemFactory factory= new DiskFileItemFactory();
		    	ServletFileUpload upload = new ServletFileUpload(factory);
		    	List items=null;
		    	
		    	try{
		    		
		    		items=upload.parseRequest(request);
		    		Iterator i=items.iterator();
		    		
		    		while(i.hasNext()){
		    			
		    			FileItem item=(FileItem)i.next();
		    			
		    			if(!item.isFormField()){		    				
		    				// le nom du fichier
				    	    String[] tmp = item.getName().split("\\");
				    	    String name = tmp[tmp.length-1];            
				    	    item.write(new File(name));		    		
		    			}
		    		}
		    	}catch (Exception e) {e.printStackTrace();}

*/
		    	
		    	
		    	
		    	
		    	String query = "insert into annonces (Nom_Categorie,Nom_Pays,Nom_Ville,Login_Membre,Nom_Auteur, Prenom_Auteur," +
		    			"Tel_Auteur,Email_Auteur,Publication,Titre,Description,Prix,Pro,Checked) VALUES " +
				"(\"" + categorie + "\",\"" + pays + "\",\"" + ville +"\",\"" + login +"\",\""+ nom +"\",\""+ prenom +"\",\""+
				 tel +"\",\"" + email +"\",\""+ date+"\",\"" + titre +"\",\"" + description +"\"," + prix + "," + pro + ","+ checked +")" ;
		    	
		    	
		    	
		    	//System.out.println(query);
		    	
				
				sendInscription.executeQ(query, StatementMysql.stat);				
			    // ******** //

		    	// To the View
		        return new ModelAndView("finishAnnonceForm", "bdd", model);
		    }

}
