package Projet.model;

public class Stock {
	int id;
	String type;
	int quantite;
	
	public Stock() {
		
	}
	public Stock(int id, String type, int quantite) {
		super();
		this.id = id;
		this.type = type;
		this.quantite = quantite;
	}	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	
}
