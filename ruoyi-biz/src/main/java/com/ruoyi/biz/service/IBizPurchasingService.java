package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.BizPurchasing;

/**
 * 进货Service接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface IBizPurchasingService 
{
    /**
     * 查询进货
     * 
     * @param id 进货主键
     * @return 进货
     */
    public BizPurchasing selectBizPurchasingById(Integer id);

    /**
     * 查询进货列表
     * 
     * @param bizPurchasing 进货
     * @return 进货集合
     */
    public List<BizPurchasing> selectBizPurchasingList(BizPurchasing bizPurchasing);

    /**
     * 新增进货
     * 
     * @param bizPurchasing 进货
     * @return 结果
     */
    public int insertBizPurchasing(BizPurchasing bizPurchasing);

    /**
     * 修改进货
     * 
     * @param bizPurchasing 进货
     * @return 结果
     */
    public int updateBizPurchasing(BizPurchasing bizPurchasing);

    /**
     * 批量删除进货
     * 
     * @param ids 需要删除的进货主键集合
     * @return 结果
     */
    public int deleteBizPurchasingByIds(Integer[] ids);

    /**
     * 删除进货信息
     * 
     * @param id 进货主键
     * @return 结果
     */
    public int deleteBizPurchasingById(Integer id);
}
