<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="货物总价" prop="totalGoodsPice">
        <el-input
          v-model="queryParams.totalGoodsPice"
          placeholder="请输入货物总价"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="额外包装成本" prop="extraPackageCost">
        <el-input
          v-model="queryParams.extraPackageCost"
          placeholder="请输入额外包装成本"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="运输成本" prop="deliveryCost">
        <el-input
          v-model="queryParams.deliveryCost"
          placeholder="请输入运输成本"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="仓库ID" prop="wId">
        <el-input
          v-model="queryParams.wId"
          placeholder="请输入仓库ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付" prop="pay">
        <el-select v-model="queryParams.pay" placeholder="请选择支付状态：" clearable size="small">
          <el-option
            v-for="dict in payOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="进货时间" prop="purchasingTime">
        <el-date-picker clearable size="small"
                        v-model="queryParams.purchasingTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="选择进货时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结算时间" prop="payTime">
        <el-date-picker clearable size="small"
                        v-model="queryParams.payTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="选择结算时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="进仓时间" prop="enterTime">
        <el-date-picker clearable size="small"
                        v-model="queryParams.enterTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="选择进仓时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['biz:purchasing:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['biz:purchasing:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['biz:purchasing:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportLoading"
          @click="handleExport"
          v-hasPermi="['biz:purchasing:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="purchasingList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="进货表ID" align="center" prop="id"/>
      <el-table-column label="货物总价" align="center" prop="totalGoodsPice"/>
      <el-table-column label="额外包装成本" align="center" prop="extraPackageCost"/>
      <el-table-column label="运输成本" align="center" prop="deliveryCost"/>
      <el-table-column label="仓库ID" align="center" prop="wId"/>
      <el-table-column label="支付" align="center" prop="pay">
        <template slot-scope="scope">
          <dict-tag :options="payOptions" :value="scope.row.pay"/>
        </template>
      </el-table-column>
      <el-table-column label="进货时间" align="center" prop="purchasingTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.purchasingTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结算时间" align="center" prop="payTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.payTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="进仓时间" align="center" prop="enterTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.enterTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>

      <el-table-column label="备注" align="center" prop="remark"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['biz:purchasing:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:purchasing:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改进货对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" :inline="true" label-width="100px">
        <el-form-item label="供应商ID" prop="supplierId">
          <el-input v-model="form.supplierId" placeholder="请输入供货商"  size="small"/>
        </el-form-item>

        <el-form-item label="仓库ID" prop="wId">
          <el-input v-model="form.wId" placeholder="请输入仓库ID" clearable size="small"/>
        </el-form-item>
        <el-form-item label="额外包装成本" prop="extraPackageCost">
          <el-input v-model="form.extraPackageCost" placeholder="请输入额外包装成本" clearable size="small"/>
        </el-form-item>
        <el-form-item label="运输成本" prop="deliveryCost">
          <el-input v-model="form.deliveryCost" placeholder="请输入运输成本" clearable size="small"/>
        </el-form-item>

        <el-form-item label="进货时间" prop="purchasingTime">
          <el-date-picker clearable size="small"
                          v-model="form.purchasingTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="选择进货时间">
          </el-date-picker>
        </el-form-item>
<!--        <el-form-item label="结算时间" prop="payTime">-->
<!--          <el-date-picker clearable size="small"-->
<!--                          v-model="form.payTime"-->
<!--                          type="date"-->
<!--                          value-format="yyyy-MM-dd"-->
<!--                          placeholder="选择结算时间">-->
<!--          </el-date-picker>-->
<!--        </el-form-item>-->
        <el-form-item label="进仓时间" prop="enterTime">
          <el-date-picker clearable size="small"
                          v-model="form.enterTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="选择进仓时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注"/>
        </el-form-item>
        <el-form-item label="支付：" prop="pay">
          <el-radio-group v-model="form.pay">
            <el-radio
              v-for="dict in payOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
            >{{dict.dictLabel}}</el-radio>
          </el-radio-group>
        </el-form-item>

        <!--   进货详情-->
        <el-form-item label="进货详情" style="margin-bottom:0px;">
          <template>
            <el-button @click="addDetail" type="primary">+ 添加</el-button>
            <div v-for="(item,index) in form.detailList" class="performanceNameList">
              <div class="item-piece">
                <div ref="items" style="display: flex;flex-direction:row;">
<!--                  <el-form-item label="供应商编码" prop="supplierCode" >-->
<!--                    <el-input v-model="item.supplierCode" placeholder="请输入供应商编码" size="small"/>-->
<!--                  </el-form-item>-->
                  <el-form-item label="商品编码" prop="productCode">
                    <el-input v-model="item.productCode" placeholder="请输入商品编码" size="small"/>
                  </el-form-item>
                  <el-form-item label="名称" prop="productName">
                    <el-input v-model="item.productName" placeholder="请输入商品名称"size="small"/>
                  </el-form-item>
                  <el-form-item label="型号id" prop="productModelsId">
                    <el-input v-model="item.productModelsId" placeholder="请输入商品型号id"size="small"/>
                  </el-form-item>
                  <el-form-item label="数量" prop="count">
                    <el-input v-model="item.count" placeholder="请输入数量"size="small"/>
                  </el-form-item>
                  <el-form-item label="单价" prop="pice">
                    <el-input v-model="item.pice" placeholder="请输入单价"size="small"/>
                  </el-form-item>

                  <el-form-item label="备注" prop="remark">
                    <el-input v-model="item.remark" placeholder="请输入备注"size="small"/>
                  </el-form-item>
                </div>
                <el-button @click="deleteDetail(index)">删除</el-button>
              </div>
            </div>
          </template>
        </el-form-item>


      </el-form>


      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listPurchasing,
  getPurchasing,
  delPurchasing,
  addPurchasing,
  updatePurchasing,
  exportPurchasing
} from "@/api/biz/purchasing";

export default {
  name: "Purchasing",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 进货表格数据
      purchasingList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      //是否支付
      payOptions:[],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        totalGoodsPice: null,
        extraPackageCost: null,
        deliveryCost: null,
        wId: null,
        purchasingTime: null,
        payTime: null,
        enterTime: null,
      },
      // 表单参数
      form: {
        detailList: []
      },
      // 表单校验
      rules: {
        totalGoodsPice: [
          {required: false, message: "货物总价不能为空", trigger: "blur"}
        ],
        supplierId: [
          {required: true, message: "供货商不能为空", trigger: "blur"}
        ],
        extraPackageCost: [
          {required: false, message: "包装成本不能为空", trigger: "blur"}
        ],
        deliveryCost: [
          {required: false, message: "运输成本不能为空", trigger: "blur"}
        ],
        wId: [
          {required: true, message: "仓库ID不能为空", trigger: "blur"}
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getDicts("biz_purchasing_pay").then(response => {
      this.payOptions = response.data;
    });

  },
  methods: {
    /** 查询进货列表 */
    getList() {
      this.loading = true;
      listPurchasing(this.queryParams).then(response => {
        this.purchasingList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        totalGoodsPice: null,
        extraPackageCost: null,
        deliveryCost: null,
        wId: null,
        purchasingTime: null,
        payTime: null,
        enterTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        detailList: []
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加进货";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPurchasing(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改进货";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePurchasing(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPurchasing(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认删除进货编号为"' + ids + '"的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function () {
        return delPurchasing(ids);
      }).then(() => {
        this.getList();
        this.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有进货数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.exportLoading = true;
        return exportPurchasing(queryParams);
      }).then(response => {
        this.download(response.msg);
        this.exportLoading = false;
      }).catch(() => {
      });
    },

    //添加进货详情
    addDetail() {
      var jsn={}
      this.form.detailList.push(jsn)
    },
//删除进货详情
    deleteDetail(index) {
      this.form.detailList.splice(index, 1);
    },
  }
};
</script>
