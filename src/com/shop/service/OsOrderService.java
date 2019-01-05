package com.shop.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.shop.dao.OsOrderMapper;
import com.shop.dao.OsOrderProductMapper;
import com.shop.po.*;
import com.shop.vo.CartVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ShoppingCartVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

/**
 * @Author 康健
 * @Date 2017/8/12 10:53
 */
@Service
public class OsOrderService {

    @Autowired
    private OsOrderMapper osOrderMapper;
    @Autowired
    private OsOrderProductMapper osOrderProductMapper;

    //保存订单 返回oderid
    public Long saveOsOder(OsOrder order) {
        osOrderMapper.insertSelective(order);
        return order.getOrderId();
    }

    //保存订单商品表
    public void saveOrderProduct(OsOrderProduct osOrderProduct) {
        osOrderProductMapper.insertSelective(osOrderProduct);
    }

    public OsOrder getByOrderNumber(Long orderNumber, Long userId) {
        OsOrder os = new OsOrder();
        os.setOrderNumber(orderNumber);
        os.setUserId(userId);
        OsOrder osOrder = osOrderMapper.selectByOrderNumber(os);
        return osOrder;
    }

    public List<OsOrderProduct> getOrderProductByOrderNumber(Long orderId) {
        List<OsOrderProduct> list = osOrderProductMapper.selectByOrderId(orderId);
        return list;
    }

    private Page<OrderVO> l ;

    public Page<OrderVO> getL() {
        return l;
    }

    public void setL(Page<OrderVO> l) {
        this.l = l;
    }

    //分页显示用户中心用户个人订单
    public List<OrderVO> getPageOrderByUserId(Long userId, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<OrderVO> list = osOrderMapper.selectByUserId(userId);
        this. l = (Page<OrderVO>)list;
        return list;
    }

    //根据订单号查询用户个人订单
    public OrderVO getOrderByOrderNumber(Long orderNumber) {
        OrderVO orderVO = osOrderMapper.selectOrderVOByOrderNumber(orderNumber);
        return orderVO;
    }
    
    
    public OrderVO deleteOrder( Long orderId) {
    	 osOrderMapper.deleteByPrimaryKey(orderId);
		return null;
    }	  
}
