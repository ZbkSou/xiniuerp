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
import com.ruoyi.biz.domain.BizProductInfo;
import com.ruoyi.biz.service.IBizProductInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商品信息Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/productinfo")
public class BizProductInfoController extends BaseController
{
    @Autowired
    private IBizProductInfoService bizProductInfoService;

    /**
     * 查询商品信息列表
     */
    @PreAuthorize("@ss.hasPermi('biz:productinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizProductInfo bizProductInfo)
    {
        startPage();
        List<BizProductInfo> list = bizProductInfoService.selectBizProductInfoList(bizProductInfo);
        return getDataTable(list);
    }

    /**
     * 导出商品信息列表
     */
    @PreAuthorize("@ss.hasPermi('biz:productinfo:export')")
    @Log(title = "商品信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizProductInfo bizProductInfo)
    {
        List<BizProductInfo> list = bizProductInfoService.selectBizProductInfoList(bizProductInfo);
        ExcelUtil<BizProductInfo> util = new ExcelUtil<BizProductInfo>(BizProductInfo.class);
        return util.exportExcel(list, "商品信息数据");
    }

    /**
     * 获取商品信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:productinfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(bizProductInfoService.selectBizProductInfoById(id));
    }

    /**
     * 新增商品信息
     */
    @PreAuthorize("@ss.hasPermi('biz:productinfo:add')")
    @Log(title = "商品信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizProductInfo bizProductInfo)
    {
        return toAjax(bizProductInfoService.insertBizProductInfo(bizProductInfo));
    }

    /**
     * 修改商品信息
     */
    @PreAuthorize("@ss.hasPermi('biz:productinfo:edit')")
    @Log(title = "商品信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizProductInfo bizProductInfo)
    {
        return toAjax(bizProductInfoService.updateBizProductInfo(bizProductInfo));
    }

    /**
     * 删除商品信息
     */
    @PreAuthorize("@ss.hasPermi('biz:productinfo:remove')")
    @Log(title = "商品信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(bizProductInfoService.deleteBizProductInfoByIds(ids));
    }
}
