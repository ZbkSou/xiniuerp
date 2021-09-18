package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.BizDeliveryLog;

/**
 * 发货记录Service接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface IBizDeliveryLogService 
{
    /**
     * 查询发货记录
     * 
     * @param id 发货记录主键
     * @return 发货记录
     */
    public BizDeliveryLog selectBizDeliveryLogById(Integer id);

    /**
     * 查询发货记录列表
     * 
     * @param bizDeliveryLog 发货记录
     * @return 发货记录集合
     */
    public List<BizDeliveryLog> selectBizDeliveryLogList(BizDeliveryLog bizDeliveryLog);

    /**
     * 新增发货记录
     * 
     * @param bizDeliveryLog 发货记录
     * @return 结果
     */
    public int insertBizDeliveryLog(BizDeliveryLog bizDeliveryLog);

    /**
     * 修改发货记录
     * 
     * @param bizDeliveryLog 发货记录
     * @return 结果
     */
    public int updateBizDeliveryLog(BizDeliveryLog bizDeliveryLog);

    /**
     * 批量删除发货记录
     * 
     * @param ids 需要删除的发货记录主键集合
     * @return 结果
     */
    public int deleteBizDeliveryLogByIds(Integer[] ids);

    /**
     * 删除发货记录信息
     * 
     * @param id 发货记录主键
     * @return 结果
     */
    public int deleteBizDeliveryLogById(Integer id);
}
