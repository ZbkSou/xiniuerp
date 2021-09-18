package com.ruoyi.biz.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizProductCategoryMapper;
import com.ruoyi.biz.domain.BizProductCategory;
import com.ruoyi.biz.service.IBizProductCategoryService;

/**
 * 商品分类Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizProductCategoryServiceImpl implements IBizProductCategoryService 
{
    @Autowired
    private BizProductCategoryMapper bizProductCategoryMapper;

    /**
     * 查询商品分类
     * 
     * @param categoryId 商品分类主键
     * @return 商品分类
     */
    @Override
    public BizProductCategory selectBizProductCategoryByCategoryId(Integer categoryId)
    {
        return bizProductCategoryMapper.selectBizProductCategoryByCategoryId(categoryId);
    }

    /**
     * 查询商品分类列表
     * 
     * @param bizProductCategory 商品分类
     * @return 商品分类
     */
    @Override
    public List<BizProductCategory> selectBizProductCategoryList(BizProductCategory bizProductCategory)
    {
        return bizProductCategoryMapper.selectBizProductCategoryList(bizProductCategory);
    }

    /**
     * 新增商品分类
     * 
     * @param bizProductCategory 商品分类
     * @return 结果
     */
    @Override
    public int insertBizProductCategory(BizProductCategory bizProductCategory)
    {
        return bizProductCategoryMapper.insertBizProductCategory(bizProductCategory);
    }

    /**
     * 修改商品分类
     * 
     * @param bizProductCategory 商品分类
     * @return 结果
     */
    @Override
    public int updateBizProductCategory(BizProductCategory bizProductCategory)
    {
        return bizProductCategoryMapper.updateBizProductCategory(bizProductCategory);
    }

    /**
     * 批量删除商品分类
     * 
     * @param categoryIds 需要删除的商品分类主键
     * @return 结果
     */
    @Override
    public int deleteBizProductCategoryByCategoryIds(Integer[] categoryIds)
    {
        return bizProductCategoryMapper.deleteBizProductCategoryByCategoryIds(categoryIds);
    }

    /**
     * 删除商品分类信息
     * 
     * @param categoryId 商品分类主键
     * @return 结果
     */
    @Override
    public int deleteBizProductCategoryByCategoryId(Integer categoryId)
    {
        return bizProductCategoryMapper.deleteBizProductCategoryByCategoryId(categoryId);
    }
}
