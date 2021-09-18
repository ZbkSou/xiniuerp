package com.ruoyi.biz.mapper;

import java.util.List;
import com.ruoyi.biz.domain.BizPurchasingDetail;

/**
 * 进货单详情Mapper接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface BizPurchasingDetailMapper 
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
     * 删除进货单详情
     * 
     * @param id 进货单详情主键
     * @return 结果
     */
    public int deleteBizPurchasingDetailById(Integer id);

    /**
     * 批量删除进货单详情
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizPurchasingDetailByIds(Integer[] ids);
}
