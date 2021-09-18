package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.BizPurchasingDetail;

/**
 * 进货单详情Service接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface IBizPurchasingDetailService 
{
    /**
     * 查询进货单详情
     * 
     * @param id 进货单详情主键
     * @return 进货单详情
     */
    public BizPurchasingDetail selectBizPurchasingDetailById(Integer id);

    /**
     * 查询进货单详情列表
     * 
     * @param bizPurchasingDetail 进货单详情
     * @return 进货单详情集合
     */
    public List<BizPurchasingDetail> selectBizPurchasingDetailList(BizPurchasingDetail bizPurchasingDetail);

    /**
     * 新增进货单详情
     * 
     * @param bizPurchasingDetail 进货单详情
     * @return 结果
     */
    public int insertBizPurchasingDetail(BizPurchasingDetail bizPurchasingDetail);

    /**
     * 修改进货单详情
     * 
     * @param bizPurchasingDetail 进货单详情
     * @return 结果
     */
    public int updateBizPurchasingDetail(BizPurchasingDetail bizPurchasingDetail);

    /**
     * 批量删除进货单详情
     * 
     * @param ids 需要删除的进货单详情主键集合
     * @return 结果
     */
    public int deleteBizPurchasingDetailByIds(Integer[] ids);

    /**
     * 删除进货单详情信息
     * 
     * @param id 进货单详情主键
     * @return 结果
     */
    public int deleteBizPurchasingDetailById(Integer id);
}
