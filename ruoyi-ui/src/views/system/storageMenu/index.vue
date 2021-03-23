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
      <el-form-item label="库区名称" prop="storageName">
        <el-input
          v-model="queryParams.storageName"
          placeholder="请输入库区名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="库区类型" prop="storageType">
        <el-select v-model="queryParams.storageType" placeholder="请选择库区类型" clearable size="small">
          <el-option
            v-for="dict in storageTypeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="库区状态" prop="storageStatus">
        <el-select v-model="queryParams.storageStatus" placeholder="请选择库区状态" clearable size="small">
          <el-option
            v-for="dict in storageStatusOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
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
          v-hasPermi="['system:storageMenu:add']"
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
          v-hasPermi="['system:storageMenu:edit']"
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
          v-hasPermi="['system:storageMenu:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:storageMenu:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="storageMenuList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="自增id" align="center" prop="id" />-->
      <el-table-column label="id" align="center" type="index" width="50" />
      <el-table-column label="库区编号" align="center" prop="storageNo" />
      <el-table-column label="库区名称" align="center" prop="storageName" />
      <el-table-column label="库区类型" align="center" prop="storageType" :formatter="storageTypeFormat" />
      <el-table-column label="库区状态" align="center" prop="storageStatus" :formatter="storageStatusFormat" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:storageMenu:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:storageMenu:remove']"
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

    <!-- 添加或修改库区管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="库区编号" prop="storageNo">
          <el-input v-model="form.storageNo" placeholder="请输入库区编号" />
        </el-form-item>
        <el-form-item label="库区名称" prop="storageName">
          <el-input v-model="form.storageName" placeholder="请输入库区名称" />
        </el-form-item>
        <el-form-item label="库区类型" prop="storageType">
          <el-select v-model="form.storageType" placeholder="请选择库区类型">
            <el-option
              v-for="dict in storageTypeOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="库区状态" prop="storageStatus">
          <el-select v-model="form.storageStatus" placeholder="请选择库区状态">
            <el-option
              v-for="dict in storageStatusOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="parseInt(dict.dictValue)"
            ></el-option>
          </el-select>
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
import { listStorageMenu, getStorageMenu, delStorageMenu, addStorageMenu, updateStorageMenu, exportStorageMenu } from "@/api/system/storageMenu";

export default {
  name: "StorageMenu",
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
      // 库区管理表格数据
      storageMenuList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 库区类型字典
      storageTypeOptions: [],
      // 库区状态字典
      storageStatusOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        storageNo: null,
        storageName: null,
        storageType: null,
        storageStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        storageNo: [
          { required: true, message: "库区编号不能为空", trigger: "blur" }
        ],
        storageName: [
          { required: true, message: "库区名称不能为空", trigger: "blur" }
        ],
        storageType: [
          { required: true, message: "库区类型不能为空", trigger: "change" }
        ],
        storageStatus: [
          { required: true, message: "库区状态不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getDicts("storage_type").then(response => {
      this.storageTypeOptions = response.data;
    });
    this.getDicts("status").then(response => {
      this.storageStatusOptions = response.data;
    });
  },
  methods: {
    /** 查询库区管理列表 */
    getList() {
      this.loading = true;
      listStorageMenu(this.queryParams).then(response => {
        this.storageMenuList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 库区类型字典翻译
    storageTypeFormat(row, column) {
      return this.selectDictLabel(this.storageTypeOptions, row.storageType);
    },
    // 库区状态字典翻译
    storageStatusFormat(row, column) {
      return this.selectDictLabel(this.storageStatusOptions, row.storageStatus);
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
        storageName: null,
        storageType: null,
        storageStatus: null,
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
      this.title = "添加库区管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getStorageMenu(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改库区管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateStorageMenu(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addStorageMenu(this.form).then(response => {
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
      this.$confirm('是否确认删除库区管理编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delStorageMenu(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有库区管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportStorageMenu(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
