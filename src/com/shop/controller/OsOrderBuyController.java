package com.shop.controller;

import com.shop.common.OsResult;
import com.shop.po.*;
import com.shop.service.OsAddressService;
import com.shop.service.OsOrderService;
import com.shop.util.GetRandom;
import com.shop.vo.CartVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ShoppingCartVO;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @Author 康健
 * @Date 2017/8/12 9:26
 */
@Controller
@RequestMapping("/buy")
public class OsOrderBuyController {

    @Autowired
    private OsAddressService osAddressService;
    @Autowired
    private OsOrderService osOrderService;

    /**
     * GET 填写订单信息 收货地址
     *
     * @return
     */
    @RequestMapping(value = "/checkout")
    public String checkout(HttpSession session, HttpServletRequest request) {
        OsUser user = (OsUser) session.getAttribute("user");
        // 收货地址
        List<OsAddress> addresses = osAddressService.listAddress(user.getUserId());
        request.setAttribute("addresses", addresses);

        // 购物车选中商品
        CartVO cartVO = (CartVO) session.getAttribute("cart");
        request.setAttribute("cart", cartVO);

        return "/order/order_buy_checkout";
    }

    /**
     * POST 提交订单
     *
     * @return
     */
    @RequestMapping(value = "/confirm", method = RequestMethod.POST )
    @ResponseBody
    public Object confirm(OsOrder order, @RequestParam(value = "addressId") Long addressId, HttpSession session) {
        OsUser user = (OsUser) session.getAttribute("user");
        CartVO cart = (CartVO) session.getAttribute("cart");
        // 收货地址
        OsAddress address = osAddressService.getAddress(addressId);
        if (address != null) {
            Long num = GetRandom.getNumber();
            order.setOrderNumber(num);
            order.setBuyNumber(cart.getTotalNumber());
            order.setCreateTime(new Date());
            order.setOrderStatus(new Byte("1"));//1 提交
            order.setUserId(user.getUserId());
            order.setPayAmount(cart.getTotalPrice());
            //保存order 拿到orderid
            Long oderId = osOrderService.saveOsOder(order);
            order.setOrderId(oderId);
            //保存订单商品
            List<ShoppingCartVO> shoppingCartVOs = cart.getShoppingCartVOs();
            for (ShoppingCartVO vo : shoppingCartVOs) {
                OsOrderProduct osOrderProduct = new OsOrderProduct();
                osOrderProduct.setOrderId(oderId);
                osOrderProduct.setProductNumber(vo.getProductNumber());
                osOrderProduct.setName(vo.getName());
                osOrderProduct.setBuyNumber(vo.getBuyNumber());
                osOrderProduct.setPicImg(vo.getPicImg());
                osOrderProduct.setProductSpecNumber(vo.getProductSpecNumber());
                List<String> l = vo.getSpecificationName();
                String s = "";
                if(l == null) {
                    s = "";
                } else {
                    for (String ll : l) {
                        s += ll + " ";
                    }
                }
                osOrderProduct.setProductSpecName(s);
                osOrderProduct.setPrice(vo.getPrice());
                osOrderProduct.setProductNumber(vo.getProductNumber());
                osOrderProduct.setProductAmount(vo.getProductAmount());
                osOrderService.saveOrderProduct(osOrderProduct);
            }
            return new OsResult(1, String.valueOf(num));
        }
        return null;
    }

    /**
     * GET 确认订单，支付成功后
     *
     * @return
     */
    @RequestMapping(value = "/confirm/{orderNumber}")
    public String confirmShow( @PathVariable Long orderNumber, HttpSession session, HttpServletRequest request) {
        OsUser user = (OsUser) session.getAttribute("user");
        OsOrder order = osOrderService.getByOrderNumber(orderNumber, user.getUserId());
        OsAddress address=osAddressService.selectaddressByUserId(user.getUserId());
        if (order != null) {
            List<OsOrderProduct> osOrderProducts = osOrderService.getOrderProductByOrderNumber(order.getOrderId());

            request.setAttribute("order", order); // 订单信息
            request.setAttribute("orderProducts", osOrderProducts);// 订单详情表
         request.setAttribute("address", address);//
           return "/order/order_buy_confirm";
        }

        return "/order/order_buy_confirm";
    }
    
    //订单列表
    @RequestMapping(value = "/list")
    public String orderUI(HttpSession session, HttpServletRequest request,
                          @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                          @RequestParam(value = "limit", required = false, defaultValue = "8") Integer limit) {
        OsUser user = (OsUser) session.getAttribute("user");
        List<OrderVO> orderVOs = osOrderService.getPageOrderByUserId(user.getUserId(), page, limit);
        com.shop.common.PageInfo info = new  com.shop.common.PageInfo(page.intValue(), limit.intValue(), "", "");

        info.setTotal((int) osOrderService.getL().getTotal());
        request.setAttribute("pageInfo", info);
        request.setAttribute("orderVOs", orderVOs);
        return "/order/order_list";
    }

    @RequestMapping(value = "/{orderId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteOrder(@PathVariable Long orderId,
                         HttpSession session) {
    	
        if(session.getAttribute("user") != null) {
        	OrderVO orderVO = osOrderService.deleteOrder(orderId);
            return new OsResult(1, orderId.toString());
        } else {
            return new OsResult(401,"还未登录");
        }
    }

}
