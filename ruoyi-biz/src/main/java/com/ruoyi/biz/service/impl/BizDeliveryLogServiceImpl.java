package com.ruoyi.biz.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizDeliveryLogMapper;
import com.ruoyi.biz.domain.BizDeliveryLog;
import com.ruoyi.biz.service.IBizDeliveryLogService;

/**
 * 发货记录Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizDeliveryLogServiceImpl implements IBizDeliveryLogService 
{
    @Autowired
    private BizDeliveryLogMapper bizDeliveryLogMapper;

    /**
     * 查询发货记录
     * 
     * @param id 发货记录主键
     * @return 发货记录
     */
    @Override
    public BizDeliveryLog selectBizDeliveryLogById(Integer id)
    {
        return bizDeliveryLogMapper.selectBizDeliveryLogById(id);
    }

    /**
     * 查询发货记录列表
     * 
     * @param bizDeliveryLog 发货记录
     * @return 发货记录
     */
    @Override
    public List<BizDeliveryLog> selectBizDeliveryLogList(BizDeliveryLog bizDeliveryLog)
    {
        return bizDeliveryLogMapper.selectBizDeliveryLogList(bizDeliveryLog);
    }

    /**
     * 新增发货记录
     * 
     * @param bizDeliveryLog 发货记录
     * @return 结果
     */
    @Override
    public int insertBizDeliveryLog(BizDeliveryLog bizDeliveryLog)
    {
        return bizDeliveryLogMapper.insertBizDeliveryLog(bizDeliveryLog);
    }

    /**
     * 修改发货记录
     * 
     * @param bizDeliveryLog 发货记录
     * @return 结果
     */
    @Override
    public int updateBizDeliveryLog(BizDeliveryLog bizDeliveryLog)
    {
        bizDeliveryLog.setUpdateTime(DateUtils.getNowDate());
        return bizDeliveryLogMapper.updateBizDeliveryLog(bizDeliveryLog);
    }

    /**
     * 批量删除发货记录
     * 
     * @param ids 需要删除的发货记录主键
     * @return 结果
     */
    @Override
    public int deleteBizDeliveryLogByIds(Integer[] ids)
    {
        return bizDeliveryLogMapper.deleteBizDeliveryLogByIds(ids);
    }

    /**
     * 删除发货记录信息
     * 
     * @param id 发货记录主键
     * @return 结果
     */
    @Override
    public int deleteBizDeliveryLogById(Integer id)
    {
        return bizDeliveryLogMapper.deleteBizDeliveryLogById(id);
    }
}
