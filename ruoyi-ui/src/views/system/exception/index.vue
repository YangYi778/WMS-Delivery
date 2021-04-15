<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="异常代码" prop="exceptionCode">
        <el-input
          v-model="queryParams.exceptionCode"
          placeholder="请输入异常代码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="异常批次" prop="exceptionBatch">
        <el-input
          v-model="queryParams.exceptionBatch"
          placeholder="请输入异常批次"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="异常订单号" prop="exceptionOrder">
        <el-input
          v-model="queryParams.exceptionOrder"
          placeholder="请输入异常订单号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="异常任务号" prop="exceptionTask">
        <el-input
          v-model="queryParams.exceptionTask"
          placeholder="请输入异常任务号"
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
          v-hasPermi="['system:exception:add']"
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
          v-hasPermi="['system:exception:edit']"
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
          v-hasPermi="['system:exception:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:exception:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="exceptionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="自增主键" align="center" prop="id" />
      <el-table-column label="异常代码" align="center" prop="exceptionCode" />
      <el-table-column label="异常批次" align="center" prop="exceptionBatch" />
      <el-table-column label="异常订单号" align="center" prop="exceptionOrder" />
      <el-table-column label="异常任务号" align="center" prop="exceptionTask" />
      <el-table-column label="异常信息" align="center" prop="remark" />
      <el-table-column label="处理方法" align="center" prop="processMethod" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="修改时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:exception:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:exception:remove']"
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

    <!-- 添加或修改异常信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="异常代码" prop="exceptionCode">
          <el-input v-model="form.exceptionCode" placeholder="请输入异常代码" />
        </el-form-item>
        <el-form-item label="异常批次" prop="exceptionBatch">
          <el-input v-model="form.exceptionBatch" placeholder="请输入异常批次" />
        </el-form-item>
        <el-form-item label="异常订单号" prop="exceptionOrder">
          <el-input v-model="form.exceptionOrder" placeholder="请输入异常订单号" />
        </el-form-item>
        <el-form-item label="异常任务号" prop="exceptionTask">
          <el-input v-model="form.exceptionTask" placeholder="请输入异常任务号" />
        </el-form-item>
        <el-form-item label="异常信息" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入异常信息" />
        </el-form-item>
        <el-form-item label="处理方法" prop="processMethod">
          <el-input v-model="form.processMethod" placeholder="请输入处理方法" />
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
import { listException, getException, delException, addException, updateException, exportException } from "@/api/system/exception";

export default {
  name: "Exception",
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
      // 异常信息表格数据
      exceptionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        exceptionCode: null,
        exceptionBatch: null,
        exceptionOrder: null,
        exceptionTask: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        exceptionCode: [
          { required: true, message: "异常代码不能为空", trigger: "blur" }
        ],
        exceptionBatch: [
          { required: true, message: "异常批次不能为空", trigger: "blur" }
        ],
        exceptionOrder: [
          { required: true, message: "异常订单号不能为空", trigger: "blur" }
        ],
        exceptionTask: [
          { required: true, message: "异常任务号不能为空", trigger: "blur" }
        ],
        remark: [
          { required: true, message: "异常信息不能为空", trigger: "blur" }
        ],
        processMethod: [
          { required: true, message: "处理方法不能为空", trigger: "blur" }
        ],
        yn: [
          { required: true, message: "删除标记位不能为空", trigger: "blur" }
        ],
        ts: [
          { required: true, message: "时间戳不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询异常信息列表 */
    getList() {
      this.loading = true;
      listException(this.queryParams).then(response => {
        this.exceptionList = response.rows;
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
        exceptionCode: null,
        exceptionBatch: null,
        exceptionOrder: null,
        exceptionTask: null,
        remark: null,
        processMethod: null,
        createTime: null,
        createUser: null,
        updateTime: null,
        updateUser: null,
        yn: null,
        ts: null
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
      this.title = "添加异常信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getException(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改异常信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateException(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addException(this.form).then(response => {
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
      this.$confirm('是否确认删除异常信息编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delException(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有异常信息数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportException(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
