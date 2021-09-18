package com.ruoyi.biz.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.biz.domain.BizProductCategory;
import com.ruoyi.biz.service.IBizProductCategoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商品分类Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/category")
public class BizProductCategoryController extends BaseController
{
    @Autowired
    private IBizProductCategoryService bizProductCategoryService;

    /**
     * 查询商品分类列表
     */
    @PreAuthorize("@ss.hasPermi('biz:category:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizProductCategory bizProductCategory)
    {
        startPage();
        List<BizProductCategory> list = bizProductCategoryService.selectBizProductCategoryList(bizProductCategory);
        return getDataTable(list);
    }

    /**
     * 导出商品分类列表
     */
    @PreAuthorize("@ss.hasPermi('biz:category:export')")
    @Log(title = "商品分类", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizProductCategory bizProductCategory)
    {
        List<BizProductCategory> list = bizProductCategoryService.selectBizProductCategoryList(bizProductCategory);
        ExcelUtil<BizProductCategory> util = new ExcelUtil<BizProductCategory>(BizProductCategory.class);
        return util.exportExcel(list, "商品分类数据");
    }

    /**
     * 获取商品分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:category:query')")
    @GetMapping(value = "/{categoryId}")
    public AjaxResult getInfo(@PathVariable("categoryId") Integer categoryId)
    {
        return AjaxResult.success(bizProductCategoryService.selectBizProductCategoryByCategoryId(categoryId));
    }

    /**
     * 新增商品分类
     */
    @PreAuthorize("@ss.hasPermi('biz:category:add')")
    @Log(title = "商品分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizProductCategory bizProductCategory)
    {
        return toAjax(bizProductCategoryService.insertBizProductCategory(bizProductCategory));
    }

    /**
     * 修改商品分类
     */
    @PreAuthorize("@ss.hasPermi('biz:category:edit')")
    @Log(title = "商品分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizProductCategory bizProductCategory)
    {
        return toAjax(bizProductCategoryService.updateBizProductCategory(bizProductCategory));
    }

    /**
     * 删除商品分类
     */
    @PreAuthorize("@ss.hasPermi('biz:category:remove')")
    @Log(title = "商品分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{categoryIds}")
    public AjaxResult remove(@PathVariable Integer[] categoryIds)
    {
        return toAjax(bizProductCategoryService.deleteBizProductCategoryByCategoryIds(categoryIds));
    }
}
