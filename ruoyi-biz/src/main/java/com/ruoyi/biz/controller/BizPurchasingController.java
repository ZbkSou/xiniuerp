package com.ruoyi.biz.controller;

import java.util.Date;
import java.util.List;

import com.ruoyi.biz.domain.BizPurchasingDetail;
import com.ruoyi.biz.domain.BizWarehouseInfo;
import com.ruoyi.biz.service.IBizPurchasingDetailService;
import com.ruoyi.biz.service.IBizWarehouseInfoService;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.LogUtils;
import org.slf4j.Logger;
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
import com.ruoyi.biz.domain.BizPurchasing;
import com.ruoyi.biz.service.IBizPurchasingService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 进货Controller
 *
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/purchasing")
public class BizPurchasingController extends BaseController {
    @Autowired
    private IBizPurchasingService bizPurchasingService;
    @Autowired
    private IBizPurchasingDetailService bizPurchasingDetailService;
    @Autowired
    private IBizWarehouseInfoService bizWarehouseInfoService;
    /**
     * 查询进货列表
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizPurchasing bizPurchasing) {
        startPage();
        List<BizPurchasing> list = bizPurchasingService.selectBizPurchasingList(bizPurchasing);
        return getDataTable(list);
    }

    /**
     * 导出进货列表
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:export')")
    @Log(title = "进货", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizPurchasing bizPurchasing) {
        List<BizPurchasing> list = bizPurchasingService.selectBizPurchasingList(bizPurchasing);
        ExcelUtil<BizPurchasing> util = new ExcelUtil<BizPurchasing>(BizPurchasing.class);
        return util.exportExcel(list, "进货数据");
    }

    /**
     * 获取进货详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id) {
        BizPurchasing  bizPurchasing = bizPurchasingService.selectBizPurchasingById(id);
        BizPurchasingDetail detail =new BizPurchasingDetail();
        detail.setPurchasingId(id);
        List<BizPurchasingDetail> detailList =   bizPurchasingDetailService.selectBizPurchasingDetailList(detail);
        bizPurchasing.setDetailList(detailList);
        return AjaxResult.success(bizPurchasing);
    }

    /**
     * 新增进货
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:add')")
    @Log(title = "进货", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizPurchasing bizPurchasing) {

        bizPurchasing.setCreateBy(getUsername());
        bizPurchasing.setUpdateBy(getUsername());
        bizPurchasing.setUpdateTime(new Date());
        bizPurchasing.setPurchasingTime(new Date());
        bizPurchasing.setEnterTime(new Date());
//        check
        int wid = bizPurchasing.getwId();
        BizWarehouseInfo warehouseInfo = bizWarehouseInfoService.selectBizWarehouseInfoByWId(wid);

        if(warehouseInfo==null){
            return AjaxResult.error("检查仓库");
        }

        //        计算总价
        int totalPic = 0;
        for (BizPurchasingDetail detail: bizPurchasing.getDetailList()) {
            totalPic +=detail.getCount()*detail.getPice();
        }
        bizPurchasing.setTotalGoodsPice((long) totalPic);
//        保存数据
        int res = bizPurchasingService.insertBizPurchasing(bizPurchasing);

        int purchasingId = bizPurchasing.getId();
        logger.debug(purchasingId + "");
        if (res > 0) {
            for (BizPurchasingDetail detail : bizPurchasing.getDetailList()) {
                detail.setPurchasingId(purchasingId);
                detail.setCreateBy(getUsername());
                detail.setCreateTime(new Date());
                detail.setUpdateBy(getUsername());
                detail.setUpdateTime(new Date());
                detail.setSupplierId(bizPurchasing.getSupplierId());
                detail.setwId(wid);
                bizPurchasingDetailService.insertBizPurchasingDetail(detail);
            }
        }
        return toAjax(res);
    }

    /**
     * 修改进货
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:edit')")
    @Log(title = "进货", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizPurchasing bizPurchasing) {
//        计算总价
        int totalPic = 0;
        for (BizPurchasingDetail detail: bizPurchasing.getDetailList()) {
            totalPic +=detail.getCount()*detail.getPice();
        }
        bizPurchasing.setTotalGoodsPice((long) totalPic);
//        更新详情
        for (BizPurchasingDetail detail : bizPurchasing.getDetailList()) {
            bizPurchasingDetailService.updateBizPurchasingDetail(detail);
        }
//        更新进货单
        return toAjax(bizPurchasingService.updateBizPurchasing(bizPurchasing));
    }

    /**
     * 删除进货
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:remove')")
    @Log(title = "进货", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids) {
        return toAjax(bizPurchasingService.deleteBizPurchasingByIds(ids));
    }
}
