package com.ruoyi.biz.mapper;

import java.util.List;
import com.ruoyi.biz.domain.BizDeliveryCost;

/**
 * 发货成本Mapper接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface BizDeliveryCostMapper 
{
    /**
     * 查询发货成本
     * 
     * @param id 发货成本主键
     * @return 发货成本
     */
    public BizDeliveryCost selectBizDeliveryCostById(Integer id);

    /**
     * 查询发货成本列表
     * 
     * @param bizDeliveryCost 发货成本
     * @return 发货成本集合
     */
    public List<BizDeliveryCost> selectBizDeliveryCostList(BizDeliveryCost bizDeliveryCost);

    /**
     * 新增发货成本
     * 
     * @param bizDeliveryCost 发货成本
     * @return 结果
     */
    public int insertBizDeliveryCost(BizDeliveryCost bizDeliveryCost);

    /**
     * 修改发货成本
     * 
     * @param bizDeliveryCost 发货成本
     * @return 结果
     */
    public int updateBizDeliveryCost(BizDeliveryCost bizDeliveryCost);

    /**
     * 删除发货成本
     * 
     * @param id 发货成本主键
     * @return 结果
     */
    public int deleteBizDeliveryCostById(Integer id);

    /**
     * 批量删除发货成本
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizDeliveryCostByIds(Integer[] ids);
}
