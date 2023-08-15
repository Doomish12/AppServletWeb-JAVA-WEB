package modelos;

import java.sql.Blob;

public class CarritoItem {
    private int id;
    private int productId;
    private Blob imagen;
    private String nombre;
    private int cantidad;
    private double precio;

    public CarritoItem(int id, int productId, Blob imagen, String nombre, int cantidad, double precio) {
        this.id = id;
        this.productId = productId;
        this.imagen = imagen;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.precio = precio;
    }

	public void setId(int id) {
		this.id = id;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public void setImagen(Blob imagen) {
		this.imagen = imagen;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getId() {
		return id;
	}

	public int getProductId() {
		return productId;
	}

	public Blob getImagen() {
		return imagen;
	}

	public String getNombre() {
		return nombre;
	}

	public int getCantidad() {
		return cantidad;
	}

	public double getPrecio() {
		return precio;
	}



}
