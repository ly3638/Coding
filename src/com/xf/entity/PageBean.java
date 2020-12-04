package com.xf.entity;

public class PageBean {
	 private Integer pageIndex;
	    private Integer pageCount;
	    private String name;
	    private Double lowprice;
	    private Double highprice;

	    public Integer getPageIndex() {
	        return pageIndex;
	    }

	    public void setPageIndex(Integer pageIndex) {
	        this.pageIndex = pageIndex;
	    }

	    public Integer getPageCount() {
	        return pageCount;
	    }

	    public void setPageCount(Integer pageCount) {
	        this.pageCount = pageCount;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public Double getLowprice() {
	        return lowprice;
	    }

	    public void setLowprice(Double lowprice) {
	        this.lowprice = lowprice;
	    }

	    public Double getHighprice() {
	        return highprice;
	    }

	    public void setHighprice(Double highprice) {
	        this.highprice = highprice;
	    }

	    @Override
	    public String toString() {
	        return "PageBean{" +
	                "pageIndex=" + pageIndex +
	                ", pageCount=" + pageCount +
	                ", name='" + name + '\'' +
	                ", lowprice=" + lowprice +
	                ", highprice=" + highprice +
	                '}';
	    }
}
