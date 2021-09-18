package com.ruoyi.biz.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizWarehouseInfoMapper;
import com.ruoyi.biz.domain.BizWarehouseInfo;
import com.ruoyi.biz.service.IBizWarehouseInfoService;

/**
 * 仓库信息Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizWarehouseInfoServiceImpl implements IBizWarehouseInfoService 
{
    @Autowired
    private BizWarehouseInfoMapper bizWarehouseInfoMapper;

    /**
     * 查询仓库信息
     * 
     * @param wId 仓库信息主键
     * @return 仓库信息
     */
    @Override
    public BizWarehouseInfo selectBizWarehouseInfoByWId(Integer wId)
    {
        return bizWarehouseInfoMapper.selectBizWarehouseInfoByWId(wId);
    }

    /**
     * 查询仓库信息列表
     * 
     * @param bizWarehouseInfo 仓库信息
     * @return 仓库信息
     */
    @Override
    public List<BizWarehouseInfo> selectBizWarehouseInfoList(BizWarehouseInfo bizWarehouseInfo)
    {
        return bizWarehouseInfoMapper.selectBizWarehouseInfoList(bizWarehouseInfo);
    }

    /**
     * 新增仓库信息
     * 
     * @param bizWarehouseInfo 仓库信息
     * @return 结果
     */
    @Override
    public int insertBizWarehouseInfo(BizWarehouseInfo bizWarehouseInfo)
    {
        return bizWarehouseInfoMapper.insertBizWarehouseInfo(bizWarehouseInfo);
    }

    /**
     * 修改仓库信息
     * 
     * @param bizWarehouseInfo 仓库信息
     * @return 结果
     */
    @Override
    public int updateBizWarehouseInfo(BizWarehouseInfo bizWarehouseInfo)
    {
        return bizWarehouseInfoMapper.updateBizWarehouseInfo(bizWarehouseInfo);
    }

    /**
     * 批量删除仓库信息
     * 
     * @param wIds 需要删除的仓库信息主键
     * @return 结果
     */
    @Override
    public int deleteBizWarehouseInfoByWIds(Integer[] wIds)
    {
        return bizWarehouseInfoMapper.deleteBizWarehouseInfoByWIds(wIds);
    }

    /**
     * 删除仓库信息信息
     * 
     * @param wId 仓库信息主键
     * @return 结果
     */
    @Override
    public int deleteBizWarehouseInfoByWId(Integer wId)
    {
        return bizWarehouseInfoMapper.deleteBizWarehouseInfoByWId(wId);
    }
}
