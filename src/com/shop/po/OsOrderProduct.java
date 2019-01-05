package com.shop.po;
// Generated 2018-9-26 17:58:28 by Hibernate Tools 5.3.0.Beta2

import java.math.BigDecimal;

/**
 * OsOrderProduct generated by hbm2java
 */
public class OsOrderProduct implements java.io.Serializable {

	private Long orderProductId;
	private Long orderId;
	private Long productNumber;
	private String name;
	private String picImg;
	private Long productSpecNumber;
	private String productSpecName;
	private BigDecimal price;
	private Integer buyNumber;
	private BigDecimal productAmount;
	private Byte commentStatus;

	public OsOrderProduct() {
	}

	public OsOrderProduct(Long orderId, Long productNumber, String name, String picImg, Long productSpecNumber,
			String productSpecName, BigDecimal price, Integer score, Integer buyNumber,
			BigDecimal productAmount, Byte commentStatus) {
		this.orderId = orderId;
		this.productNumber = productNumber;
		this.name = name;
		this.picImg = picImg;
		this.productSpecNumber = productSpecNumber;
		this.productSpecName = productSpecName;
		this.price = price;
		this.buyNumber = buyNumber;
		this.productAmount = productAmount;
		this.commentStatus = commentStatus;
	}

	public Long getOrderProductId() {
		return this.orderProductId;
	}

	public void setOrderProductId(Long orderProductId) {
		this.orderProductId = orderProductId;
	}

	public Long getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getProductNumber() {
		return this.productNumber;
	}

	public void setProductNumber(Long productNumber) {
		this.productNumber = productNumber;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicImg() {
		return this.picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public Long getProductSpecNumber() {
		return this.productSpecNumber;
	}

	public void setProductSpecNumber(Long productSpecNumber) {
		this.productSpecNumber = productSpecNumber;
	}

	public String getProductSpecName() {
		return this.productSpecName;
	}

	public void setProductSpecName(String productSpecName) {
		this.productSpecName = productSpecName;
	}

	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getBuyNumber() {
		return this.buyNumber;
	}

	public void setBuyNumber(Integer buyNumber) {
		this.buyNumber = buyNumber;
	}

	public BigDecimal getProductAmount() {
		return this.productAmount;
	}

	public void setProductAmount(BigDecimal productAmount) {
		this.productAmount = productAmount;
	}

	public Byte getCommentStatus() {
		return this.commentStatus;
	}

	public void setCommentStatus(Byte commentStatus) {
		this.commentStatus = commentStatus;
	}

}