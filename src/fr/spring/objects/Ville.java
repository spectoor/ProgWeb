package fr.spring.objects;

public class Ville {
	
	private int id_ville;
	private int id_pays;
	private String Nom_Ville;
	
	public Ville(int id_ville, int id_pays, String nom_Ville) {
		super();
		this.id_ville = id_ville;
		this.id_pays = id_pays;
		Nom_Ville = nom_Ville;
	}

	public int getId_ville() {
		return id_ville;
	}

	public void setId_ville(int id_ville) {
		this.id_ville = id_ville;
	}

	public int getId_pays() {
		return id_pays;
	}

	public void setId_pays(int id_pays) {
		this.id_pays = id_pays;
	}

	public String getNom_Ville() {
		return Nom_Ville;
	}

	public void setNom_Ville(String nom_Ville) {
		Nom_Ville = nom_Ville;
	}

	@Override
	public String toString() {
		return "Ville [id_ville=" + id_ville + ", id_pays=" + id_pays
				+ ", Nom_Ville=" + Nom_Ville + "]";
	}
	
	
	
	
	

}
