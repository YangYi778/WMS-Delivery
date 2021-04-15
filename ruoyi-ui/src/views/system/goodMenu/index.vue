<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="库区编号" prop="storageNo">
        <el-input
          v-model="queryParams.storageNo"
          placeholder="请输入库区编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="库位编号" prop="shelfNo">
        <el-input
          v-model="queryParams.shelfNo"
          placeholder="请输入库位编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="波次号" prop="batchNo">
        <el-input
          v-model="queryParams.batchNo"
          placeholder="请输入波次号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单号" prop="orderNo">
        <el-input
          v-model="queryParams.orderNo"
          placeholder="请输入订单号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="任务单号" prop="taskNo">
        <el-input
          v-model="queryParams.taskNo"
          placeholder="请输入任务单号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品编码" prop="goodNo">
        <el-input
          v-model="queryParams.goodNo"
          placeholder="请输入商品编码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品名称" prop="goodName">
        <el-input
          v-model="queryParams.goodName"
          placeholder="请输入商品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品类型" prop="goodType">
        <el-select v-model="queryParams.goodType" placeholder="请选择商品类型" clearable size="small">
          <el-option
            v-for="dict in goodTypeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="库存类型" prop="inventoryType">
        <el-select v-model="queryParams.inventoryType" placeholder="请选择库存类型" clearable size="small">
          <el-option
            v-for="dict in inventoryTypeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="订单防重码" prop="uuid">
        <el-input
          v-model="queryParams.uuid"
          placeholder="请输入订单防重码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="失效日期" prop="expiryTime">-->
<!--        <el-date-picker clearable size="small"-->
<!--          v-model="queryParams.expiryTime"-->
<!--          type="date"-->
<!--          value-format="yyyy-MM-dd"-->
<!--          placeholder="选择失效日期">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
      <el-form-item label="有效日期范围" prop="timeRange">
        <el-date-picker type="daterange" v-model="form.timeRange" format="yyyy-MM-dd"
                        value-format="yyyy-MM-dd" :style="{width: '100%'}" start-placeholder="开始日期"
                        end-placeholder="结束日期" range-separator="至" clearable>
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
          v-hasPermi="['system:goodMenu:add']"
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
          v-hasPermi="['system:goodMenu:edit']"
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
          v-hasPermi="['system:goodMenu:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:goodMenu:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodMenuList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="id" align="center" prop="id" />-->
      <el-table-column label="id" align="center" type="index" width="50" />
      <el-table-column label="库区编号" align="center" prop="storageNo" />
      <el-table-column label="库位编号" align="center" prop="shelfNo" />
      <el-table-column label="波次号" align="center" prop="batchNo" />
      <el-table-column label="订单号" align="center" prop="orderNo" />
      <el-table-column label="商品编码" align="center" prop="goodNo" />
      <el-table-column label="商品名称" align="center" prop="goodName" />
      <el-table-column label="货架位置" align="center" prop="shelfPosition" />
      <el-table-column label="商品类型" align="center" prop="goodType" :formatter="goodTypeFormat" />
      <el-table-column label="库存总数" align="center" prop="inventoryNum" />
      <el-table-column label="残次数量" align="center" prop="defectNum" />
      <el-table-column label="冻结数量" align="center" prop="frozenNum" />
      <el-table-column label="库存类型" align="center" prop="inventoryType" :formatter="inventoryTypeFormat" />
      <el-table-column label="订单防重码" align="center" prop="uuid" />
      <el-table-column label="生产日期" align="center" prop="productTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.productTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="失效日期" align="center" prop="expiryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.expiryTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="任务单号" align="center" prop="taskNo" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:goodMenu:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:goodMenu:remove']"
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

    <!-- 添加或修改商品管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="库区编号" prop="storageNo">
          <el-input v-model="form.storageNo" placeholder="请输入库区编号" />
        </el-form-item>
        <el-form-item label="库位编号" prop="shelfNo">
          <el-input v-model="form.shelfNo" placeholder="请输入库位编号" />
        </el-form-item>
        <el-form-item label="波次号" prop="batchNo">
          <el-input v-model="form.batchNo" placeholder="请输入波次号" />
        </el-form-item>
        <el-form-item label="订单号" prop="orderNo">
          <el-input v-model="form.orderNo" placeholder="请输入订单号" />
        </el-form-item>
        <el-form-item label="商品编码" prop="goodNo">
          <el-input v-model="form.goodNo" placeholder="请输入商品编码" />
        </el-form-item>
        <el-form-item label="商品名称" prop="goodName">
          <el-input v-model="form.goodName" placeholder="请输入商品名称" />
        </el-form-item>
        <el-form-item label="货架位置" prop="shelfPosition">
          <el-input v-model="form.shelfPosition" placeholder="请输入货架位置" />
        </el-form-item>
        <el-form-item label="商品类型" prop="goodType">
          <el-select v-model="form.goodType" placeholder="请选择商品类型">
            <el-option
              v-for="dict in goodTypeOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="库存总数" prop="inventoryNum">
          <el-input v-model="form.inventoryNum" placeholder="请输入库存总数" />
        </el-form-item>
        <el-form-item label="残次数量" prop="defectNum">
          <el-input v-model="form.defectNum" placeholder="请输入残次数量" />
        </el-form-item>
        <el-form-item label="冻结数量" prop="frozenNum">
          <el-input v-model="form.frozenNum" placeholder="请输入冻结数量" />
        </el-form-item>
        <el-form-item label="库存类型" prop="inventoryType">
          <el-select v-model="form.inventoryType" placeholder="请选择库存类型">
            <el-option
              v-for="dict in inventoryTypeOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="订单防重码" prop="uuid">
          <el-input v-model="form.uuid" placeholder="请输入订单防重码" />
        </el-form-item>
        <el-form-item label="生产日期" prop="productTime">
          <el-date-picker clearable size="small"
            v-model="form.productTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择生产日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="失效日期" prop="expiryTime">
          <el-date-picker clearable size="small"
            v-model="form.expiryTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择失效日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="任务单号" prop="taskNo">
          <el-input v-model="form.taskNo" placeholder="请输入任务单号" />
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
import { listGoodMenu, getGoodMenu, delGoodMenu, addGoodMenu, updateGoodMenu, exportGoodMenu } from "@/api/system/goodMenu";

export default {
  name: "GoodMenu",
  components: {
  },
  data() {
    return {
      // 遮罩层
      loading: true,
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
      // 商品管理表格数据
      goodMenuList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 商品类型字典
      goodTypeOptions: [],
      // 库存类型字典
      inventoryTypeOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        storageNo: null,
        shelfNo: null,
        batchNo: null,
        orderNo: null,
        goodNo: null,
        goodName: null,
        goodType: null,
        inventoryType: null,
        uuid: null,
        expiryTime: null,
        timeRange: null,
        taskNo: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        storageNo: [
          { required: true, message: "库区编号不能为空", trigger: "blur" }
        ],
        shelfNo: [
          { required: true, message: "库位编号不能为空", trigger: "blur" }
        ],
        batchNo: [
          { required: true, message: "波次号不能为空", trigger: "blur" }
        ],
        orderNo: [
          { required: true, message: "订单号不能为空", trigger: "blur" }
        ],
        goodNo: [
          { required: true, message: "商品编码不能为空", trigger: "blur" }
        ],
        goodName: [
          { required: true, message: "商品名称不能为空", trigger: "blur" }
        ],
        shelfPosition: [
          { required: true, message: "货架位置不能为空", trigger: "blur" }
        ],
        goodType: [
          { required: true, message: "商品类型不能为空", trigger: "change" }
        ],
        inventoryType: [
          { required: true, message: "库存类型不能为空", trigger: "change" }
        ],
        uuid: [
          { required: true, message: "订单防重码不能为空", trigger: "blur" }
        ],
        expiryTime: [
          { required: true, message: "失效日期不能为空", trigger: "blur" }
        ],
        taskNo: [
          { required: true, message: "任务单号不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getDicts("good_type").then(response => {
      this.goodTypeOptions = response.data;
    });
    this.getDicts("storage_type").then(response => {
      this.inventoryTypeOptions = response.data;
    });
  },
  methods: {
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      listGoodMenu(this.queryParams).then(response => {
        this.goodMenuList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 商品类型字典翻译
    goodTypeFormat(row, column) {
      return this.selectDictLabel(this.goodTypeOptions, row.goodType);
    },
    // 库存类型字典翻译
    inventoryTypeFormat(row, column) {
      return this.selectDictLabel(this.inventoryTypeOptions, row.inventoryType);
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
        storageNo: null,
        shelfNo: null,
        batchNo: null,
        orderNo: null,
        goodNo: null,
        goodName: null,
        shelfPosition: null,
        goodType: null,
        inventoryNum: null,
        defectNum: null,
        frozenNum: null,
        inventoryType: null,
        uuid: null,
        productTime: null,
        expiryTime: null,
        createTime: null,
        createUser: null,
        updateTime: null,
        updateUser: null,
        yn: null,
        ts: null,
        taskNo: null
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
      this.title = "添加商品管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getGoodMenu(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改商品管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateGoodMenu(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGoodMenu(this.form).then(response => {
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
      this.$confirm('是否确认删除商品管理编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delGoodMenu(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有商品管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportGoodMenu(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
