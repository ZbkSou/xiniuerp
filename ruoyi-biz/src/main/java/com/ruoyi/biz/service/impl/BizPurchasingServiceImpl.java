package com.ruoyi.biz.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizPurchasingMapper;
import com.ruoyi.biz.domain.BizPurchasing;
import com.ruoyi.biz.service.IBizPurchasingService;

/**
 * 进货Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizPurchasingServiceImpl implements IBizPurchasingService 
{
    @Autowired
    private BizPurchasingMapper bizPurchasingMapper;

    /**
     * 查询进货
     * 
     * @param id 进货主键
     * @return 进货
     */
    @Override
    public BizPurchasing selectBizPurchasingById(Integer id)
    {
        return bizPurchasingMapper.selectBizPurchasingById(id);
    }

    /**
     * 查询进货列表
     * 
     * @param bizPurchasing 进货
     * @return 进货
     */
    @Override
    public List<BizPurchasing> selectBizPurchasingList(BizPurchasing bizPurchasing)
    {
        return bizPurchasingMapper.selectBizPurchasingList(bizPurchasing);
    }

    /**
     * 新增进货
     * 
     * @param bizPurchasing 进货
     * @return 结果
     */
    @Override
    public int insertBizPurchasing(BizPurchasing bizPurchasing)
    {
        return bizPurchasingMapper.insertBizPurchasing(bizPurchasing);
    }

    /**
     * 修改进货
     * 
     * @param bizPurchasing 进货
     * @return 结果
     */
    @Override
    public int updateBizPurchasing(BizPurchasing bizPurchasing)
    {
        bizPurchasing.setUpdateTime(DateUtils.getNowDate());
        return bizPurchasingMapper.updateBizPurchasing(bizPurchasing);
    }

    /**
     * 批量删除进货
     * 
     * @param ids 需要删除的进货主键
     * @return 结果
     */
    @Override
    public int deleteBizPurchasingByIds(Integer[] ids)
    {
        return bizPurchasingMapper.deleteBizPurchasingByIds(ids);
    }

    /**
     * 删除进货信息
     * 
     * @param id 进货主键
     * @return 结果
     */
    @Override
    public int deleteBizPurchasingById(Integer id)
    {
        return bizPurchasingMapper.deleteBizPurchasingById(id);
    }
}
