package com.shop.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.shop.po.OsOrder;
import com.shop.po.OsProduct;
import com.shop.vo.CategoryVO;
import com.shop.vo.ProductVO;
import org.apache.ibatis.annotations.Param;

public interface OsProductMapper {
    int deleteByPrimaryKey(Long productId);//按商品id删除商品

    int insert(OsProduct record);//添加商品

    int insertSelective(OsProduct record);//添加商品（防止空）

    int updateByPrimaryKeySelective(OsProduct record);//更新商品
  
    int updateByPrimaryKey(OsProduct record);//更新商品
    
    List<OsProduct> selectAll();//查找所有商品
    
	List<OsProduct> getNewProduct(Long categoryId);//按分类查找新商品
    
    OsProduct selectByPrimaryKey(Long productId); //按商品ID查找商品
    
    ArrayList<ProductVO> getAllNewProduct();//查找热卖商品
    
    ArrayList<ProductVO> getAllHotProduct(List hotProductnumber);//按商品编号查找热卖商品
    
    List<ProductVO> selectProduct(String name); //按名字查找商品查找
    
    OsProduct selectByProductNumber(Long productNumber);//按商品号查找商品

    Long selectProductNumberByProductId(Long productId);//按商品Id查找商品号

    String selectNameByProductId(Long productId);//按商品id查找商品名

    String selectPicImgByProductId(Long productId);//按商品id查找商品图片

    OsProduct getProductBySpecNumber(Long productSpecNumber);//按商品号获得商品
    
    List<OsProduct> selectProductByCategoryId(Long categoryId); //按分类ID查找商品

	List<OsProduct> getPriceDescProduct(Long categoryId);//按分类商品价格高-低

	List<OsProduct> getPriceAscProduct(Long categoryId);//按分类商品价格低-高

	List<OsProduct> getHotProduct(Long categoryId);//按分类商品销量

	/*List<OsProduct> getHotProduct(Long categoryId,List hotProductnumber);*/



    
   /* List<OsProduct> listByPage(@Param("categoryIds" +"") List<String> categoryIds);*///按页查询商品
   
}