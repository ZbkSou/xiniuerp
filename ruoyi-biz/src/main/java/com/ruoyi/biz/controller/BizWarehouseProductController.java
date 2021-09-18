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
import com.ruoyi.biz.domain.BizWarehouseProduct;
import com.ruoyi.biz.service.IBizWarehouseProductService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商品库存Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/warehouseproduct")
public class BizWarehouseProductController extends BaseController
{
    @Autowired
    private IBizWarehouseProductService bizWarehouseProductService;

    /**
     * 查询商品库存列表
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseproduct:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizWarehouseProduct bizWarehouseProduct)
    {
        startPage();
        List<BizWarehouseProduct> list = bizWarehouseProductService.selectBizWarehouseProductList(bizWarehouseProduct);
        return getDataTable(list);
    }

    /**
     * 导出商品库存列表
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseproduct:export')")
    @Log(title = "商品库存", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizWarehouseProduct bizWarehouseProduct)
    {
        List<BizWarehouseProduct> list = bizWarehouseProductService.selectBizWarehouseProductList(bizWarehouseProduct);
        ExcelUtil<BizWarehouseProduct> util = new ExcelUtil<BizWarehouseProduct>(BizWarehouseProduct.class);
        return util.exportExcel(list, "商品库存数据");
    }

    /**
     * 获取商品库存详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseproduct:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(bizWarehouseProductService.selectBizWarehouseProductById(id));
    }

    /**
     * 新增商品库存
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseproduct:add')")
    @Log(title = "商品库存", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizWarehouseProduct bizWarehouseProduct)
    {
        return toAjax(bizWarehouseProductService.insertBizWarehouseProduct(bizWarehouseProduct));
    }

    /**
     * 修改商品库存
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseproduct:edit')")
    @Log(title = "商品库存", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizWarehouseProduct bizWarehouseProduct)
    {
        return toAjax(bizWarehouseProductService.updateBizWarehouseProduct(bizWarehouseProduct));
    }

    /**
     * 删除商品库存
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseproduct:remove')")
    @Log(title = "商品库存", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(bizWarehouseProductService.deleteBizWarehouseProductByIds(ids));
    }
}
