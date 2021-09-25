<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="商品编码" prop="productCode">
        <el-input
          v-model="queryParams.productCode"
          placeholder="请输入商品编码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品名称" prop="productName">
        <el-input
          v-model="queryParams.productName"
          placeholder="请输入商品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="国条码" prop="barCode">
        <el-input
          v-model="queryParams.barCode"
          placeholder="请输入国条码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="一级分类ID" prop="oneCategoryId">
        <el-input
          v-model="queryParams.oneCategoryId"
          placeholder="请输入一级分类ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="二级分类ID" prop="twoCategoryId">
        <el-input
          v-model="queryParams.twoCategoryId"
          placeholder="请输入二级分类ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="三级分类ID" prop="threeCategoryId">
        <el-input
          v-model="queryParams.threeCategoryId"
          placeholder="请输入三级分类ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供应商ID" prop="supplierId">
        <el-input
          v-model="queryParams.supplierId"
          placeholder="请输入商品的供应商ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供应商编码" prop="supplierCode">
        <el-input
          v-model="queryParams.supplierCode"
          placeholder="请输入供应商编码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="上下架状态：" prop="publishStatus">
        <el-select v-model="queryParams.publishStatus" placeholder="请选择上下架状态：0下架1上架" clearable size="small">
          <el-option
            v-for="dict in publishStatusOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审核状态：" prop="auditStatus">
        <el-select v-model="queryParams.auditStatus" placeholder="请选择审核状态：0未审核，1已审核" clearable size="small">
          <el-option
            v-for="dict in auditStatusOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="商品默认出厂成本" prop="defaultCost">
        <el-input
          v-model="queryParams.defaultCost"
          placeholder="请输入商品默认进货成本"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品有效期" prop="shelfLife">
        <el-input
          v-model="queryParams.shelfLife"
          placeholder="请输入商品有效期"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="拥有多型号：" prop="manyModels">
        <el-select v-model="queryParams.auditStatus" placeholder="请选择审核状态：" clearable size="small">
          <el-option
            v-for="dict in manyModelsOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="商品录入时间" prop="indate">
        <el-date-picker clearable size="small"
          v-model="queryParams.indate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择商品录入时间">
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
          v-hasPermi="['biz:info:add']"
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
          v-hasPermi="['biz:info:edit']"
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
          v-hasPermi="['biz:info:remove']"
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
          v-hasPermi="['biz:info:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="infoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="商品ID" align="center" prop="id" />
      <el-table-column label="商品编码" align="center" prop="productCode" />
      <el-table-column label="商品名称" align="center" prop="productName" />
<!--      <el-table-column label="国条码" align="center" prop="barCode" />-->
      <el-table-column label="一级分类" align="center" prop="oneCategoryId" />
<!--      <el-table-column label="二级分类" align="center" prop="twoCategoryId" />-->
<!--      <el-table-column label="三级分类" align="center" prop="threeCategoryId" />-->
      <el-table-column label="供应商ID" align="center" prop="supplierId" />
      <el-table-column label="供应商" align="center" prop="supplierCode" />
      <el-table-column label="上下架：" align="center" prop="publishStatus" >
        <template slot-scope="scope">
          <dict-tag :options="publishStatusOptions" :value="scope.row.publishStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="审核：" align="center" prop="auditStatus" >
        <template slot-scope="scope">
          <dict-tag :options="auditStatusOptions" :value="scope.row.auditStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="重量" align="center" prop="weight" />
      <el-table-column label="长度" align="center" prop="length" />
      <el-table-column label="高度" align="center" prop="height" />
      <el-table-column label="宽度" align="center" prop="width" />
      <el-table-column label="产品型号" align="center" prop="productModels" />
      <el-table-column label="商品进价" align="center" prop="defaultCost" />
<!--      <el-table-column label="有效期" align="center" prop="shelfLife" />-->
<!--      <el-table-column label="描述" align="center" prop="descript" />-->
<!--      <el-table-column label="提醒" align="center" prop="remind" />-->
      <el-table-column label="拥有多型号：" align="center" prop="manyModels" >
        <template slot-scope="scope">
          <dict-tag :options="manyModelsOptions" :value="scope.row.manyModels"/>
        </template>
      </el-table-column>
      <el-table-column label="录入时间" align="center" prop="indate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.indate) }}</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['biz:info:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:info:remove']"
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

    <!-- 添加或修改商品信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="商品编码" prop="productCode">
          <el-input v-model="form.productCode" placeholder="请输入商品编码" />
        </el-form-item>
        <el-form-item label="商品名称" prop="productName">
          <el-input v-model="form.productName" placeholder="请输入商品名称" />
        </el-form-item>
        <el-form-item label="国条码" prop="barCode">
          <el-input v-model="form.barCode" placeholder="请输入国条码" />
        </el-form-item>
        <el-form-item label="一级分类ID" prop="oneCategoryId">
          <el-input v-model="form.oneCategoryId" placeholder="请输入一级分类ID" />
        </el-form-item>
        <el-form-item label="二级分类ID" prop="twoCategoryId">
          <el-input v-model="form.twoCategoryId" placeholder="请输入二级分类ID" />
        </el-form-item>
        <el-form-item label="三级分类ID" prop="threeCategoryId">
          <el-input v-model="form.threeCategoryId" placeholder="请输入三级分类ID" />
        </el-form-item>
        <el-form-item label="商品的供应商ID" prop="supplierId">
          <el-input v-model="form.supplierId" placeholder="请输入商品的供应商ID" />
        </el-form-item>
        <el-form-item label="供应商编码" prop="supplierCode">
          <el-input v-model="form.supplierCode" placeholder="请输入供应商编码" />
        </el-form-item>
        <el-form-item label="上下架：" prop="publishStatus">
          <el-radio-group v-model="form.publishStatus">
            <el-radio
              v-for="dict in publishStatusOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
            >{{dict.dictLabel}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="审核：" prop="auditStatus">
          <el-radio-group v-model="form.auditStatus">
            <el-radio
              v-for="dict in auditStatusOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
            >{{dict.dictLabel}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="重量" prop="weight">
          <el-input type="number" step = "0.1" v-model="form.weight" placeholder="请输入商品重量" />
        </el-form-item>
        <el-form-item label="长度" prop="length">
          <el-input type="number" step = "0.1" v-model="form.length" placeholder="请输入商品长度" />
        </el-form-item>
        <el-form-item label="高度" prop="height">
          <el-input type="number" step = "0.1" v-model="form.height" placeholder="请输入商品高度" />
        </el-form-item>
        <el-form-item label="宽度" prop="width">
          <el-input type="number" step = "0.1" v-model="form.width" placeholder="请输入商品宽度" />
        </el-form-item>
        <el-form-item label="产品型号" prop="productModels">
          <el-input v-model="form.productModels" placeholder="请输入产品型号" />
        </el-form-item>
        <el-form-item label="进价" prop="defaultCost">
          <el-input type="number" v-model="form.defaultCost" placeholder="请输入商品默认出厂成本" />
        </el-form-item>
        <el-form-item label="有效期" prop="shelfLife">
          <el-input v-model="form.shelfLife" placeholder="请输入商品有效期" />
        </el-form-item>
        <el-form-item label="描述" prop="descript">
          <el-input v-model="form.descript" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="提醒" prop="remind">
          <el-input v-model="form.remind" placeholder="请输入商品提醒" />
        </el-form-item>
        <el-form-item label="拥有多型号：" prop="manyModels">
          <el-radio-group v-model="form.manyModels">
            <el-radio
              v-for="dict in manyModelsOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
            >{{dict.dictLabel}}</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
<!--        <el-form-item label="备注2" prop="remark2">-->
<!--          <el-input v-model="form.remark2" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="备注3" prop="remark3">-->
<!--          <el-input v-model="form.remark3" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listInfo, getInfo, delInfo, addInfo, updateInfo, exportInfo } from "@/api/biz/info";

export default {
  name: "Info",
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
      // 商品信息表格数据
      infoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      //上架状态数据字典
      publishStatusOptions:[],
      //审核状态字典
      auditStatusOptions:[],
      //是否多型号
      manyModelsOptions:[],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        productCode: null,
        productName: null,
        barCode: null,
        oneCategoryId: null,
        twoCategoryId: null,
        threeCategoryId: null,
        supplierId: null,
        supplierCode: null,
        publishStatus: null,
        auditStatus: null,
        weight: null,
        length: null,
        height: null,
        width: null,
        productModels: null,
        defaultCost: null,
        shelfLife: null,
        descript: null,
        remind: null,
        manyModels: null,
        indate: null,
        remark2: null,
        remark3: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        productCode: [
          { required: true, message: "商品编码不能为空", trigger: "blur" }
        ],
        productName: [
          { required: true, message: "商品名称不能为空", trigger: "blur" }
        ],
        // barCode: [
        //   { required: true, message: "国条码不能为空", trigger: "blur" }
        // ],
        oneCategoryId: [
          { required: true, message: "一级分类ID不能为空", trigger: "blur" }
        ],
        // twoCategoryId: [
        //   { required: true, message: "二级分类ID不能为空", trigger: "blur" }
        // ],
        // threeCategoryId: [
        //   { required: true, message: "三级分类ID不能为空", trigger: "blur" }
        // ],
        supplierId: [
          { required: true, message: "商品的供应商ID不能为空", trigger: "blur" }
        ],
        supplierCode: [
          { required: true, message: "供应商编码不能为空", trigger: "blur" }
        ],
        publishStatus: [
          { required: true, message: "上下架状态：0下架1上架不能为空", trigger: "blur" }
        ],
        auditStatus: [
          { required: true, message: "审核状态：0未审核，1已审核不能为空", trigger: "blur" }
        ],
        productModels: [
          { required: true, message: "产品型号不能为空", trigger: "blur" }
        ],
        defaultCost: [
          { required: true, message: "商品进货价不能为空", trigger: "blur" }
        ],
        shelfLife: [
          { required: false, message: "商品有效期不能为空", trigger: "blur" }
        ],
        descript: [
          { required: false, message: "商品描述不能为空", trigger: "blur" }
        ],
        remind: [
          { required: false, message: "商品提醒不能为空", trigger: "blur" }
        ],
        manyModels: [
          { required: true, message: "拥有多型号：0否1是不能为空", trigger: "blur" }
        ],
        // indate: [
        //   { required: true, message: "商品录入时间不能为空", trigger: "blur" }
        // ],
        // remark: [
        //   { required: true, message: "备注不能为空", trigger: "blur" }
        // ],
        // remark2: [
        //   { required: true, message: "备注2不能为空", trigger: "blur" }
        // ],
        // remark3: [
        //   { required: true, message: "备注3不能为空", trigger: "blur" }
        // ]
      }
    };
  },
  created() {
    this.getList();

    this.getDicts("biz_product_model").then(response => {
      this.manyModelsOptions = response.data;
    });
    this.getDicts("biz_product_audit").then(response => {
      this.auditStatusOptions = response.data;
    });
    this.getDicts("biz_product_publish").then(response => {
      this.publishStatusOptions = response.data;
    });
  },
  methods: {
    /** 查询商品信息列表 */
    getList() {
      this.loading = true;
      listInfo(this.queryParams).then(response => {
        this.infoList = response.rows;
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
        productCode: null,
        productName: null,
        barCode: null,
        oneCategoryId: null,
        twoCategoryId: null,
        threeCategoryId: null,
        supplierId: null,
        supplierCode: null,
        publishStatus: 0,
        auditStatus: 0,
        weight: null,
        length: null,
        height: null,
        width: null,
        productModels: null,
        defaultCost: null,
        shelfLife: null,
        descript: null,
        remind: null,
        manyModels: null,
        indate: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        remark2: null,
        remark3: null
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
      this.title = "添加商品信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getInfo(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改商品信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateInfo(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInfo(this.form).then(response => {
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
      this.$confirm('是否确认删除商品信息编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delInfo(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有商品信息数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(() => {
          this.exportLoading = true;
          return exportInfo(queryParams);
        }).then(response => {
          this.download(response.msg);
          this.exportLoading = false;
        }).catch(() => {});
    }
  }
};
</script>
