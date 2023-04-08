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
	boolean dernierDonDate;
	boolean vIHsida;
	boolean maladieChronique;
	boolean tatouage;
	boolean manqueDeFer;
	boolean operation4derniersMois;
	boolean fièvreOuInfection;
	boolean soinsDentaires;
	boolean médicamentTousLesjours;
	
	
	public Donateur(String cIN, String nomDonateur, String prenomDonateur, String sexe, String ville, String groupage,
			Date dateDeNaissance, String numTele, String email, String motDePasse, boolean dernierDonDate,
			boolean vIHsida, boolean maladieChronique, boolean tatouage, boolean manqueDeFer,
			boolean operation4derniersMois, boolean fièvreOuInfection, boolean soinsDentaires,
			boolean médicamentTousLesjours) {
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
		this.tatouage = tatouage;
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
	public boolean isDernierDonDate() {
		return dernierDonDate;
	}
	public void setDernierDonDate(boolean dernierDonDate) {
		this.dernierDonDate = dernierDonDate;
	}
	public boolean isvIHsida() {
		return vIHsida;
	}
	public void setvIHsida(boolean vIHsida) {
		this.vIHsida = vIHsida;
	}
	public boolean isMaladieChronique() {
		return maladieChronique;
	}
	public void setMaladieChronique(boolean maladieChronique) {
		this.maladieChronique = maladieChronique;
	}
	public boolean isTatouage() {
		return tatouage;
	}
	public void setTatouage(boolean tatouage) {
		this.tatouage = tatouage;
	}
	public boolean isManqueDeFer() {
		return manqueDeFer;
	}
	public void setManqueDeFer(boolean manqueDeFer) {
		this.manqueDeFer = manqueDeFer;
	}
	public boolean isOperation4derniersMois() {
		return operation4derniersMois;
	}
	public void setOperation4derniersMois(boolean operation4derniersMois) {
		this.operation4derniersMois = operation4derniersMois;
	}
	public boolean isFièvreOuInfection() {
		return fièvreOuInfection;
	}
	public void setFièvreOuInfection(boolean fièvreOuInfection) {
		this.fièvreOuInfection = fièvreOuInfection;
	}
	public boolean isSoinsDentaires() {
		return soinsDentaires;
	}
	public void setSoinsDentaires(boolean soinsDentaires) {
		this.soinsDentaires = soinsDentaires;
	}
	public boolean isMédicamentTousLesjours() {
		return médicamentTousLesjours;
	}
	public void setMédicamentTousLesjours(boolean médicamentTousLesjours) {
		this.médicamentTousLesjours = médicamentTousLesjours;
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


	
	public  void initializeTest() {
		this.dernierDonDate= true;
		this.vIHsida=true;
		this.maladieChronique=true;
		this.tatouage = true;
		this.manqueDeFer=true;
		this.operation4derniersMois=true;
		this.fièvreOuInfection=true;
		this.soinsDentaires=true;
		this.médicamentTousLesjours=true;

	}
	
}
