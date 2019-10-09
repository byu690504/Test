package com.zlk.orders.controller;

import com.zlk.orders.entity.Pagination;
import com.zlk.orders.entity.Product;
import com.zlk.orders.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/toProductList")
    public String toList() throws Exception{
        return "productList";
    }

    @RequestMapping(value = "/productList")
    @ResponseBody
    public Map<String, Object> list(Pagination pagination) throws Exception{
        List<Product> list=productService.findProductByLimit(pagination);
        Integer count=productService.findCountByProductId(pagination);
        Map<String, Object> map=new HashMap<>();
        map.put("code","0");
        map.put("count",count);
        map.put("data",list);
        return map;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map<String, Object> delete(Integer productId) throws Exception{
        Integer flag=productService.deleteProductByProductId(productId);
        Map<String, Object> map=new HashMap<>();
        if(flag == 1){
            map.put("msg","删除成功");
        }else {
            map.put("msg","删除失败");
        }
        return map;
    }

    @RequestMapping(value = "/insert")
    @ResponseBody
    public ModelAndView insert(Product product) throws Exception{
        ModelAndView mv=new ModelAndView();
        Integer flag=productService.insertProduct(product);
        if(flag == 1){
            mv.addObject("msg","新增成功");
            mv.setViewName("productList");
            return mv;
        }else {
            return null;
        }
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public ModelAndView update(Product product) throws Exception{
        ModelAndView mv=new ModelAndView();
        Integer flag=productService.updateProductByProductId(product);
        if(flag == 1){
            mv.addObject("msg","修改成功");
            mv.setViewName("productList");
            return mv;
        }else {
            return null;
        }
    }

    //修改富文本
    @RequestMapping(value = "/textAreaUpdate")
    @ResponseBody
    public ModelAndView textAreaUpdate(Product product) throws Exception{
        ModelAndView mv=new ModelAndView();
        Integer flag=productService.updateProOfTextAreaByProId(product);
        if(flag == 1){
            mv.setViewName("productList");
            return mv;
        }else {
            return null;
        }
    }

    //上传图片
    @RequestMapping(value = "/uploadImg")
    @ResponseBody
    public Map uploadImg(@RequestParam(value = "file",required = false) MultipartFile file){
        Map map=new HashMap();
        String absolutePath="";
        String virtualPath="";
        if(file != null){
            String originalName=file.getOriginalFilename();
            String lastStr=originalName.substring(originalName.lastIndexOf(".")+1);
            String dateStr=String.valueOf(new Date().getTime());
            String imgName=dateStr+"."+lastStr;
            absolutePath="D:\\upload\\"+imgName;
            virtualPath="/upload/"+imgName;
            File files=new File(absolutePath);
            try {
                file.transferTo(files);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        map.put("code",1);
        map.put("abspath",absolutePath);
        map.put("virtualPath", virtualPath);
        return map;
    }
}
