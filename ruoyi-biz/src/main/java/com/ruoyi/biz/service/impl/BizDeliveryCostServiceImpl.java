package com.ruoyi.biz.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizDeliveryCostMapper;
import com.ruoyi.biz.domain.BizDeliveryCost;
import com.ruoyi.biz.service.IBizDeliveryCostService;

/**
 * 发货成本Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizDeliveryCostServiceImpl implements IBizDeliveryCostService 
{
    @Autowired
    private BizDeliveryCostMapper bizDeliveryCostMapper;

    /**
     * 查询发货成本
     * 
     * @param id 发货成本主键
     * @return 发货成本
     */
    @Override
    public BizDeliveryCost selectBizDeliveryCostById(Integer id)
    {
        return bizDeliveryCostMapper.selectBizDeliveryCostById(id);
    }

    /**
     * 查询发货成本列表
     * 
     * @param bizDeliveryCost 发货成本
     * @return 发货成本
     */
    @Override
    public List<BizDeliveryCost> selectBizDeliveryCostList(BizDeliveryCost bizDeliveryCost)
    {
        return bizDeliveryCostMapper.selectBizDeliveryCostList(bizDeliveryCost);
    }

    /**
     * 新增发货成本
     * 
     * @param bizDeliveryCost 发货成本
     * @return 结果
     */
    @Override
    public int insertBizDeliveryCost(BizDeliveryCost bizDeliveryCost)
    {
        return bizDeliveryCostMapper.insertBizDeliveryCost(bizDeliveryCost);
    }

    /**
     * 修改发货成本
     * 
     * @param bizDeliveryCost 发货成本
     * @return 结果
     */
    @Override
    public int updateBizDeliveryCost(BizDeliveryCost bizDeliveryCost)
    {
        bizDeliveryCost.setUpdateTime(DateUtils.getNowDate());
        return bizDeliveryCostMapper.updateBizDeliveryCost(bizDeliveryCost);
    }

    /**
     * 批量删除发货成本
     * 
     * @param ids 需要删除的发货成本主键
     * @return 结果
     */
    @Override
    public int deleteBizDeliveryCostByIds(Integer[] ids)
    {
        return bizDeliveryCostMapper.deleteBizDeliveryCostByIds(ids);
    }

    /**
     * 删除发货成本信息
     * 
     * @param id 发货成本主键
     * @return 结果
     */
    @Override
    public int deleteBizDeliveryCostById(Integer id)
    {
        return bizDeliveryCostMapper.deleteBizDeliveryCostById(id);
    }
}
