package com.shop.service;

import java.io.File;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.shop.dao.*;
import com.shop.po.*;
import com.shop.util.GetRandom;
import com.shop.vo.*;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OsProductService {
	private File upload; 
  	private String uploadFileName;
  	private String uploadContentType;
  	public File getUpload() {  
        return upload;  
    }  
    public void setUpload(File upload) {  
        this.upload = upload;  
    }  
    public String getUploadFileName() {  
        return uploadFileName;  
    }  
    public void setUploadFileName(String uploadFileName) {  
        this.uploadFileName = uploadFileName;  
    }  
    public String getUploadContentType() {  
        return uploadContentType;  
    }  
    public void setUploadContentType(String imageContentType) {  
        this.uploadContentType = uploadContentType;  
    }  

    @Autowired
    private OsProductMapper osProductMapper;
  /*  @Autowired
    private OsProductCategoryMapper osProductCategoryMappert;*/
    @Autowired
    private OsProductParameterMapper osProductParameterMapper;
    @Autowired
    private OsProductSpecificationMapper osProductSpecificationMapper;
    @Autowired
    private OsOrderProductMapper osOrderProductMapper;
    @Autowired
    private OsSpecificationMapper osSpecificationMapper;
    @Autowired
    private OsSpecificationAttributeMapper osSpecificationAttributeMapper;
    @Autowired
    private OsCategoryMapper osCategoryMapper;
    @Autowired
    private OsCategoryService osCategoryService;

    /**
     * 查询所有分类新商品
     */
    public ArrayList<ProductVO> getAllNewProduct() {
        ArrayList<ProductVO> productVOs = osProductMapper.getAllNewProduct();
        return productVOs;
    }
    /**
     * 查询所有分类热门商品
     */
    public ArrayList<ProductVO> getAllHotProduct() {
    	  ArrayList<ProductVO> HotProductnumber = osOrderProductMapper.getHotProductNumber();
        ArrayList<ProductVO> hotproductVOs = osProductMapper.getAllHotProduct(HotProductnumber);
        return hotproductVOs;
    }
    
    /**
     * 按分类查找新商品
     */
    public List<OsProduct> getNewProduct(Long categoryId) {
        List<OsProduct> list = osProductMapper.getNewProduct(categoryId);
        return list;
    }
    
    /**
     * 按分类商品价格高-低
     */
    public List<OsProduct> getPriceDescProduct(Long categoryId) {
        List<OsProduct> list = osProductMapper.getPriceDescProduct(categoryId);
        return list;
    }
    /**
     * 按分类商品价格低-高
     */
    public List<OsProduct> getPriceAscProduct(Long categoryId) {
        List<OsProduct> list = osProductMapper.getPriceAscProduct(categoryId);
        return list;
    }
    /**
     * 按分类商品销量
     */
 /*   public List<OsProduct> getHotProduct(@Param("categoryId")Long categoryId) {
    	 ArrayList<ProductVO> HotProductnumber = osOrderProductMapper.getHotProductNumber();
    	 List<OsProduct> list=osProductMapper.getHotProduct(categoryId,HotProductnumber);
        return list;
    }
    */
  /**
     * 查询商品详情
     */
    public OsProduct getProductDetil(Long productNumber) {
        OsProduct product = osProductMapper.selectByProductNumber(productNumber);
        return product;
    }

    /**
     * 查询商品参数
     */
    public List<OsProductParameter> getProductParameter(Long productId) {
        List<OsProductParameter> list = (List<OsProductParameter>) osProductParameterMapper.selectByProductId(productId);
        return list;
    }
    /**
     * 查询商品对应规格
     */
    public Map<String, Object> getProductSpecification(Long productId) {
        Map<String, Object> resultMap = new HashMap<>();
        // 商品规格进行拆分
        List<OsProductSpecification> osProductSpecification = osProductSpecificationMapper.selectByProductId(productId);
        for(OsProductSpecification ops : osProductSpecification) {
            if(ops.getSpec() != null && (!ops.getSpec().equals(""))){
                String[] sp = ops.getSpec().split(",");
                //reverseArray(sp);
                String s = changeArray(sp);
                resultMap.put(s, JSONObject.fromObject(ops));
            } else {
                resultMap.put("default", JSONObject.fromObject(ops));
            }
        }
        return resultMap;
    }

    /**
     * 查询分类规格组合
     */
    public List<KindVO> getProductKind(Long productId) {
        //先根据商品ID查找分类ID
        Long osCategoryID = osCategoryMapper.selectCategoryByProductId(productId);
        //按分类ID查找所有的规格组合
        List<KindVO> kindVOs = osProductSpecificationMapper.selectSpecByCategoryId(osCategoryID);
        //查找当前商品的规格组合 去除不存在的规格
        List<OsProductSpecification> list = osProductSpecificationMapper.selectByProductId(productId);
        Set<String> sset = new HashSet<String>();
        Set<String> set = Collections.synchronizedSet(sset);
        for(OsProductSpecification ops : list) {
            if(ops.getSpec() != null && (!"".equals(ops.getSpec()))) {
                String[] sp = ops.getSpec().split(",");
                for(String s : sp) {
                    set.add(s);
                }
            }
        }
        for(KindVO k : kindVOs) {
            List<KindAttribute> l = k.getKindAttributes();
            List<KindAttribute> ll = new ArrayList<KindAttribute>();
            int[] index = null;
            for(int i= 0; i < l.size(); i++ ) {
                KindAttribute ka = l.get(i);
                Boolean flag = false;
                for(String s : set) {
                    if(Long.parseLong(s) == ka.getSpecAttrId()) {
                        flag = true;
                        break;
                    }
                }
                if(flag == false) {
                    ll.add(ka);
                }
            }
            for(int i= 0; i < ll.size(); i++) {
                l.remove(ll.get(i));
            }
        }
        return kindVOs;
    }

   /**
     * 根据规格id 查询商品基本信息
     */
    public OsProduct getProductBySpecNumber(Long productSpecNumber) {
        OsProduct osProduct = osProductMapper.getProductBySpecNumber(productSpecNumber);
        return osProduct;
    }
    
    /**
     * 根据商品名 查询商品
     */
    public List<ProductVO> selectProduct(String name) {
        List<ProductVO> osProducts = osProductMapper.selectProduct(name);
        return osProducts;
    }
    private static void reverseArray(String[] Array) {
        ArrayList<String> array_list = new ArrayList<String>();
        for (int i = 0; i < Array.length; i++) {
            array_list.add(Array[Array.length - i - 1]);
        }
        Array = array_list.toArray(Array);
    }

    private static String changeArray(String[] Array) {
        String s = "";
        for(int i =0; i < Array.length; i++) {

            if(i == Array.length-1) {
                s = s + Array[i];
                break;
            }
            s = s + Array[i] + ",";
        }
        return s;
    }

    private Page<OsProduct> l ;

    public Page<OsProduct> getL() {
        return l;
    }

    public void setL(Page<OsProduct> l) {
        this.l = l;
    }

   /* //分页查询商品信息
    public List<OsProduct> pageProductInfo(Long categoryId, Integer sort, Integer page, Integer limit) {
        if(categoryId == 1) {
            PageHelper.startPage(page, 8);
            List<OsProduct> list = osProductMapper.selectAll();
            this. l = (Page<OsProduct>)list;
            return list;
        }
        // 根据类目ID查找子类目
        List<String> categoryIds = new ArrayList<String>();
        PageHelper.startPage(page, limit);
        List<OsProduct> list = osProductMapper.listByPage(categoryIds);
        this. l = (Page<OsProduct>)list;
        return list;
    }*/
    
    
    //不分页查询商品信息
    public List<OsProduct> pageProductInfo(Long categoryId) {
        if(categoryId == 1) {
            List<OsProduct> list = osProductMapper.selectAll();
            return list;
        }else {
        	 List<OsProduct> list = osProductMapper.selectProductByCategoryId(categoryId);
             return list;
        }
    }
    
    //新增商品
    public int insertProduct(OsProduct product,HttpServletRequest request) {
    	String picImg=product.getPicImg();
    	String detailImg=product.getDetailImg();
    	Long num=GetRandom.getNumber();
    	if(picImg.contains("fakepath")||detailImg.contains("fakepath")) {
    		String uploadFileName1=StringEscapeUtils.unescapeJava(picImg);
    		String uploaddetailImgName=StringEscapeUtils.unescapeJava(detailImg);
    		uploadFileName=uploadFileName1.substring(uploadFileName1.lastIndexOf("h")+1);
    		String uploaddetailImgName1=uploaddetailImgName.substring(uploaddetailImgName.lastIndexOf("h")+1);
            String path = request.getServletContext().getRealPath("/images");  
            product.setProductNumber(num);
            product.setCreateTime(new Date());
            product.setPicImg("images/goods/" + uploadFileName);
            product.setDetailImg("images/goods/" + uploaddetailImgName1);
    		}
    	int count = osProductMapper.insertSelective(product);
        return count;
    }

    //更新商品
    public int updateProduct(OsProduct product,	HttpServletRequest request) {
    		String picImg=product.getPicImg();
    		String detailImg=product.getDetailImg();
    		if(picImg.contains("fakepath")||detailImg.contains("fakepath")) {
    		String uploadFileName1=StringEscapeUtils.unescapeJava(picImg);
    		String uploaddetailImgName=StringEscapeUtils.unescapeJava(detailImg);
    		uploadFileName=uploadFileName1.substring(uploadFileName1.lastIndexOf("h")+1);
    		String uploaddetailImgName1=uploaddetailImgName.substring(uploaddetailImgName.lastIndexOf("h")+1);
            String path = request.getServletContext().getRealPath("/images");  
            product.setPicImg("images/goods/" + uploadFileName);
            product.setDetailImg("images/goods/" + uploaddetailImgName1);
            int count = osProductMapper.updateByPrimaryKeySelective(product);
            return count;
    		}else {
    			String uploadFileName1=StringEscapeUtils.unescapeJava(picImg);
        		String uploaddetailImgName=StringEscapeUtils.unescapeJava(detailImg);
        		uploadFileName=uploadFileName1.substring(uploadFileName1.lastIndexOf("s")+1);
        		String uploaddetailImgName1=uploaddetailImgName.substring(uploaddetailImgName.lastIndexOf("s")+1);
                String path = request.getServletContext().getRealPath("/images");  
                product.setPicImg("images/goods" + uploadFileName);
                product.setDetailImg("images/goods" + uploaddetailImgName1);
                int count = osProductMapper.updateByPrimaryKeySelective(product);
                return count;
    		}
    }
    
    public ProductVO deleteProduct( Long productId) {
    	osProductMapper.deleteByPrimaryKey(productId);
		return null;
   }
    
}
