package fr.spring.objects;

public class Membre {
	
	private int id_membre;
	private String nom_pays;
	private String nom_ville;
	private String nom;
	private String prenom;
	private String pseudo;
	private String birth;
	private String email;
	private String tel;
	private String password;
	private String type;
	private String admin;
	
	
	
	
	public Membre() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Membre(int id_membre, String nom_pays, String nom_ville,  String nom,
			String prenom, String pseudo, String birth, String email, String tel,
			String password, String type,String admin) {
		super();
		this.id_membre = id_membre;
		this.nom_pays = nom_pays;
		this.nom_ville = nom_ville;
		this.nom = nom;
		this.prenom = prenom;
		this.pseudo = pseudo;
		this.birth = birth;
		this.email = email;
		this.tel = tel;
		this.password = password;
		this.type = type;
		this.admin = admin;
	}

	
	

	public String getNom_ville() {
		return nom_ville;
	}




	public void setNom_ville(String nom_ville) {
		this.nom_ville = nom_ville;
	}




	public String getTel() {
		return tel;
	}




	public void setTel(String tel) {
		this.tel = tel;
	}




	public String getType() {
		return type;
	}




	public void setType(String type) {
		this.type = type;
	}


	public String getAdmin() {
		return admin;
	}




	public void setAdmin(String admin) {
		this.admin = admin;
	}




	public int getId_membre() {
		return id_membre;
	}


	public void setId_membre(int id_membre) {
		this.id_membre = id_membre;
	}


	public String getNom_pays() {
		return nom_pays;
	}


	public void setNom_pays(String nom_pays) {
		this.nom_pays = nom_pays;
	}


	

	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getPrenom() {
		return prenom;
	}


	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}


	public String getPseudo() {
		return pseudo;
	}


	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "Membre [id_membre=" + id_membre + ", nom_pays=" + nom_pays
				+ ", nom=" + nom + ", prenom=" + prenom + ", pseudo=" + pseudo
				+ ", birth=" + birth + ", email=" + email + ", password="
				+ password + "]";
	}


	
	
	
	
	

}
