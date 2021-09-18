package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.BizPlatformToken;

/**
 * 三方平台Service接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface IBizPlatformTokenService 
{
    /**
     * 查询三方平台
     * 
     * @param id 三方平台主键
     * @return 三方平台
     */
    public BizPlatformToken selectBizPlatformTokenById(Long id);

    /**
     * 查询三方平台列表
     * 
     * @param bizPlatformToken 三方平台
     * @return 三方平台集合
     */
    public List<BizPlatformToken> selectBizPlatformTokenList(BizPlatformToken bizPlatformToken);

    /**
     * 新增三方平台
     * 
     * @param bizPlatformToken 三方平台
     * @return 结果
     */
    public int insertBizPlatformToken(BizPlatformToken bizPlatformToken);

    /**
     * 修改三方平台
     * 
     * @param bizPlatformToken 三方平台
     * @return 结果
     */
    public int updateBizPlatformToken(BizPlatformToken bizPlatformToken);

    /**
     * 批量删除三方平台
     * 
     * @param ids 需要删除的三方平台主键集合
     * @return 结果
     */
    public int deleteBizPlatformTokenByIds(Long[] ids);

    /**
     * 删除三方平台信息
     * 
     * @param id 三方平台主键
     * @return 结果
     */
    public int deleteBizPlatformTokenById(Long id);
}
