package fr.spring.objects;

import java.util.ArrayList;

public class Categorie {
	
	private int id;
	private String nomCategorie;
	public ArrayList<Categorie> sousCategorie;
	
	
	public Categorie(int id, String nomCategorie) {
		super();
		this.id = id;
		this.nomCategorie = nomCategorie;
		this.sousCategorie = new ArrayList<Categorie>();
		
	}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNomCategorie() {
		return nomCategorie;
	}


	public void setNomCategorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
	}
	
	
	public ArrayList<Categorie> getSousCategorie() {
		return sousCategorie;
	}

	public void setSousCategorie(ArrayList<Categorie> sousCategorie) {
		this.sousCategorie = sousCategorie;
	}

	@Override
	public String toString() {
		return "Categorie [id=" + id + ", nomCategorie=" + nomCategorie + "]";
	}
	
	
	
	
	

}
