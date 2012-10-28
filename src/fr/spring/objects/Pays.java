package fr.spring.objects;

public class Pays {
	private int id_pays;
	private String nom;
	private String devise;
	
	
	public Pays(int id_pays, String nom, String devise) {
		super();
		this.id_pays = id_pays;
		this.nom = nom;
		this.devise = devise;
	}

	

	public String getDevise() {
		return devise;
	}

	public void setDevise(String devise) {
		this.devise = devise;
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
