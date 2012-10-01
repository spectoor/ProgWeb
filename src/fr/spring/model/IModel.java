package fr.spring.model;

import java.sql.Statement;
import java.util.Hashtable;

import fr.spring.objects.Contact;

public interface IModel {
	
	public Hashtable<Integer, Contact> BuildModel(String query, Statement state);

}
