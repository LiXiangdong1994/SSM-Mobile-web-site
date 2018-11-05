package com.shop.po;
// Generated 2018-9-26 17:58:28 by Hibernate Tools 5.3.0.Beta2

import java.util.Date;

/**
 * OsSpecification generated by hbm2java
 */
public class OsSpecification implements java.io.Serializable {

	private Long specificationId;
	private Long categoryId;
	private String name;
	private Byte status;
	private Integer sort;
	private Date createTime;
	private Date updateTime;

	public OsSpecification() {
	}

	public OsSpecification(Long categoryId, String name, Byte status, Integer sort, Date createTime, Date updateTime) {
		this.categoryId = categoryId;
		this.name = name;
		this.status = status;
		this.sort = sort;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Long getSpecificationId() {
		return this.specificationId;
	}

	public void setSpecificationId(Long specificationId) {
		this.specificationId = specificationId;
	}

	public Long getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		 this.name = name == null ? null : name.trim();
	}

	public Byte getStatus() {
		return this.status;
	}

	public void setStatus(Byte status) {
		this.status = status;
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