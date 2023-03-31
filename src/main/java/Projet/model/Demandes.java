package Projet.model;

import java.sql.Date;

public class Demandes {
	String cIN;
	Date dateDemande;
	
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
}
