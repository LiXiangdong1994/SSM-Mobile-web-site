package com.shop.controller;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.po.OsAddress;
import com.shop.po.OsUser;
import com.shop.service.OsUserService;
import com.shop.util.CreateImageCode;
import com.shop.util.GetRandom;
import com.shop.vo.AddressVO;
import com.shop.vo.CartVO;
import com.shop.service.OsAddressService;
import com.shop.common.OsResult;
import com.sun.org.apache.bcel.internal.generic.NEW;
@Controller
@RequestMapping("/pass")
public class OsUserLoginController {
	@Autowired
	OsUserService osUserService;
	@Autowired
	  private OsAddressService osAddressService;
	
	//注册
    @RequestMapping("/register")
    public String registerUI(HttpServletRequest request) {
        return "/user/user_register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Object register(@ModelAttribute("user") OsUser user, @RequestParam("registerCode") String registerCode, HttpSession session) {
        String code = (String) session.getAttribute("code");
        Long num = GetRandom.getNumber();
        user.setUserNumber(num);
        if (code.equals(registerCode)) {
            try {
                osUserService.insertUser(user);
                return new OsResult(1, user.getUserName());
            } catch (Exception e) {
                return new OsResult(0, "注册失败");
            }
        } else {
            return new OsResult(0, "验证码错误");
        }
    }
	
	
	@RequestMapping("/login")
	public String loginUI(HttpServletRequest request) {
			return "/user/user_login";
	}
	/*用户登录*/
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public Object login(@RequestParam("loginName") String loginName,
						@RequestParam("loginPassword") String loginPassword,HttpSession session) {
			OsUser user = osUserService.selectUser(loginName, loginPassword);				
			if (loginPassword.equals(user.getLoginPassword())) {
				 session.setAttribute("user", user);/*登录后存放当前用户到session*/
				 session.setMaxInactiveInterval(30*60);  //session存放30分钟
				 CartVO cartVO=new CartVO();
				 session.setAttribute("cart", cartVO);/*登录后存放一个空的购物车到session*/
				 return new OsResult(1, "");
			}else {
				return new OsResult(0, "登录失败，用户名或密码错误");
			}
	} 
	/*用户退出登录*/
	//登出
    @RequestMapping("/logout")
    public String loginUI(HttpServletRequest request, HttpSession session) {
        session.invalidate();
        return "/user/user_login";
    }
    
    @RequestMapping(value = "/captcha-image.jpg")
    @ResponseBody
    public void getImageCode(HttpServletRequest req, HttpServletResponse response, HttpSession session) throws IOException {
        // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        CreateImageCode vCode = new CreateImageCode(100, 30, 4, 8);
        System.out.println("code" + vCode.getCode());
        session.setAttribute("code", vCode.getCode());
        vCode.write(response.getOutputStream());
    }
    
    
    /**
     * POST 创建收货地址
     * @return
     */
    @RequestMapping(value = "/address/insert" , method = RequestMethod.POST)
    @ResponseBody
    public Object addressCreate(OsAddress address, HttpSession session) {
        OsUser osUser = (OsUser) session.getAttribute("user");
        address.setUserId(osUser.getUserId());
        Integer count = osAddressService.insertAddress(address);
        if(count == 1) {
            return new OsResult(1, "新增收货地址成功");
        } else {
            return new OsResult(0, "新增收货地址失败");
        }

    }

    /**
     * PUT 更新收货地址
     * @return
     */
    @RequestMapping(value = "/address/update", method = RequestMethod.POST)
    @ResponseBody
    public Object addressUpdate(AddressVO addressvo, HttpSession session) {
        OsUser osUser = (OsUser) session.getAttribute("user");
        OsAddress osAddress = new OsAddress();
        BeanUtils.copyProperties(addressvo, osAddress);
        osAddress.setUserId(osUser.getUserId());
        int count = osAddressService.updatetAddress(osAddress);
        if(count == 1) {
            return new OsResult(1, "更新收货地址成功");
        } else {
            return new OsResult(0, "更新收货地址失败");
        }
    }
    /**
     * DELETE 删除收货地址
     * @return
     */
    @RequestMapping(value = "/address/delete/{addressId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object addressDelete(@PathVariable("addressId") Long addressId, HttpSession session) {
        Integer count = osAddressService.deleteByAddressId(addressId);
        if(count == 1) {
            return new OsResult(1, "删除收货地址成功");
        } else {
            return new OsResult(0, "删除收货地址失败");
        }
    }

}
