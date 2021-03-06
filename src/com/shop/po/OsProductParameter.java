package com.shop.po;
// Generated 2018-9-26 17:58:28 by Hibernate Tools 5.3.0.Beta2

import java.util.Date;

/**
 * OsProductParameter generated by hbm2java
 */
public class OsProductParameter implements java.io.Serializable {

	private long productParameterId;
	private Long productId;
	private String name;
	private String value;
	private Integer sort;
	private Date createTime;
	private Date updateTime;

	public OsProductParameter() {
	}

	public OsProductParameter(long productParameterId) {
		this.productParameterId = productParameterId;
	}

	public OsProductParameter(long productParameterId, Long productId, String name, String value, Integer sort,
			Date createTime, Date updateTime) {
		this.productParameterId = productParameterId;
		this.productId = productId;
		this.name = name;
		this.value = value;
		this.sort = sort;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public long getProductParameterId() {
		return this.productParameterId;
	}

	public void setProductParameterId(long productParameterId) {
		this.productParameterId = productParameterId;
	}

	public Long getProductId() {
		return this.productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		 this.name = name == null ? null : name.trim();
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		  this.value = value == null ? null : value.trim();
	}

	public Integer getSort() {
		return this.sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
