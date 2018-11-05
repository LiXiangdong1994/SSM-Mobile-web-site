package com.shop.dao;

import java.util.List;

import com.shop.po.OsCategory;
import com.shop.vo.CategoryVO;
public interface OsCategoryMapper {
	
	int deleteByPrimaryKey(Long categoryId);
	
	int insert (OsCategory record);
	
	int insertSelective(OsCategory record);
	
	OsCategory selectByPrimaryKey(Long categoryId);
	
	int updateByPrimaryKeySelective(OsCategory record);
	
	int updateByPrimaryKey(OsCategory record);
	
	List<CategoryVO> selectIndexCategory(); /*查询所有的分类显示导航栏分类列表*/
	
	OsCategory selectParentCategoryByProductId(Long ProduyctId);/*根据商品ID查找种类*/
	
	// 根据类目ID查找子类目
    List<OsCategory> listLowerCategories(Long categoryId);
    // 根据类目ID查找上级类目列表
    List<OsCategory> listUpperCategories(Long categoryId);
	
}
