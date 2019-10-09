package com.zlk.sysUser.controller;

import com.zlk.sysUser.entity.Pagination;
import com.zlk.sysUser.entity.SysUser;
import com.zlk.sysUser.service.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/sysUser")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @RequestMapping(value = "/toLogin")
    public String toLogin() throws Exception{
        return "login";
    }

    @RequestMapping(value = "/login")
    public ModelAndView login(SysUser sysUser) throws Exception{
        UsernamePasswordToken token=new UsernamePasswordToken(sysUser.getUserName(),sysUser.getPassword());
        Subject subject= SecurityUtils.getSubject();
        try{
            subject.login(token);
        } catch (IncorrectCredentialsException ice){
            // 捕获密码错误异常
            ModelAndView mv=new ModelAndView("login");
            mv.addObject("msg","密码错误");
            return mv;
        } catch (UnknownAccountException uae){
            // 捕获未知用户名异常
            ModelAndView mv=new ModelAndView("login");
            mv.addObject("msg","用户名错误");
            return mv;
        } catch (ExcessiveAttemptsException eae){
            // 捕获错误登录过多的异常
            ModelAndView mv=new ModelAndView("login");
            mv.addObject("msg","登录异常");
            return mv;
        }
        SysUser sysUser1=sysUserService.findSysUserByNameAndPassword(sysUser);
        subject.getSession().setAttribute("sysUser",sysUser1);
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/noPermission")
    public String toNoPermission() throws Exception{
        return "noPermission";
    }

    @RequestMapping(value = "/toSysUserList")
    public String toList() throws Exception{
        return "sysUserList";
    }

    @RequestMapping(value = "/sysUserList")
    @ResponseBody
    public Map<String, Object> list(Pagination pagination) throws Exception{
        List<SysUser> list=sysUserService.findSysUserByLimit(pagination);
        Integer count=sysUserService.findCountByUserId(pagination);
        Map<String, Object> map=new HashMap<>();
        map.put("code","0");
        map.put("count",count);
        map.put("data",list);
        return map;
    }
}
