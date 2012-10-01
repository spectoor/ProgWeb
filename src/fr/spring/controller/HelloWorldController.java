package fr.spring.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Hashtable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import fr.spring.model.BDDModel;
import fr.spring.objects.Contact;

// HelloWorld controller: test of database connection and modeling method
@Controller
public class HelloWorldController {
 
	// View URL definition
    @RequestMapping("/hello")
    public ModelAndView helloWorld() {
 
    	// Database test
    	
    	Connection c = null;
    	Statement s = null;
    	BDDModel mesContacts;
    	Hashtable<Integer, Contact> model = null;
    	
    	try {
    		
    		// Database type chooser
			Class.forName("com.mysql.jdbc.Driver");
			// Connection to database (jdbc:typedb://address/database, "user", "password")
			c = DriverManager.getConnection("jdbc:mysql://localhost/ProgWebTest","root","");
			// handle on user's action
			s = c.createStatement();
			
	        // Modeling
	    	
			mesContacts = new BDDModel();
			model = mesContacts.BuildModel("select nom, prenom, mail from contact order by nom desc", s);
			
	    	// ******** //
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error connection : " + e.getMessage());
			e.printStackTrace();
		}
    	
    	// To the View
        return new ModelAndView("hello", "bdd", model);
    }
}
