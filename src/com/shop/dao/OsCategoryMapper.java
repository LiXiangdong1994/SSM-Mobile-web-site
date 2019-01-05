package com.shop.dao;

import java.util.List;

import com.shop.po.OsCategory;
import com.shop.vo.CategoryVO;
public interface OsCategoryMapper {
	
	int deleteByPrimaryKey(Long categoryId);//按分类ID删除分类
	
	int insert (OsCategory record);//添加分类
	
	int insertSelective(OsCategory record);//添加分类
	
	OsCategory selectByPrimaryKey(Long categoryId);//按分类ID查找分类
	
	Long selectCategoryByProductId(Long productId);//按商品ID查找分类
	
	int updateByPrimaryKeySelective(OsCategory record);//更新分类
	
	int updateByPrimaryKey(OsCategory record);//更新分类
	
	List<CategoryVO> selectIndexCategory(); /*查询所有的分类显示导航栏分类列表*/

	OsCategory selectCategorysByProductId(Long productId);
	
	OsCategory selectCategoryByCategoryName(String categoryName);

	
	
}
