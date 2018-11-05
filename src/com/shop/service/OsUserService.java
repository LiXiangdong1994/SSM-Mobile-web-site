package com.shop.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.OsUserMapper;
import com.shop.po.OsUser;
@Service
public class OsUserService {
	@Autowired /*自动装配Mapper*/
	private OsUserMapper osUserMapper;
	/*注册函数*/
	public void insertUser(OsUser user) {
		osUserMapper.insertSelective(user);
	}
	/*登录验证函数*/
	public OsUser selectUser(String loginName, String loginPassword) {
		OsUser user=osUserMapper.selectByTelephone(loginName);
		return user;
	}
}
