package fr.spring.objects;

public class Annonce {
	private int id_annonce;
	private String nom_categorie;
	private String nom_pays;
	private String nom_ville;
	private String login_membre;
	private String nom_auteur;
	private String prenom_auteur;
	private String tel_auteur;
	private String email_auteur;
	private String publication;
	private String titre;
	private String description;	
	private int prix;	
	private int pro;
	private int checked;
	
	
	
	public Annonce() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Annonce(int id_annonce, String nom_categorie, String nom_pays, String nom_ville,
			String login_membre, String nom_auteur, String prenom_auteur,
			String tel_auteur, String email_auteur, String publication,
			String titre, String description, int prix, int pro, int checked) {
		super();
		this.id_annonce = id_annonce;
		this.nom_categorie = nom_categorie;
		this.nom_pays = nom_pays;
		this.nom_ville = nom_ville;
		this.login_membre = login_membre;
		this.nom_auteur = nom_auteur;
		this.prenom_auteur = prenom_auteur;
		this.tel_auteur = tel_auteur;
		this.email_auteur = email_auteur;
		this.publication = publication;
		this.titre = titre;
		this.description = description;
		this.prix = prix;
		this.pro = pro;
		this.checked = checked;
	}


	public int getId_annonce() {
		return id_annonce;
	}


	public void setId_annonce(int id_annonce) {
		this.id_annonce = id_annonce;
	}


	


	public String getNom_categorie() {
		return nom_categorie;
	}


	public void setNom_categorie(String nom_categorie) {
		this.nom_categorie = nom_categorie;
	}


	public String getNom_pays() {
		return nom_pays;
	}


	public void setNom_pays(String nom_pays) {
		this.nom_pays = nom_pays;
	}


	public String getNom_ville() {
		return nom_ville;
	}


	public void setNom_ville(String nom_ville) {
		this.nom_ville = nom_ville;
	}


	public String getLogin_membre() {
		return login_membre;
	}


	public void setLogin_membre(String login_membre) {
		this.login_membre = login_membre;
	}


	public String getNom_auteur() {
		return nom_auteur;
	}


	public void setNom_auteur(String nom_auteur) {
		this.nom_auteur = nom_auteur;
	}


	public String getPrenom_auteur() {
		return prenom_auteur;
	}


	public void setPrenom_auteur(String prenom_auteur) {
		this.prenom_auteur = prenom_auteur;
	}


	public String getTel_auteur() {
		return tel_auteur;
	}


	public void setTel_auteur(String tel_auteur) {
		this.tel_auteur = tel_auteur;
	}


	public String getEmail_auteur() {
		return email_auteur;
	}


	public void setEmail_auteur(String email_auteur) {
		this.email_auteur = email_auteur;
	}


	public String getPublication() {
		return publication;
	}


	public void setPublication(String publication) {
		this.publication = publication;
	}


	public String getTitre() {
		return titre;
	}


	public void setTitre(String titre) {
		this.titre = titre;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getPrix() {
		return prix;
	}


	public void setPrix(int prix) {
		this.prix = prix;
	}


	public int getPro() {
		return pro;
	}


	public void setPro(int pro) {
		this.pro = pro;
	}


	public int getChecked() {
		return checked;
	}


	public void setChecked(int checked) {
		this.checked = checked;
	}


	@Override
	public String toString() {
		return "Annonce [id_annonce=" + id_annonce + ", nom_categorie="
				+ nom_categorie + ", nom_pays=" + nom_pays + ", nom_ville="
				+ nom_ville + ", login_membre=" + login_membre
				+ ", nom_auteur=" + nom_auteur + ", prenom_auteur="
				+ prenom_auteur + ", tel_auteur=" + tel_auteur
				+ ", email_auteur=" + email_auteur + ", publication="
				+ publication + ", titre=" + titre + ", description="
				+ description + ", prix=" + prix + ", pro=" + pro
				+ ", checked=" + checked + "]";
	}


	
	
	
	
	
	
		
}
