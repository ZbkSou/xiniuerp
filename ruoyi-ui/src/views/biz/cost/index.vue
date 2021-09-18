<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单商品ID" prop="productId">
        <el-input
          v-model="queryParams.productId"
          placeholder="请输入订单商品ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="产品分类ID" prop="categoryId">
        <el-input
          v-model="queryParams.categoryId"
          placeholder="请输入产品分类ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品编号" prop="productCode">
        <el-input
          v-model="queryParams.productCode"
          placeholder="请输入商品编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供货商编号" prop="supplierCode">
        <el-input
          v-model="queryParams.supplierCode"
          placeholder="请输入供货商编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否拆单" prop="splitShipment">
        <el-input
          v-model="queryParams.splitShipment"
          placeholder="请输入是否拆单"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="包装盒商品id" prop="boxId">
        <el-input
          v-model="queryParams.boxId"
          placeholder="请输入包装盒商品id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="包装盒数量" prop="boxCnt">
        <el-input
          v-model="queryParams.boxCnt"
          placeholder="请输入包装盒数量"
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
      <el-form-item label="打包人工成本需要单独支付" prop="packageCost">
        <el-input
          v-model="queryParams.packageCost"
          placeholder="请输入打包人工成本需要单独支付"
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
      <el-form-item label="单独支付给仓库快递费" prop="unpayDeliveryCost">
        <el-input
          v-model="queryParams.unpayDeliveryCost"
          placeholder="请输入单独支付给仓库快递费"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="统一结算快递费" prop="deliveryCost">
        <el-input
          v-model="queryParams.deliveryCost"
          placeholder="请输入统一结算快递费"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="最后修改时间" prop="modifiedTime">
        <el-date-picker clearable size="small"
          v-model="queryParams.modifiedTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择最后修改时间">
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
          v-hasPermi="['biz:cost:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['biz:cost:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['biz:cost:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportLoading"
          @click="handleExport"
          v-hasPermi="['biz:cost:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="costList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="发货成本表ID" align="center" prop="id" />
      <el-table-column label="订单商品ID" align="center" prop="productId" />
      <el-table-column label="产品分类ID" align="center" prop="categoryId" />
      <el-table-column label="商品编号" align="center" prop="productCode" />
      <el-table-column label="供货商编号" align="center" prop="supplierCode" />
      <el-table-column label="是否拆单" align="center" prop="splitShipment" />
      <el-table-column label="包装盒商品id" align="center" prop="boxId" />
      <el-table-column label="包装盒数量" align="center" prop="boxCnt" />
      <el-table-column label="额外包装成本" align="center" prop="extraPackageCost" />
      <el-table-column label="打包人工成本需要单独支付" align="center" prop="packageCost" />
      <el-table-column label="仓库ID" align="center" prop="wId" />
      <el-table-column label="单独支付给仓库快递费" align="center" prop="unpayDeliveryCost" />
      <el-table-column label="统一结算快递费" align="center" prop="deliveryCost" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="最后修改时间" align="center" prop="modifiedTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.modifiedTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['biz:cost:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:cost:remove']"
          >删除</el-button>
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

    <!-- 添加或修改发货成本对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单商品ID" prop="productId">
          <el-input v-model="form.productId" placeholder="请输入订单商品ID" />
        </el-form-item>
        <el-form-item label="产品分类ID" prop="categoryId">
          <el-input v-model="form.categoryId" placeholder="请输入产品分类ID" />
        </el-form-item>
        <el-form-item label="商品编号" prop="productCode">
          <el-input v-model="form.productCode" placeholder="请输入商品编号" />
        </el-form-item>
        <el-form-item label="供货商编号" prop="supplierCode">
          <el-input v-model="form.supplierCode" placeholder="请输入供货商编号" />
        </el-form-item>
        <el-form-item label="是否拆单" prop="splitShipment">
          <el-input v-model="form.splitShipment" placeholder="请输入是否拆单" />
        </el-form-item>
        <el-form-item label="包装盒商品id" prop="boxId">
          <el-input v-model="form.boxId" placeholder="请输入包装盒商品id" />
        </el-form-item>
        <el-form-item label="包装盒数量" prop="boxCnt">
          <el-input v-model="form.boxCnt" placeholder="请输入包装盒数量" />
        </el-form-item>
        <el-form-item label="额外包装成本" prop="extraPackageCost">
          <el-input v-model="form.extraPackageCost" placeholder="请输入额外包装成本" />
        </el-form-item>
        <el-form-item label="打包人工成本需要单独支付" prop="packageCost">
          <el-input v-model="form.packageCost" placeholder="请输入打包人工成本需要单独支付" />
        </el-form-item>
        <el-form-item label="仓库ID" prop="wId">
          <el-input v-model="form.wId" placeholder="请输入仓库ID" />
        </el-form-item>
        <el-form-item label="单独支付给仓库快递费" prop="unpayDeliveryCost">
          <el-input v-model="form.unpayDeliveryCost" placeholder="请输入单独支付给仓库快递费" />
        </el-form-item>
        <el-form-item label="统一结算快递费" prop="deliveryCost">
          <el-input v-model="form.deliveryCost" placeholder="请输入统一结算快递费" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="最后修改时间" prop="modifiedTime">
          <el-date-picker clearable size="small"
            v-model="form.modifiedTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择最后修改时间">
          </el-date-picker>
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
import { listCost, getCost, delCost, addCost, updateCost, exportCost } from "@/api/biz/cost";

export default {
  name: "Cost",
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
      // 发货成本表格数据
      costList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        productId: null,
        categoryId: null,
        productCode: null,
        supplierCode: null,
        splitShipment: null,
        boxId: null,
        boxCnt: null,
        extraPackageCost: null,
        packageCost: null,
        wId: null,
        unpayDeliveryCost: null,
        deliveryCost: null,
        modifiedTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        productCode: [
          { required: true, message: "商品编号不能为空", trigger: "blur" }
        ],
        supplierCode: [
          { required: true, message: "供货商编号不能为空", trigger: "blur" }
        ],
        splitShipment: [
          { required: true, message: "是否拆单不能为空", trigger: "blur" }
        ],
        boxId: [
          { required: true, message: "包装盒商品id不能为空", trigger: "blur" }
        ],
        boxCnt: [
          { required: true, message: "包装盒数量不能为空", trigger: "blur" }
        ],
        extraPackageCost: [
          { required: true, message: "额外包装成本不能为空", trigger: "blur" }
        ],
        packageCost: [
          { required: true, message: "打包人工成本需要单独支付不能为空", trigger: "blur" }
        ],
        wId: [
          { required: true, message: "仓库ID不能为空", trigger: "blur" }
        ],
        modifiedTime: [
          { required: true, message: "最后修改时间不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询发货成本列表 */
    getList() {
      this.loading = true;
      listCost(this.queryParams).then(response => {
        this.costList = response.rows;
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
        productId: null,
        categoryId: null,
        productCode: null,
        supplierCode: null,
        splitShipment: null,
        boxId: null,
        boxCnt: null,
        extraPackageCost: null,
        packageCost: null,
        wId: null,
        unpayDeliveryCost: null,
        deliveryCost: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        modifiedTime: null
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
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加发货成本";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCost(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改发货成本";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCost(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCost(this.form).then(response => {
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
      this.$confirm('是否确认删除发货成本编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delCost(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有发货成本数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(() => {
          this.exportLoading = true;
          return exportCost(queryParams);
        }).then(response => {
          this.download(response.msg);
          this.exportLoading = false;
        }).catch(() => {});
    }
  }
};
</script>
