package laptop.model;

import java.io.Serializable;

public class brand implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String brand;

	public brand(int id, String brand) {
		super();
		this.id = id;
		this.brand = brand;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

}
