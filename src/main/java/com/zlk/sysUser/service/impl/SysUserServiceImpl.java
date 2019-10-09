package com.zlk.sysUser.service.impl;

import com.zlk.sysUser.entity.Pagination;
import com.zlk.sysUser.entity.SysRole;
import com.zlk.sysUser.entity.SysUser;
import com.zlk.sysUser.mapper.SysUserMapper;
import com.zlk.sysUser.service.SysUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SysUserServiceImpl implements SysUserService {

    @Resource
    private SysUserMapper sysUserMapper;

    @Override
    public SysUser findSysUserOfNameByShiro(String userName) {
        return sysUserMapper.findSysUserOfNameByShiro(userName);
    }

    @Override
    public SysUser findSysUserByNameAndPassword(SysUser sysUser) {
        return sysUserMapper.findSysUserByNameAndPassword(sysUser);
    }

    @Override
    public List<SysRole> findRoleNameByUserName(String userName) {
        return sysUserMapper.findRoleNameByUserName(userName);
    }

    @Override
    public List<SysUser> findSysUserByLimit(Pagination pagination) {
        return sysUserMapper.findSysUserByLimit(pagination);
    }

    @Override
    public Integer findCountByUserId(Pagination pagination) {
        return sysUserMapper.findCountByUserId(pagination);
    }
}
