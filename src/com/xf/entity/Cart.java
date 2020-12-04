package com.xf.entity;

import java.util.Objects;

public class Cart {
	 private Integer id;
	    private String name;
	    private Double price;
	    private String image;
	    private Integer stock;

	    public Cart() {
	    }

	    public Cart(Integer id, String name, Double price, String image, Integer stock) {
	        this.id = id;
	        this.name = name;
	        this.price = price;
	        this.image = image;
	        this.stock = stock;
	    }

	    public Integer getId() {
	        return id;
	    }

	    public void setId(Integer id) {
	        this.id = id;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public Double getPrice() {
	        return price;
	    }

	    public void setPrice(Double price) {
	        this.price = price;
	    }

	    public String getImage() {
	        return image;
	    }

	    public void setImage(String image) {
	        this.image = image;
	    }

	    public Integer getStock() {
	        return stock;
	    }

	    public void setStock(Integer stock) {
	        this.stock = stock;
	    }


	    @Override
	    public String toString() {
	        return "Cart{" +
	                "id=" + id +
	                ", name='" + name + '\'' +
	                ", price=" + price +
	                ", image='" + image + '\'' +
	                ", stock=" + stock +
	                '}';
	    }

	    @Override
	    public boolean equals(Object o) {
	        if (this == o) return true;
	        if (o == null || getClass() != o.getClass()) return false;
	        Cart cart = (Cart) o;
	        return Objects.equals(id, cart.id) &&
	                Objects.equals(name, cart.name);
	    }

	    @Override
	    public int hashCode() {
	        return Objects.hash(id, name);
	    }
}
