package com.ruoyi.biz.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizProductInfoMapper;
import com.ruoyi.biz.domain.BizProductInfo;
import com.ruoyi.biz.service.IBizProductInfoService;

/**
 * 商品信息Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizProductInfoServiceImpl implements IBizProductInfoService 
{
    @Autowired
    private BizProductInfoMapper bizProductInfoMapper;

    /**
     * 查询商品信息
     * 
     * @param id 商品信息主键
     * @return 商品信息
     */
    @Override
    public BizProductInfo selectBizProductInfoById(Integer id)
    {
        return bizProductInfoMapper.selectBizProductInfoById(id);
    }

    /**
     * 查询商品信息
     *
     * @param id 商品信息主键
     * @return 商品信息
     */
    @Override
    public BizProductInfo selectBizProductInfoByCode(String id)
    {
        return bizProductInfoMapper.selectBizProductInfoByCode(id);
    }

    /**
     * 查询商品信息列表
     * 
     * @param bizProductInfo 商品信息
     * @return 商品信息
     */
    @Override
    public List<BizProductInfo> selectBizProductInfoList(BizProductInfo bizProductInfo)
    {
        return bizProductInfoMapper.selectBizProductInfoList(bizProductInfo);
    }

    /**
     * 新增商品信息
     * 
     * @param bizProductInfo 商品信息
     * @return 结果
     */
    @Override
    public int insertBizProductInfo(BizProductInfo bizProductInfo)
    {
        bizProductInfo.setCreateTime(DateUtils.getNowDate());
        return bizProductInfoMapper.insertBizProductInfo(bizProductInfo);
    }

    /**
     * 修改商品信息
     * 
     * @param bizProductInfo 商品信息
     * @return 结果
     */
    @Override
    public int updateBizProductInfo(BizProductInfo bizProductInfo)
    {
        bizProductInfo.setUpdateTime(DateUtils.getNowDate());
        return bizProductInfoMapper.updateBizProductInfo(bizProductInfo);
    }

    /**
     * 批量删除商品信息
     * 
     * @param ids 需要删除的商品信息主键
     * @return 结果
     */
    @Override
    public int deleteBizProductInfoByIds(Integer[] ids)
    {
        return bizProductInfoMapper.deleteBizProductInfoByIds(ids);
    }

    /**
     * 删除商品信息信息
     * 
     * @param id 商品信息主键
     * @return 结果
     */
    @Override
    public int deleteBizProductInfoById(Integer id)
    {
        return bizProductInfoMapper.deleteBizProductInfoById(id);
    }
}
