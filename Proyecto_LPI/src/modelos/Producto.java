package modelos;

public class Producto {
    private int id;
    private String nombre;
    private String imagenBase64;
    private String descripcion;
    private double precio;
    
    
    
    
    
    
	public Producto(int id, String nombre, String imagenBase64, String descripcion, double precio) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.imagenBase64 = imagenBase64;
		this.descripcion = descripcion;
		this.precio = precio;
	}
	
	
	
	public Producto() {
		// TODO Auto-generated constructor stub
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getImagenBase64() {
		return imagenBase64;
	}
	public void setImagenBase64(String imagenBase64) {
		this.imagenBase64 = imagenBase64;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}

    // Constructor y métodos getter/setter

    
    // ...
}

