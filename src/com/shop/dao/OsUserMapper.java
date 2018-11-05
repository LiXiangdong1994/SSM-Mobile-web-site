package com.shop.dao;
import com.shop.po.OsUser;
public interface OsUserMapper {
	int deleteByPrimaryKey(Long userId); /* 方法：根据userId删除数据*/
	
	int insert(OsUser record); /*方法：插入一条OsUser数据*/
	
	int insertSelective(OsUser record);  

	OsUser selectByPrimaryKey(Long userId);

	int updateByPrimaryKeySelective(OsUser record);

	int updateByPrimaryKey(OsUser record);

	OsUser selectByTelephone(String telephone); /* 登录时根据输入的参数查询telephone验证登录*/
	
}
