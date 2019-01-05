package com.shop.service;

  import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.OsCategoryMapper;
import com.shop.po.OsCategory;
import com.shop.vo.CategoryVO;

@Service
public class OsCategoryService {
	@Autowired
	private OsCategoryMapper osCategoryMapper;
	
	/*
	 * 首页导航栏商品列表
	 */
	public List<CategoryVO> getindexCategory() {
		List<CategoryVO> categorys = (List<CategoryVO>) osCategoryMapper.selectIndexCategory();
		return categorys;
	}
	/*根据种类id查询种类*/
	public OsCategory getByCategoryId(Long categoryId) {
		OsCategory osCategory = osCategoryMapper.selectByPrimaryKey(categoryId);
		return osCategory;
	}
	
	//根据商品id查询种类
	public OsCategory selectCategorysByProductId(Long productId) {
		OsCategory osCategory = osCategoryMapper.selectCategorysByProductId(productId);
		return osCategory;
	}
	
	//根据分类名称查询种类
		public OsCategory selectCategoryByCategoryName(String categoryName) {
			OsCategory osCategory = osCategoryMapper.selectCategoryByCategoryName(categoryName);
			return osCategory;
		}
	
}
