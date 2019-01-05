package com.shop.controller;

import java.io.File;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.testng.annotations.Parameters;

import com.shop.common.OsResult;
import com.shop.po.OsAddress;
import com.shop.po.OsCategory;
import com.shop.po.OsProduct;
import com.shop.po.OsProductParameter;
import com.shop.po.OsUser;
import com.shop.service.OsCategoryService;
import com.shop.service.OsProductService;
import com.shop.vo.AddressVO;
import com.shop.vo.CategoryVO;
import com.shop.vo.KindVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;

import net.sf.json.JSONObject;
/**
 * 跳转商品管理
 * @author lixiangdong
 *
 */
@Controller
@RequestMapping("/root")
public class RootController {
@RequestMapping("/productlist")
public String productlist(HttpServletRequest request) {
	return "/root/root_product";
}

@Autowired
private OsCategoryService osCategoryService;
@Autowired
private OsProductService osProductService;

/**
 * 查询分类对应下的商品，返回商品管理列表
 * @param reqCategoryId
 * @param request
 * @return
 */
@RequestMapping(value = "/productlist_2")
public String list(
        @RequestParam(value = "categoryId", required = false, defaultValue = "1") String reqCategoryId,
        HttpServletRequest request) {
    // 请求参数:类目ID,如果类目ID不存在或者不为Long类型,则默认1/全部商品
    Long categoryId = StringUtils.isNumeric(reqCategoryId) ? Long.valueOf(reqCategoryId) : 1;
    // 查找当前类目信息
    OsCategory category = osCategoryService.getByCategoryId(categoryId);
    if (category != null) {
        // 通过类目ID、排序、分页查找商品列表
        List<OsProduct> products = osProductService.pageProductInfo(categoryId);
        request.setAttribute("category", category);
        request.setAttribute("products", products);
    }
    return "/root/root_product";

}
	//跳转到修改页面
	@RequestMapping("/modify/{productNumber}")
	public String productDetail(HttpServletRequest request, @PathVariable Long productNumber, HttpSession session) {
		//信息
		OsProduct osProduct = osProductService.getProductDetil(productNumber);
		List<CategoryVO> category = osCategoryService.getindexCategory();
		OsCategory osCategory=osCategoryService.selectCategorysByProductId(osProduct.getProductId());
		List<CategoryVO> osCategoryvo=osCategoryService.getindexCategory();
		//参数
		List<OsProductParameter> productParameter = osProductService.getProductParameter(osProduct.getProductId());
		//规格
		List<KindVO> kindVOs = osProductService.getProductKind(osProduct.getProductId());
		Map<String, Object> map =  osProductService.getProductSpecification(osProduct.getProductId());
		request.setAttribute("product",osProduct);
		request.setAttribute("productParameter",productParameter);
		request.setAttribute("kindVOs",kindVOs);
		session.setAttribute("osCategory",osCategory);
		session.setAttribute("categorys", osCategoryvo);
		request.setAttribute("productSpecifications", JSONObject.fromObject(map));
		return "/root/root_product_modify";
	}
	@RequestMapping("/Add")
	public String Addproduct(HttpServletRequest request) {
		return "/root/root_product_modify";
	}
	/**
     *添加商品
     * @return
     */
    @RequestMapping(value = "/product/insert" , method = RequestMethod.POST)
    @ResponseBody
    public Object addressCreate(OsProduct product, HttpSession session,HttpServletRequest request) {
        Integer count = osProductService.insertProduct(product,request);
        if(count == 1) {
            return new OsResult(1, "新增收货地址成功");
        } else {
            return new OsResult(0, "新增收货地址失败");
        }

    }
    /**
     * PUT 更新商品信息
     * @return
     */
    @RequestMapping(value = "/product/update", method = RequestMethod.POST)
    @ResponseBody
    public Object productUpdate(ProductVO Productvo, HttpSession session,HttpServletRequest request) {
        OsProduct osProduct = new OsProduct();
        BeanUtils.copyProperties(Productvo, osProduct);
        int count = osProductService.updateProduct(osProduct,request);
        if(count == 1) {
            return new OsResult(1, "更新商品成功");
        } else {
            return new OsResult(0, "更新商品失败");
        }
    }
    //删除商品
    @RequestMapping(value = "/{productNumber}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteProfuct(@PathVariable Long productNumber,
                         HttpSession session) {
        	ProductVO Productvo = osProductService.deleteProduct(productNumber);
            return new OsResult(1, productNumber.toString());
    }
}
