package fr.spring.objects;

public class Ville {
	
	private int id_ville;
	private String nom_pays;
	private String nom_Ville;
	
	
	public Ville(int id_ville, String nom_pays, String nom_Ville) {
		super();
		this.id_ville = id_ville;
		this.nom_pays = nom_pays;
		this.nom_Ville = nom_Ville;
	}

	public int getId_ville() {
		return id_ville;
	}

	public void setId_ville(int id_ville) {
		this.id_ville = id_ville;
	}

	public String getNom_pays() {
		return nom_pays;
	}

	public void setNom_pays(String nom_pays) {
		this.nom_pays = nom_pays;
	}

	public String getNom_Ville() {
		return nom_Ville;
	}

	public void setNom_Ville(String nom_Ville) {
		this.nom_Ville = nom_Ville;
	}

	
	
	

}
