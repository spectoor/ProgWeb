package fr.spring.objects;

public class Pays {
	private int id_pays;
	private String nom;
	
	
	public Pays(int id_pays, String nom) {
		super();
		this.id_pays = id_pays;
		this.nom = nom;
	}


	public int getId_pays() {
		return id_pays;
	}


	public void setId_pays(int id_pays) {
		this.id_pays = id_pays;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	@Override
	public String toString() {
		return "Pays [id_pays=" + id_pays + ", nom=" + nom + "]";
	}
	
	

}
