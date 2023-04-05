package Projet.model;

import java.sql.Date;

public class Receveur {
	String cIN;
	String nomReceveur;
	String prenomReceveur;
	String sexe;
	String ville;
	String groupage;
	Date dateDeNaissance;
	String numTele;
	String email;
	String motDePasse;
	public Receveur (String cIN, String nomReceveur, String prenomReceveur, String sexe, String ville, String groupage,
			Date dateDeNaissance, String numTele, String email, String motDePasse) {
		super();
		this.cIN = cIN;
		this.nomReceveur = nomReceveur;
		this.prenomReceveur = prenomReceveur;
		this.sexe = sexe;
		this.ville = ville;
		this.groupage = groupage;
		this.dateDeNaissance = dateDeNaissance;
		this.numTele = numTele;
		this.email = email;
		this.motDePasse = motDePasse;
	}
	public Receveur() {
	}
	public String getcIN() {
		return cIN;
	}
	public void setcIN(String cIN) {
		this.cIN = cIN;
	}
	public String getNomReceveur() {
		return nomReceveur;
	}
	public void setNomReceveur(String nomReceveur) {
		this.nomReceveur = nomReceveur;
	}
	public String getPrenomReceveur() {
		return prenomReceveur;
	}
	public void setPrenomReceveur(String prenomReceveur) {
		this.prenomReceveur = prenomReceveur;
	}
	public String getSexe() {
		return sexe;
	}
	public void setSexe(String sexe) {
		this.sexe = sexe;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getGroupage() {
		return groupage;
	}
	public void setGroupage(String groupage) {
		this.groupage = groupage;
	}
	public Date getDateDeNaissance() {
		return dateDeNaissance;
	}
	public void setDateDeNaissance(Date dateDeNaissance) {
		this.dateDeNaissance = dateDeNaissance;
	}
	public String getNumTele() {
		return numTele;
	}
	public void setNumTele(String numTele) {
		this.numTele = numTele;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMotDePasse() {
		return motDePasse;
	}
	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}

	
}
