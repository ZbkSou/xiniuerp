package com.ruoyi.biz.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import com.csvreader.CsvReader;
import com.ruoyi.biz.domain.BizOrderDetail;
import com.ruoyi.biz.domain.BizProductInfo;
import com.ruoyi.biz.service.IBizOrderDetailService;
import com.ruoyi.biz.service.IBizProductInfoService;
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
public class BizOrderMasterController extends BaseController {
    @Autowired
    private IBizOrderMasterService bizOrderMasterService;
    @Autowired
    private IBizOrderDetailService bizOrderDetailService;

    @Autowired
    private IBizProductInfoService bizProductInfoService;

    /**
     * 查询订单主列表
     */
    @PreAuthorize("@ss.hasPermi('biz:master:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizOrderMaster bizOrderMaster) {
        startPage();
        List<BizOrderMaster> list = bizOrderMasterService.selectBizOrderMasterList(bizOrderMaster);
        return getDataTable(list);
    }
    /**
     * 统计订单状态
     */
    @PreAuthorize("@ss.hasPermi('biz:master:list')")
    @PostMapping("/selectBizOrderMasterStatistics")
    public AjaxResult selectBizOrderMasterStatistics(String type) {

        Map<String,String> param = new HashMap<>();
        if(type!=null){
            param.put("customerId",type);
        }
        List<String> time  = getDate();

        param.put("status","1");
        List<String> daifahuoCount = new ArrayList<>();
        List<String> weifatuikuanCount = new ArrayList<>();
        List<String> yifaCount = new ArrayList<>();
        List<String> yiqianCount = new ArrayList<>();
        List<String> yifatuikuanCount = new ArrayList<>();
        List<String> yiqianshoutuikuanCount = new ArrayList<>();
        List<Map<String,String>> maps = bizOrderMasterService.selectBizOrderMasterStatistics(param);
        for(Map<String,String> map:maps){
            daifahuoCount.add(map.get("count"));
        }
        param.put("status","4");
        maps = bizOrderMasterService.selectBizOrderMasterStatistics(param);
        for(Map<String,String> map:maps){
            weifatuikuanCount.add(map.get("count"));
        }
        param.put("status","5");
        maps = bizOrderMasterService.selectBizOrderMasterStatistics(param);
        for(Map<String,String> map:maps){
            yifaCount.add(map.get("count"));
        }
        param.put("status","6");
        maps = bizOrderMasterService.selectBizOrderMasterStatistics(param);
        for(Map<String,String> map:maps){
            yiqianCount.add(map.get("count"));
        }
        param.put("status","7");
        maps = bizOrderMasterService.selectBizOrderMasterStatistics(param);
        for(Map<String,String> map:maps){
            yifatuikuanCount.add(map.get("count"));
        }
        param.put("status","8");
        maps = bizOrderMasterService.selectBizOrderMasterStatistics(param);
        for(Map<String,String> map:maps){
            yiqianshoutuikuanCount.add(map.get("count"));
        }

        Map<String,List<String>> resultMap =new HashMap<>();
        resultMap.put("time",time);

        resultMap.put("daifahuoCount",daifahuoCount);
        resultMap.put("weifatuikuanCount",weifatuikuanCount);
        resultMap.put("yifaCount",yifaCount);
        resultMap.put("yiqianCount",yiqianCount);
        resultMap.put("yifatuikuanCount",yifatuikuanCount);
        resultMap.put("yiqianshoutuikuanCount",yiqianshoutuikuanCount);

        return AjaxResult.success(resultMap);
    }

    /**
     * 查询订单产品分类
     */
    @PreAuthorize("@ss.hasPermi('biz:master:list')")
    @PostMapping("/selectBizOrderClass")
    public AjaxResult selectBizOrderClass(String type){
        Map<String,String> param = new HashMap<>();
        if(type!=null){
            param.put("customerId",type);
        }
        List<Map<String,String>> maps = bizOrderMasterService.selectBizOrderClass(param);
        return AjaxResult.success(maps);
    }



    private List<String> getDate(){
        Calendar begin = Calendar.getInstance();// 得到一个Calendar的实例
        begin.setTime(new Date()); // 设置时间为当前时间
        begin.add(Calendar.MONTH, -1);// 月份减1
        begin.add(Calendar.DATE, +1);// 日期加1
        Date result = begin.getTime();
        Calendar end = Calendar.getInstance();
        Long startTime = begin.getTimeInMillis();
        Long endTime = end.getTimeInMillis();
        Long oneDay = 1000 * 60 * 60 * 24l;// 一天的时间转化为ms
        List dates = new ArrayList<>();
        Long time = startTime;
        int i = 0;
        while (time <= endTime) {
            Date d = new Date(time);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            dates.add(i, df.format(d));
            i++;
            time += oneDay;
        }
        return dates;
    }


    /**
     * 导出订单主列表
     */
    @PreAuthorize("@ss.hasPermi('biz:master:export')")
    @Log(title = "订单主", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizOrderMaster bizOrderMaster) {
        List<BizOrderMaster> list = bizOrderMasterService.selectBizOrderMasterList(bizOrderMaster);
        ExcelUtil<BizOrderMaster> util = new ExcelUtil<BizOrderMaster>(BizOrderMaster.class);
        return util.exportExcel(list, "订单主数据");
    }

    /**
     * 获取订单主详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:master:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id) {
        return AjaxResult.success(bizOrderMasterService.selectBizOrderMasterById(id));
    }

    /**
     * 新增订单主
     */
    @PreAuthorize("@ss.hasPermi('biz:master:add')")
    @Log(title = "订单主", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizOrderMaster bizOrderMaster) {
        return toAjax(bizOrderMasterService.insertBizOrderMaster(bizOrderMaster));
    }

    /**
     * 通过文件新增订单主
     */
    @PreAuthorize("@ss.hasPermi('biz:master:add')")
    @Log(title = "订单主", businessType = BusinessType.INSERT)
    @PostMapping(value = "/addByXml")
    public AjaxResult addByXml(MultipartFile file, String type) {
        logger.info(type);
        StringBuilder resInfo = new StringBuilder();
        int orderCount= 0;
//        拼多多
        if ("1".equals(type)||"2".equals(type)) {
            CsvReader r = null;
            try {
                InputStream inputStream = file.getInputStream();
                InputStreamReader is = new InputStreamReader(inputStream);
                r = new CsvReader(is);
                //逐条读取记录，直至读完
                r.readHeaders();
                while (r.readRecord()) {
                    orderCount++;
                    BizOrderMaster bizOrderMaster = new BizOrderMaster();
                    boolean isNew = true;
                    logger.info("订单号:"+r.get("订单号"));
                    bizOrderMaster.setOrderSn(r.get("订单号"));
//                    检查更新
                    List<BizOrderMaster> orderMasterList = bizOrderMasterService.selectBizOrderMasterList(bizOrderMaster);
                    if (orderMasterList.size() == 1) {
                        bizOrderMaster = orderMasterList.get(0);
                        isNew = false;
                    }
                    //                    处理订单状态
                    switch (r.get("订单状态")) {
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
                        case "已签收，退款成功":
                            bizOrderMaster.setOrderStatus(8);
                            break;


                    }
//                    其他数据
                    bizOrderMaster.setCustomerId(Integer.parseInt(type));
                    bizOrderMaster.setPaymentMethod(1);
                    logger.info("商家实收金额:"+r.get("商家实收金额(元)"));
                    bizOrderMaster.setOrderMoney(BigDecimal.valueOf(Double.parseDouble(r.get("商家实收金额(元)"))));
                    logger.info(r.get("店铺优惠折扣(元)"));
                    bizOrderMaster.setDistrictMoney(BigDecimal.valueOf(Double.parseDouble(r.get("店铺优惠折扣(元)"))));
                    bizOrderMaster.setShippingMoney(BigDecimal.valueOf(0));
                    bizOrderMaster.setPaymentMoney(BigDecimal.valueOf(Double.parseDouble(r.get("商家实收金额(元)"))));
                    if (bizOrderMaster.getOrderStatus() > 4) {
                        logger.info(r.get("快递公司")+r.get("快递单号"));
                        bizOrderMaster.setShippingCompName(r.get("快递公司"));
                        bizOrderMaster.setShippingSn(r.get("快递单号"));
                    }
                    logger.info(r.get("商品数量(件)"));
                    if (Integer.parseInt(r.get("商品数量(件)").replaceAll("\t", "")) > 1) {
                        bizOrderMaster.setSplitShipment(1);
                    } else {
                        bizOrderMaster.setSplitShipment(0);
                    }
                    bizOrderMaster.setChannelName(type);
                    bizOrderMaster.setRemark(r.get("商家备注"));

                    bizOrderMaster.setChannelSn(r.get("订单号"));
                    logger.info(r.get("订单号"));
                    if(bizOrderMaster.getOrderStatus() != 2 &&bizOrderMaster.getOrderStatus() != 3){
                        if (r.get("支付时间") != null && !"\t".equals(r.get("支付时间"))) {
                            logger.info(r.get("支付时间"));
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                            bizOrderMaster.setCreateTime(sdf.parse(r.get("支付时间")));
                        }
                        //                    保存订单信息
                        if (isNew) {
                            bizOrderMasterService.insertBizOrderMaster(bizOrderMaster);
                        } else {
                            bizOrderMasterService.updateBizOrderMaster(bizOrderMaster);
                        }
                    }

                    if (isNew&&bizOrderMaster.getId()!=null) {

                        String productName = r.get("商家编码-SKU维度").replaceAll("\t", "");
                        logger.info(productName);
                        BizProductInfo productInfo = bizProductInfoService.selectBizProductInfoByCode(productName);

                        if (productInfo != null) {
                            BizOrderDetail bizOrderDetail = new BizOrderDetail();
                            bizOrderDetail.setOrderId(bizOrderMaster.getId());
                            bizOrderDetail.setProductId(productInfo.getId());
                            bizOrderDetail.setProductName(productInfo.getProductName());
                            bizOrderDetail.setProductCode(productInfo.getProductCode());
                            bizOrderDetail.setSupplierCode(productInfo.getSupplierCode());
                            bizOrderDetail.setProductCnt(Long.parseLong(r.get("商品数量(件)").replaceAll("\t", "")));
                            bizOrderDetail.setProductPrice(new BigDecimal(Double.parseDouble(r.get("商家实收金额(元)"))/Double.parseDouble(r.get("商品数量(件)"))));
                            bizOrderDetail.setModifiedTime(bizOrderMaster.getCreateTime());
                            bizOrderDetailService.insertBizOrderDetail(bizOrderDetail);
                        }else {
                            resInfo.append(productName).append("不在商品列表中\n");
                            logger.info(productName+"不在商品列表中");
                            orderCount--;
                            bizOrderMasterService.deleteBizOrderMasterById(bizOrderMaster.getId());
                        }
                    }
                }
                r.close();
                return success("成功："+orderCount+"单"+resInfo.toString());
            } catch (Exception e) {
                logger.info(e.getMessage());
                return error(e.getMessage());
            } finally {
                r.close();
            }
        }
        Boolean bool = ExcelUtil.checkFile(file);
        if (!bool) {
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
    public AjaxResult edit(@RequestBody BizOrderMaster bizOrderMaster) {
        return toAjax(bizOrderMasterService.updateBizOrderMaster(bizOrderMaster));
    }

    /**
     * 删除订单主
     */
    @PreAuthorize("@ss.hasPermi('biz:master:remove')")
    @Log(title = "订单主", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids) {
        return toAjax(bizOrderMasterService.deleteBizOrderMasterByIds(ids));
    }
}
