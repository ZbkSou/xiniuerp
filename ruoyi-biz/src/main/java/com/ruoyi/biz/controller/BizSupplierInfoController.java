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
import com.ruoyi.biz.domain.BizSupplierInfo;
import com.ruoyi.biz.service.IBizSupplierInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 供应商信息Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/supplierinfo")
public class BizSupplierInfoController extends BaseController
{
    @Autowired
    private IBizSupplierInfoService bizSupplierInfoService;

    /**
     * 查询供应商信息列表
     */
    @PreAuthorize("@ss.hasPermi('biz:supplierinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizSupplierInfo bizSupplierInfo)
    {
        startPage();
        List<BizSupplierInfo> list = bizSupplierInfoService.selectBizSupplierInfoList(bizSupplierInfo);
        return getDataTable(list);
    }

    /**
     * 导出供应商信息列表
     */
    @PreAuthorize("@ss.hasPermi('biz:supplierinfo:export')")
    @Log(title = "供应商信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizSupplierInfo bizSupplierInfo)
    {
        List<BizSupplierInfo> list = bizSupplierInfoService.selectBizSupplierInfoList(bizSupplierInfo);
        ExcelUtil<BizSupplierInfo> util = new ExcelUtil<BizSupplierInfo>(BizSupplierInfo.class);
        return util.exportExcel(list, "供应商信息数据");
    }

    /**
     * 获取供应商信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:supplierinfo:query')")
    @GetMapping(value = "/{supplierId}")
    public AjaxResult getInfo(@PathVariable("supplierId") Integer supplierId)
    {
        return AjaxResult.success(bizSupplierInfoService.selectBizSupplierInfoBySupplierId(supplierId));
    }

    /**
     * 新增供应商信息
     */
    @PreAuthorize("@ss.hasPermi('biz:supplierinfo:add')")
    @Log(title = "供应商信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizSupplierInfo bizSupplierInfo)
    {
        return toAjax(bizSupplierInfoService.insertBizSupplierInfo(bizSupplierInfo));
    }

    /**
     * 修改供应商信息
     */
    @PreAuthorize("@ss.hasPermi('biz:supplierinfo:edit')")
    @Log(title = "供应商信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizSupplierInfo bizSupplierInfo)
    {
        return toAjax(bizSupplierInfoService.updateBizSupplierInfo(bizSupplierInfo));
    }

    /**
     * 删除供应商信息
     */
    @PreAuthorize("@ss.hasPermi('biz:supplierinfo:remove')")
    @Log(title = "供应商信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{supplierIds}")
    public AjaxResult remove(@PathVariable Integer[] supplierIds)
    {
        return toAjax(bizSupplierInfoService.deleteBizSupplierInfoBySupplierIds(supplierIds));
    }
}
