package com.ruoyi.biz.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;

import com.csvreader.CsvReader;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.biz.domain.BizOrderMaster;
import com.ruoyi.biz.service.IBizOrderMasterService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 订单主Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/master")
public class BizOrderMasterController extends BaseController
{
    @Autowired
    private IBizOrderMasterService bizOrderMasterService;

    /**
     * 查询订单主列表
     */
    @PreAuthorize("@ss.hasPermi('biz:master:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizOrderMaster bizOrderMaster)
    {
        startPage();
        List<BizOrderMaster> list = bizOrderMasterService.selectBizOrderMasterList(bizOrderMaster);
        return getDataTable(list);
    }

    /**
     * 导出订单主列表
     */
    @PreAuthorize("@ss.hasPermi('biz:master:export')")
    @Log(title = "订单主", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizOrderMaster bizOrderMaster)
    {
        List<BizOrderMaster> list = bizOrderMasterService.selectBizOrderMasterList(bizOrderMaster);
        ExcelUtil<BizOrderMaster> util = new ExcelUtil<BizOrderMaster>(BizOrderMaster.class);
        return util.exportExcel(list, "订单主数据");
    }

    /**
     * 获取订单主详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:master:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(bizOrderMasterService.selectBizOrderMasterById(id));
    }

    /**
     * 新增订单主
     */
    @PreAuthorize("@ss.hasPermi('biz:master:add')")
    @Log(title = "订单主", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizOrderMaster bizOrderMaster)
    {
        return toAjax(bizOrderMasterService.insertBizOrderMaster(bizOrderMaster));
    }
    /**
     * 通过文件新增订单主
     */
    @PreAuthorize("@ss.hasPermi('biz:master:add')")
    @Log(title = "订单主", businessType = BusinessType.INSERT)
    @PostMapping(value = "/addByXml")
    public AjaxResult addByXml( MultipartFile file,  String type)
    {
        logger.info(type);
//        拼多多
        if("1".equals(type)){
            CsvReader r = null;
            try {
                InputStream inputStream = file.getInputStream();
                InputStreamReader is = new InputStreamReader(inputStream);
                r = new CsvReader(is);
                //逐条读取记录，直至读完
                r.readHeaders();
                while (r.readRecord()) {
                    BizOrderMaster bizOrderMaster =new BizOrderMaster();
//                    处理订单状态
                    switch (r.get("订单状态")){
                        case "待发货":
                            bizOrderMaster.setOrderStatus(1);
                            break;
                        case "待支付":
                            bizOrderMaster.setOrderStatus(2);
                            break;
                        case "已取消":
                            bizOrderMaster.setOrderStatus(3);
                            break;
                        case "未发货，退款成功":
                            bizOrderMaster.setOrderStatus(4);
                            break;
                        case "已发货，待签收":
                            bizOrderMaster.setOrderStatus(5);
                            break;
                        case "已签收":
                            bizOrderMaster.setOrderStatus(6);
                            break;
                        case "已发货，退款成功":
                            bizOrderMaster.setOrderStatus(7);
                            break;

                    }

                    bizOrderMasterService.insertBizOrderMaster(bizOrderMaster);


                }
                r.close();
                return toAjax(true);
            } catch (Exception e) {
                logger.info(e.getMessage());
                return toAjax(false);
            } finally {
                r.close();
            }
        }
        Boolean bool = ExcelUtil.checkFile(file);
        if(!bool){
            return toAjax(false);
        }

        return toAjax(true);
    }
    /**
     * 修改订单主
     */
    @PreAuthorize("@ss.hasPermi('biz:master:edit')")
    @Log(title = "订单主", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizOrderMaster bizOrderMaster)
    {
        return toAjax(bizOrderMasterService.updateBizOrderMaster(bizOrderMaster));
    }

    /**
     * 删除订单主
     */
    @PreAuthorize("@ss.hasPermi('biz:master:remove')")
    @Log(title = "订单主", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(bizOrderMasterService.deleteBizOrderMasterByIds(ids));
    }
}
