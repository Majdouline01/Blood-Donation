package Projet.model;

public class Admin {
	String cIN;
	String nomAdmin;
	String prenomAdmin;
	String numTele;
	
	
	public String getNumTele() {
		return numTele;
	}
	public void setNumTele(String numTele) {
		this.numTele = numTele;
	}
	public Admin() {
		
	}
	public Admin(String cIN, String nomAdmin, String prenomAdmin, String email, String motDePasse) {
		super();
		this.cIN = cIN;
		this.nomAdmin = nomAdmin;
		this.prenomAdmin = prenomAdmin;
		this.email = email;
		this.motDePasse = motDePasse;
	}
	public String getcIN() {
		return cIN;
	}
	public void setcIN(String cIN) {
		this.cIN = cIN;
	}
	public String getNomAdmin() {
		return nomAdmin;
	}
	public void setNomAdmin(String nomAdmin) {
		this.nomAdmin = nomAdmin;
	}
	public String getPrenomAdmin() {
		return prenomAdmin;
	}
	public void setPrenomAdmin(String prenomAdmin) {
		this.prenomAdmin = prenomAdmin;
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
	String email;
	String motDePasse;
}
