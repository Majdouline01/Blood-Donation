package Projet.model;

import java.io.InputStream;
import java.sql.Date;

import javax.servlet.http.Part;

public class ReceveurDemande {
	int id;
	String cIN;
	String hopital;
	Date date;
	String maladie;
	int quantiteSang;
	InputStream ordonnance;
	byte[] ordonnanceFile;
	int statut; //0 : demande done  //1 : demande approuved  //-1 : demande cancelled
	public ReceveurDemande() {	
	}
	public ReceveurDemande(String cIN, String hopital, Date date, String maladie, int quantiteSang,
			int statut) {
		this.cIN = cIN;
		this.hopital = hopital;
		this.date = date;
		this.maladie = maladie;
		this.quantiteSang = quantiteSang;
		this.statut = 0;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getQuantiteSang() {
		return quantiteSang;
	}
	public void setQuantiteSang(int quantiteSang) {
		this.quantiteSang = quantiteSang;
	}
	public InputStream getOrdonnance() {
		return ordonnance;
	}
	public void setOrdonnance(InputStream ordonnance) {
		this.ordonnance = ordonnance;
	}
	public int getStatut() {
		return statut;
	}
	public void setStatut(int statut) {
		this.statut = statut;
	}
	public byte[] getOrdonnanceFile() {
		return ordonnanceFile;
	}
	public void setOrdonnanceFile(byte[] ordonnanceFile) {
		this.ordonnanceFile = ordonnanceFile;
	}
	
	
}
