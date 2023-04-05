package Projet.model;

import java.sql.Date;

public class Donateur {
	String cIN;
	String nomDonateur;
	String prenomDonateur;
	String sexe;
	String ville;
	String groupage;
	Date dateDeNaissance;
	String numTele;
	String email;
	String motDePasse;
	String dernierDonDate;
	String vIHsida;
	String maladieChronique;
	String tatouage;
	String manqueDeFer;
	String operation4derniersMois;
	String fièvreOuInfection;
	String soinsDentaires;
	String médicamentTousLesjours;
	public Donateur(String cIN, String nomDonateur, String prenomDonateur, String sexe, String ville, String groupage,
			Date dateDeNaissance, String numTele, String email, String motDePasse, String dernierDonDate,
			String vIHsida, String maladieChronique, String tatouage, String manqueDeFer, String operation4derniersMois,
			String fièvreOuInfection, String soinsDentaires, String médicamentTousLesjours) {
		super();
		this.cIN = cIN;
		this.nomDonateur = nomDonateur;
		this.prenomDonateur = prenomDonateur;
		this.sexe = sexe;
		this.ville = ville;
		this.groupage = groupage;
		this.dateDeNaissance = dateDeNaissance;
		this.numTele = numTele;
		this.email = email;
		this.motDePasse = motDePasse;
		this.dernierDonDate = dernierDonDate;
		this.vIHsida = vIHsida;
		this.maladieChronique = maladieChronique;
		this.tatouage=tatouage;
		this.manqueDeFer = manqueDeFer;
		this.operation4derniersMois = operation4derniersMois;
		this.fièvreOuInfection = fièvreOuInfection;
		this.soinsDentaires = soinsDentaires;
		this.médicamentTousLesjours = médicamentTousLesjours;
	}
	
	public Donateur(String cIN, String nomDonateur, String prenomDonateur, String sexe, String ville, String groupage,
			Date dateDeNaissance, String numTele, String email, String motDePasse) {
		this.cIN = cIN;
		this.nomDonateur = nomDonateur;
		this.prenomDonateur = prenomDonateur;
		this.sexe = sexe;
		this.ville = ville;
		this.groupage = groupage;
		this.dateDeNaissance = dateDeNaissance;
		this.numTele = numTele;
		this.email = email;
		this.motDePasse= motDePasse;
	}
	public Donateur() {
	}
	public String getcIN() {
		return cIN;
	}
	public void setcIN(String cIN) {
		this.cIN = cIN;
	}
	public String getNomDonateur() {
		return nomDonateur;
	}
	public void setNomDonateur(String nomDonateur) {
		this.nomDonateur = nomDonateur;
	}
	public String getPrenomDonateur() {
		return prenomDonateur;
	}
	public void setPrenomDonateur(String prenomDonateur) {
		this.prenomDonateur = prenomDonateur;
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
	public String getMotDePasse() {
		return motDePasse;
	}
	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}
	public void setEmail(String email) {
		this.email = email;
	}


	
	public  String[] initializeTest() {
		String dernierDonDate="Plus de 8semaines";
		String vIHsida="Non";
		String maladieChronique="Non";
		String tatouage ="Non";
		String manqueDeFer="Non";
		String operation4derniersMois="Non";
		String fièvreOuInfection="Non";
		String soinsDentaires="Non";
		String médicamentTousLesjours="Non";
		String[] strings= {dernierDonDate,vIHsida, maladieChronique,tatouage,manqueDeFer,operation4derniersMois,fièvreOuInfection
				,soinsDentaires,médicamentTousLesjours};
		
		return strings;
	}
	
}
