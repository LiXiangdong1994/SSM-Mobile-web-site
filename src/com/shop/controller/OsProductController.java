package com.shop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shop.vo.KindVO;
import com.shop.vo.ProductVO;
import ch.ethz.ssh2.Session;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.common.OsResult;
import com.shop.po.OsProduct;
import com.shop.po.OsProductParameter;
import com.shop.service.OsProductService;

/**
 * 商品控制器
 * 
 * @author kj
 *
 */
@Controller
public class OsProductController {

	@Autowired
    OsProductService osProductService;

	// 首页热门、新商品
	@RequestMapping("/recommend/hotproduct")
	public String recommendTop(HttpServletRequest request) {
		ArrayList<ProductVO> newproductVOs = osProductService.getAllNewProduct();
		request.setAttribute("newproductVOs", newproductVOs);
		ArrayList<ProductVO> hotproductVOs=osProductService.getAllHotProduct();
		request.setAttribute("hotproductVOs", hotproductVOs);
		return "/recommend/recommend_hot";
	}
	// 查询商品
		@RequestMapping(value="/recommend/search", method=RequestMethod.POST)
		@ResponseBody
		public Object search(HttpServletRequest request, @RequestParam("name") String name,HttpSession session) {
			List<ProductVO> OsProducts = osProductService.selectProduct(name);
			if (OsProducts==null) {
				 return new OsResult(0, "");
			}else {
				request.setAttribute("OsProducts", OsProducts);
				session.setAttribute("OsProducts",request.getAttribute("OsProducts"));
				 return new OsResult(1, "");
			}
		}
		@RequestMapping("/recommend/search2")
		public String search2(HttpServletRequest request,HttpSession session) {
			Object iObject=  session.getAttribute("OsProducts");
			request.setAttribute("OsProducts", iObject);
			return "/recommend/recommend_search";
		}

	// 商品详情
	@RequestMapping("/detail/{productNumber}")
	public String productDetail(HttpServletRequest request, @PathVariable Long productNumber) {
		//信息
		OsProduct osProduct = osProductService.getProductDetil(productNumber);
		//参数
		List<OsProductParameter> productParameter = osProductService.getProductParameter(osProduct.getProductId());

		//规格
		List<KindVO>  kindVOs= osProductService.getProductKind(osProduct.getProductId());
		Map<String, Object> map =  osProductService.getProductSpecification(osProduct.getProductId());
		request.setAttribute("product",osProduct);
		request.setAttribute("productParameter",productParameter);
		request.setAttribute("kindVOs",kindVOs);
		request.setAttribute("productSpecifications", JSONObject.fromObject(map));
		return "/product/product_detail";
	}
}
