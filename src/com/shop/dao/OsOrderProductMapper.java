package com.shop.dao;

import com.shop.po.OsOrderProduct;
import com.shop.vo.ProductVO;

import java.util.ArrayList;
import java.util.List;

public interface OsOrderProductMapper {
    int deleteByPrimaryKey(Long orderProductId);

    int insert(OsOrderProduct record);

    int insertSelective(OsOrderProduct record);
    
    ArrayList<ProductVO> getAllHotProductNumber();
	//查找热卖商品商品编号

    OsOrderProduct selectByPrimaryKey(Long orderProductId);

    List<OsOrderProduct> selectByOrderId(Long orderId);

    int updateByPrimaryKeySelective(OsOrderProduct record);

    int updateByPrimaryKey(OsOrderProduct record);

	ArrayList<ProductVO> getHotProductNumber();
    
    
}