package Projet.model;

import java.sql.Date;

import javax.servlet.http.Part;

public class ReceveurDemande {
	String cIN;
	String hopital;
	Date date;
	String maladie;
	float quantiteSang;
	byte[] ordonnance;
	String statut;
	public ReceveurDemande() {
		
	}
	public ReceveurDemande(String cIN, String hopital, Date date, String maladie, float quantiteSang,
			String statut) {
		this.cIN = cIN;
		this.hopital = hopital;
		this.date = date;
		this.maladie = maladie;
		this.quantiteSang = quantiteSang;
		this.statut = "en cours de traitement";
	}
	public String getcIN() {
		return cIN;
	}
	public void setcIN(String cIN) {
		this.cIN = cIN;
	}
	public String getHopital() {
		return hopital;
	}
	public void setHopital(String hopital) {
		this.hopital = hopital;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getMaladie() {
		return maladie;
	}
	public void setMaladie(String maladie) {
		this.maladie = maladie;
	}
	public float getQuantiteSang() {
		return quantiteSang;
	}
	public void setQuantiteSang(float quantiteSang) {
		this.quantiteSang = quantiteSang;
	}
	public byte[] getOrdonnance() {
		return ordonnance;
	}
	public void setOrdonnance(byte[] ordonnance) {
		this.ordonnance = ordonnance;
	}
	public String getStatut() {
		return statut;
	}
	public void setStatut(String statut) {
		this.statut = statut;
	}
	
	
}
