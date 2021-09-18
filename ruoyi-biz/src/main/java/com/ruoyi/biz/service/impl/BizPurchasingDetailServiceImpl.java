package com.ruoyi.biz.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizPurchasingDetailMapper;
import com.ruoyi.biz.domain.BizPurchasingDetail;
import com.ruoyi.biz.service.IBizPurchasingDetailService;

/**
 * 进货单详情Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizPurchasingDetailServiceImpl implements IBizPurchasingDetailService 
{
    @Autowired
    private BizPurchasingDetailMapper bizPurchasingDetailMapper;

    /**
     * 查询进货单详情
     * 
     * @param id 进货单详情主键
     * @return 进货单详情
     */
    @Override
    public BizPurchasingDetail selectBizPurchasingDetailById(Integer id)
    {
        return bizPurchasingDetailMapper.selectBizPurchasingDetailById(id);
    }

    /**
     * 查询进货单详情列表
     * 
     * @param bizPurchasingDetail 进货单详情
     * @return 进货单详情
     */
    @Override
    public List<BizPurchasingDetail> selectBizPurchasingDetailList(BizPurchasingDetail bizPurchasingDetail)
    {
        return bizPurchasingDetailMapper.selectBizPurchasingDetailList(bizPurchasingDetail);
    }

    /**
     * 新增进货单详情
     * 
     * @param bizPurchasingDetail 进货单详情
     * @return 结果
     */
    @Override
    public int insertBizPurchasingDetail(BizPurchasingDetail bizPurchasingDetail)
    {
        bizPurchasingDetail.setCreateTime(DateUtils.getNowDate());
        return bizPurchasingDetailMapper.insertBizPurchasingDetail(bizPurchasingDetail);
    }

    /**
     * 修改进货单详情
     * 
     * @param bizPurchasingDetail 进货单详情
     * @return 结果
     */
    @Override
    public int updateBizPurchasingDetail(BizPurchasingDetail bizPurchasingDetail)
    {
        bizPurchasingDetail.setUpdateTime(DateUtils.getNowDate());
        return bizPurchasingDetailMapper.updateBizPurchasingDetail(bizPurchasingDetail);
    }

    /**
     * 批量删除进货单详情
     * 
     * @param ids 需要删除的进货单详情主键
     * @return 结果
     */
    @Override
    public int deleteBizPurchasingDetailByIds(Integer[] ids)
    {
        return bizPurchasingDetailMapper.deleteBizPurchasingDetailByIds(ids);
    }

    /**
     * 删除进货单详情信息
     * 
     * @param id 进货单详情主键
     * @return 结果
     */
    @Override
    public int deleteBizPurchasingDetailById(Integer id)
    {
        return bizPurchasingDetailMapper.deleteBizPurchasingDetailById(id);
    }
}
