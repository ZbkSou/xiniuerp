package com.ruoyi.biz.service.impl;

import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizOrderMasterMapper;
import com.ruoyi.biz.domain.BizOrderMaster;
import com.ruoyi.biz.service.IBizOrderMasterService;

/**
 * 订单主Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizOrderMasterServiceImpl implements IBizOrderMasterService 
{
    @Autowired
    private BizOrderMasterMapper bizOrderMasterMapper;

    /**
     * 查询订单主
     * 
     * @param id 订单主主键
     * @return 订单主
     */
    @Override
    public BizOrderMaster selectBizOrderMasterById(Integer id)
    {
        return bizOrderMasterMapper.selectBizOrderMasterById(id);
    }

    @Override
    public List<Map<String,String>> selectBizOrderMasterStatistics(Map<String,String> map)
    {
        return bizOrderMasterMapper.selectBizOrderMasterStatistics(map);
    }
    @Override
    public List<Map<String,String>> selectBizOrderClass(Map<String,String> map)
    {
        return bizOrderMasterMapper.selectBizOrderClass(map);
    }
    /**
     * 查询订单主列表
     * 
     * @param bizOrderMaster 订单主
     * @return 订单主
     */
    @Override
    public List<BizOrderMaster> selectBizOrderMasterList(BizOrderMaster bizOrderMaster)
    {
        return bizOrderMasterMapper.selectBizOrderMasterList(bizOrderMaster);
    }

    /**
     * 新增订单主
     * 
     * @param bizOrderMaster 订单主
     * @return 结果
     */
    @Override
    public int insertBizOrderMaster(BizOrderMaster bizOrderMaster)
    {
        bizOrderMaster.setCreateTime(DateUtils.getNowDate());
        return bizOrderMasterMapper.insertBizOrderMaster(bizOrderMaster);
    }

    /**
     * 修改订单主
     * 
     * @param bizOrderMaster 订单主
     * @return 结果
     */
    @Override
    public int updateBizOrderMaster(BizOrderMaster bizOrderMaster)
    {
        bizOrderMaster.setUpdateTime(DateUtils.getNowDate());
        return bizOrderMasterMapper.updateBizOrderMaster(bizOrderMaster);
    }

    /**
     * 批量删除订单主
     * 
     * @param ids 需要删除的订单主主键
     * @return 结果
     */
    @Override
    public int deleteBizOrderMasterByIds(Integer[] ids)
    {
        return bizOrderMasterMapper.deleteBizOrderMasterByIds(ids);
    }

    /**
     * 删除订单主信息
     * 
     * @param id 订单主主键
     * @return 结果
     */
    @Override
    public int deleteBizOrderMasterById(Integer id)
    {
        return bizOrderMasterMapper.deleteBizOrderMasterById(id);
    }
}
