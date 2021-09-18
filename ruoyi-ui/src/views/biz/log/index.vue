<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单ID" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入订单ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="包装盒使用记录" prop="boxJson">
        <el-input
          v-model="queryParams.boxJson"
          placeholder="请输入包装盒使用记录"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否拆单0否1是" prop="splitShipment">
        <el-input
          v-model="queryParams.splitShipment"
          placeholder="请输入是否拆单0否1是"
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
      <el-form-item label="人工成本需要单独支付" prop="packageCost">
        <el-input
          v-model="queryParams.packageCost"
          placeholder="请输入人工成本需要单独支付"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单独支付快递成本" prop="deliveryCost">
        <el-input
          v-model="queryParams.deliveryCost"
          placeholder="请输入单独支付快递成本"
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
      <el-form-item label="是否结清包装人工0否1是" prop="payExtraPackage">
        <el-input
          v-model="queryParams.payExtraPackage"
          placeholder="请输入是否结清包装人工0否1是"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否结清快递0否1是" prop="payExtraDelivery">
        <el-input
          v-model="queryParams.payExtraDelivery"
          placeholder="请输入是否结清快递0否1是"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['biz:log:add']"
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
          v-hasPermi="['biz:log:edit']"
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
          v-hasPermi="['biz:log:remove']"
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
          v-hasPermi="['biz:log:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="logList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="发货记录表ID" align="center" prop="id" />
      <el-table-column label="订单ID" align="center" prop="orderId" />
      <el-table-column label="订单快照" align="center" prop="orderCache" />
      <el-table-column label="包装盒使用记录" align="center" prop="boxJson" />
      <el-table-column label="是否拆单0否1是" align="center" prop="splitShipment" />
      <el-table-column label="额外包装成本" align="center" prop="extraPackageCost" />
      <el-table-column label="人工成本需要单独支付" align="center" prop="packageCost" />
      <el-table-column label="单独支付快递成本" align="center" prop="deliveryCost" />
      <el-table-column label="仓库ID" align="center" prop="wId" />
      <el-table-column label="是否结清包装人工0否1是" align="center" prop="payExtraPackage" />
      <el-table-column label="是否结清快递0否1是" align="center" prop="payExtraDelivery" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['biz:log:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:log:remove']"
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

    <!-- 添加或修改发货记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单ID" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入订单ID" />
        </el-form-item>
        <el-form-item label="订单快照" prop="orderCache">
          <el-input v-model="form.orderCache" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="包装盒使用记录" prop="boxJson">
          <el-input v-model="form.boxJson" placeholder="请输入包装盒使用记录" />
        </el-form-item>
        <el-form-item label="是否拆单0否1是" prop="splitShipment">
          <el-input v-model="form.splitShipment" placeholder="请输入是否拆单0否1是" />
        </el-form-item>
        <el-form-item label="额外包装成本" prop="extraPackageCost">
          <el-input v-model="form.extraPackageCost" placeholder="请输入额外包装成本" />
        </el-form-item>
        <el-form-item label="人工成本需要单独支付" prop="packageCost">
          <el-input v-model="form.packageCost" placeholder="请输入人工成本需要单独支付" />
        </el-form-item>
        <el-form-item label="单独支付快递成本" prop="deliveryCost">
          <el-input v-model="form.deliveryCost" placeholder="请输入单独支付快递成本" />
        </el-form-item>
        <el-form-item label="仓库ID" prop="wId">
          <el-input v-model="form.wId" placeholder="请输入仓库ID" />
        </el-form-item>
        <el-form-item label="是否结清包装人工0否1是" prop="payExtraPackage">
          <el-input v-model="form.payExtraPackage" placeholder="请输入是否结清包装人工0否1是" />
        </el-form-item>
        <el-form-item label="是否结清快递0否1是" prop="payExtraDelivery">
          <el-input v-model="form.payExtraDelivery" placeholder="请输入是否结清快递0否1是" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
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
import { listLog, getLog, delLog, addLog, updateLog, exportLog } from "@/api/biz/log";

export default {
  name: "Log",
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
      // 发货记录表格数据
      logList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderId: null,
        orderCache: null,
        boxJson: null,
        splitShipment: null,
        extraPackageCost: null,
        packageCost: null,
        deliveryCost: null,
        wId: null,
        payExtraPackage: null,
        payExtraDelivery: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        splitShipment: [
          { required: true, message: "是否拆单0否1是不能为空", trigger: "blur" }
        ],
        extraPackageCost: [
          { required: true, message: "额外包装成本不能为空", trigger: "blur" }
        ],
        packageCost: [
          { required: true, message: "人工成本需要单独支付不能为空", trigger: "blur" }
        ],
        deliveryCost: [
          { required: true, message: "单独支付快递成本不能为空", trigger: "blur" }
        ],
        wId: [
          { required: true, message: "仓库ID不能为空", trigger: "blur" }
        ],
        payExtraPackage: [
          { required: true, message: "是否结清包装人工0否1是不能为空", trigger: "blur" }
        ],
        payExtraDelivery: [
          { required: true, message: "是否结清快递0否1是不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询发货记录列表 */
    getList() {
      this.loading = true;
      listLog(this.queryParams).then(response => {
        this.logList = response.rows;
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
        orderId: null,
        orderCache: null,
        boxJson: null,
        splitShipment: null,
        extraPackageCost: null,
        packageCost: null,
        deliveryCost: null,
        wId: null,
        payExtraPackage: null,
        payExtraDelivery: null,
        updateBy: null,
        updateTime: null,
        remark: null
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
      this.title = "添加发货记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getLog(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改发货记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateLog(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addLog(this.form).then(response => {
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
      this.$confirm('是否确认删除发货记录编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delLog(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有发货记录数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(() => {
          this.exportLoading = true;
          return exportLog(queryParams);
        }).then(response => {
          this.download(response.msg);
          this.exportLoading = false;
        }).catch(() => {});
    }
  }
};
</script>
