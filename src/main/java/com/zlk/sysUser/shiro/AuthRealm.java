package com.zlk.sysUser.shiro;

import com.zlk.sysUser.entity.SysRole;
import com.zlk.sysUser.entity.SysUser;
import com.zlk.sysUser.service.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.List;

public class AuthRealm extends AuthorizingRealm {

    @Resource
    private SysUserService sysUserService;

    //授权方法
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        // 获得当前登陆的用户
        SysUser sysUser= (SysUser) principalCollection.getPrimaryPrincipal();
        String userName = sysUser.getUserName();
        // 当前用户拥有的角色,根据自己的entity
        List<SysRole> roleList= sysUserService.findRoleNameByUserName(userName);
        // 指示当前用户能访问的资源
        for (SysRole roles : roleList){
            info.addRole(roles.getRoleCode());
        }
        return info;
    }

    //认证方法
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
        String userName=token.getUsername();
        // 根据用户名在数据库中找到满足条件的用户
        SysUser sysUser=sysUserService.findSysUserOfNameByShiro(userName);
        if(sysUser == null){
            return null;
        }
        // shiro会话时间超时设置
        SecurityUtils.getSubject().getSession().setTimeout(1000*60*30);
        // 如果能查到,再由框架比对数据库中查询到的密码和页面提交的密码是否一致
        // 参数1:登陆的用户,参数2:密码,参数3:区分realm
        AuthenticationInfo info=new SimpleAuthenticationInfo(sysUser,sysUser.getPassword(),this.getName());
        return info;
    }
}
