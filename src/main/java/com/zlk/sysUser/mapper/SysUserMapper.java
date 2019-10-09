package com.zlk.sysUser.mapper;

import com.zlk.sysUser.entity.Pagination;
import com.zlk.sysUser.entity.SysRole;
import com.zlk.sysUser.entity.SysUser;

import java.util.List;

public interface SysUserMapper {

    SysUser findSysUserOfNameByShiro(String userName);

    SysUser findSysUserByNameAndPassword(SysUser sysUser);

    List<SysRole> findRoleNameByUserName(String userName);

    List<SysUser> findSysUserByLimit(Pagination pagination);

    Integer findCountByUserId(Pagination pagination);
}
