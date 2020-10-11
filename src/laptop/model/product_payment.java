package laptop.model;

public class product_payment {
	private int id;
	private int productId;
	private int paymentId;
	private int quantity;

	public product_payment() {
		super();
	}

	public product_payment(int id, int productId, int paymentId, int quantity) {
		super();
		this.id = id;
		this.productId = productId;
		this.paymentId = paymentId;
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
