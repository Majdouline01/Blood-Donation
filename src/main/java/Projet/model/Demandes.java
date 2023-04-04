package Projet.model;

import java.sql.Date;

public class Demandes {
	String cIN;
	Date dateDemande;
	int isValidated; //0 : demande done  //1 : donnation done  //2 : blood used  //-1 : demande cancelled
	public Demandes() {
		
	}
	public Demandes(String cIN, Date dateDemande) {
		super();
		this.cIN = cIN;
		this.dateDemande = dateDemande;
	}
	public String getCIN() {
		return cIN;
	}
	public void setCIN(String cIN) {
		this.cIN = cIN;
	}
	public Date getDateDemande() {
		return dateDemande;
	}
	public void setDateDemande(Date dateDemande) {
		this.dateDemande = dateDemande;
	}
	public void setIsValidated(int isValidated) {
		this.isValidated = isValidated;
	}
	public int getIsValidated() {
		return this.isValidated;
	}
}
