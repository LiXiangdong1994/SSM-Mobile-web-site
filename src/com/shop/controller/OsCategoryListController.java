package com.shop.controller;

import com.shop.po.OsCategory;
import com.shop.po.OsProduct;
import com.shop.service.OsCategoryService;
import com.shop.service.OsProductService;
import com.shop.vo.CategoryVO;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author 康健
 * @Date 2017/8/12 15:04
 */
@Controller
public class OsCategoryListController {

    @Autowired
    private OsCategoryService osCategoryService;
    @Autowired
    private OsProductService osProductService;

    /**
     * GET 类目列表
     * @return
     * */
    @RequestMapping(value = "/list")
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
        return "/product/product_list";
    }

    //
    @RequestMapping(value = "/list/New")
    public String NewProductlist(
            @RequestParam(value = "categoryId", required = false, defaultValue = "1") String reqCategoryId,
            HttpServletRequest request) {
        // 请求参数:类目ID,如果类目ID不存在或者不为Long类型,则默认1/全部商品
        Long categoryId = StringUtils.isNumeric(reqCategoryId) ? Long.valueOf(reqCategoryId) : 1;
        // 查找当前分类新商品
        OsCategory category = osCategoryService.getByCategoryId(categoryId);
        if (category != null) {
            // 通过类目ID、排序、分页查找商品列表
            List<OsProduct> newProducts = osProductService.getNewProduct(categoryId);
            request.setAttribute("category", category);
            request.setAttribute("products", newProducts);
      }
        return "/product/product_list";
    }
    
    // 商品价格高-低
    @RequestMapping(value = "/list/priceDesc")
    public String priceDescProductlist(
            @RequestParam(value = "categoryId", required = false, defaultValue = "1") String 			reqCategoryId,HttpServletRequest request) {
        // 请求参数:类目ID,如果类目ID不存在或者不为Long类型,则默认1/全部商品
        Long categoryId = StringUtils.isNumeric(reqCategoryId) ? Long.valueOf(reqCategoryId) : 1;
        OsCategory category = osCategoryService.getByCategoryId(categoryId);
        if (category != null) {
        // 通过类目ID、排序、分页查找商品列表
        List<OsProduct> priceDescProduct = osProductService.getPriceDescProduct(categoryId);
        request.setAttribute("category", category);
        request.setAttribute("products", priceDescProduct);
  }
    return "/product/product_list";
}
    // 商品价格低-高
    @RequestMapping(value = "/list/priceAsc")
    public String priceAscProductlist(
            @RequestParam(value = "categoryId", required = false, defaultValue = "1") String 			reqCategoryId,HttpServletRequest request) {
        // 请求参数:类目ID,如果类目ID不存在或者不为Long类型,则默认1/全部商品
        Long categoryId = StringUtils.isNumeric(reqCategoryId) ? Long.valueOf(reqCategoryId) : 1;
        OsCategory category = osCategoryService.getByCategoryId(categoryId);
        if (category != null) {
        // 通过类目ID、排序、分页查找商品列表
        List<OsProduct> priceAscProduct = osProductService.getPriceAscProduct(categoryId);
        request.setAttribute("category", category);
        request.setAttribute("products", priceAscProduct);
  }
    return "/product/product_list";
}
    
 // 按销量查找商品
 /*   @RequestMapping(value = "/list/Hot")
    public String HotProductlist(
            @RequestParam(value = "categoryId", required = false, defaultValue = "1") String 			reqCategoryId,HttpServletRequest request) {
        // 请求参数:类目ID,如果类目ID不存在或者不为Long类型,则默认1/全部商品
        Long categoryId = StringUtils.isNumeric(reqCategoryId) ? Long.valueOf(reqCategoryId) : 1;
        OsCategory category = osCategoryService.getByCategoryId(categoryId);
        if (category != null) {
        // 通过类目ID、排序、分页查找商品列表
        List<OsProduct> hotProduct = osProductService.getHotProduct(categoryId);
        request.setAttribute("category", category);
        request.setAttribute("products", hotProduct);
  }
    return "/product/product_list";
}*/
}
