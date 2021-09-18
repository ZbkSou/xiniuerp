package com.ruoyi.biz.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizPlatformTokenMapper;
import com.ruoyi.biz.domain.BizPlatformToken;
import com.ruoyi.biz.service.IBizPlatformTokenService;

/**
 * 三方平台Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizPlatformTokenServiceImpl implements IBizPlatformTokenService 
{
    @Autowired
    private BizPlatformTokenMapper bizPlatformTokenMapper;

    /**
     * 查询三方平台
     * 
     * @param id 三方平台主键
     * @return 三方平台
     */
    @Override
    public BizPlatformToken selectBizPlatformTokenById(Long id)
    {
        return bizPlatformTokenMapper.selectBizPlatformTokenById(id);
    }

    /**
     * 查询三方平台列表
     * 
     * @param bizPlatformToken 三方平台
     * @return 三方平台
     */
    @Override
    public List<BizPlatformToken> selectBizPlatformTokenList(BizPlatformToken bizPlatformToken)
    {
        return bizPlatformTokenMapper.selectBizPlatformTokenList(bizPlatformToken);
    }

    /**
     * 新增三方平台
     * 
     * @param bizPlatformToken 三方平台
     * @return 结果
     */
    @Override
    public int insertBizPlatformToken(BizPlatformToken bizPlatformToken)
    {
        bizPlatformToken.setCreateTime(DateUtils.getNowDate());
        return bizPlatformTokenMapper.insertBizPlatformToken(bizPlatformToken);
    }

    /**
     * 修改三方平台
     * 
     * @param bizPlatformToken 三方平台
     * @return 结果
     */
    @Override
    public int updateBizPlatformToken(BizPlatformToken bizPlatformToken)
    {
        bizPlatformToken.setUpdateTime(DateUtils.getNowDate());
        return bizPlatformTokenMapper.updateBizPlatformToken(bizPlatformToken);
    }

    /**
     * 批量删除三方平台
     * 
     * @param ids 需要删除的三方平台主键
     * @return 结果
     */
    @Override
    public int deleteBizPlatformTokenByIds(Long[] ids)
    {
        return bizPlatformTokenMapper.deleteBizPlatformTokenByIds(ids);
    }

    /**
     * 删除三方平台信息
     * 
     * @param id 三方平台主键
     * @return 结果
     */
    @Override
    public int deleteBizPlatformTokenById(Long id)
    {
        return bizPlatformTokenMapper.deleteBizPlatformTokenById(id);
    }
}
