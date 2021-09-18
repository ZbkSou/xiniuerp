package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.BizProductCategory;

/**
 * 商品分类Service接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface IBizProductCategoryService 
{
    /**
     * 查询商品分类
     * 
     * @param categoryId 商品分类主键
     * @return 商品分类
     */
    public BizProductCategory selectBizProductCategoryByCategoryId(Integer categoryId);

    /**
     * 查询商品分类列表
     * 
     * @param bizProductCategory 商品分类
     * @return 商品分类集合
     */
    public List<BizProductCategory> selectBizProductCategoryList(BizProductCategory bizProductCategory);

    /**
     * 新增商品分类
     * 
     * @param bizProductCategory 商品分类
     * @return 结果
     */
    public int insertBizProductCategory(BizProductCategory bizProductCategory);

    /**
     * 修改商品分类
     * 
     * @param bizProductCategory 商品分类
     * @return 结果
     */
    public int updateBizProductCategory(BizProductCategory bizProductCategory);

    /**
     * 批量删除商品分类
     * 
     * @param categoryIds 需要删除的商品分类主键集合
     * @return 结果
     */
    public int deleteBizProductCategoryByCategoryIds(Integer[] categoryIds);

    /**
     * 删除商品分类信息
     * 
     * @param categoryId 商品分类主键
     * @return 结果
     */
    public int deleteBizProductCategoryByCategoryId(Integer categoryId);
}
