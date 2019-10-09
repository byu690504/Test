package com.zlk.sysUser.service;

import com.zlk.sysUser.entity.Pagination;
import com.zlk.sysUser.entity.SysRole;
import com.zlk.sysUser.entity.SysUser;

import java.util.List;

public interface SysUserService {

    /**
     * 通过Shiro的认证方法验证用户的用户名
     * @param userName
     * @return
     */
    SysUser findSysUserOfNameByShiro(String userName);

    /**
     * 通过数据库数据验证登录（超级管理员：sa;密码：11）
     * @param sysUser
     * @return
     */
    SysUser findSysUserByNameAndPassword(SysUser sysUser);

    /**
     * 通过Shiro的授权方法验证当前登录用户拥有的角色
     * @param userName
     * @return
     */
    List<SysRole> findRoleNameByUserName(String userName);

    /**
     * 分页查询（前台未写）
     * @param pagination
     * @return
     */
    List<SysUser> findSysUserByLimit(Pagination pagination);

    /**
     * 分页查询
     * @param pagination
     * @return
     */
    Integer findCountByUserId(Pagination pagination);
}
