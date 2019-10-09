package com.zlk.orders.entity;

public class Product {

    private Integer productId;
    private String productName;
    private String productKind;
    private String productState;
    private String productIntroduce;
    private String productImageAp;
    private String productImageVp;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductKind() {
        return productKind;
    }

    public void setProductKind(String productKind) {
        this.productKind = productKind;
    }

    public String getProductState() {
        return productState;
    }

    public void setProductState(String productState) {
        this.productState = productState;
    }

    public String getProductIntroduce() {
        return productIntroduce;
    }

    public void setProductIntroduce(String productIntroduce) {
        this.productIntroduce = productIntroduce;
    }

    public String getProductImageAp() {
        return productImageAp;
    }

    public void setProductImageAp(String productImageAp) {
        this.productImageAp = productImageAp;
    }

    public String getProductImageVp() {
        return productImageVp;
    }

    public void setProductImageVp(String productImageVp) {
        this.productImageVp = productImageVp;
    }
}
