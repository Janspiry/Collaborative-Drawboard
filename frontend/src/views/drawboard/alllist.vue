<template>
  <div class="app-container">
    <el-table :data="formattedList" 
    v-loading.body="listLoading" element-loading-text="拼命加载中" border fit
              highlight-current-row>
      <el-table-column align="center" label="序号" width="80">
        <template slot-scope="scope">
          <span v-text="getIndex(scope.$index)"> </span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="名称" prop="name" style="width: 60px;"></el-table-column>
      <el-table-column align="center" label="创建时间" prop="createTime" width="200"></el-table-column>
      <el-table-column align="center" label="最近修改" prop="updateTime" width="200"></el-table-column>
      <el-table-column align="center" label="操作" width="350">
        <template slot-scope="scope">
          <el-button 
            size="medium" 
            type="text"
            icon="el-icon-document"
            style="color: #409eff"
            v-if="scope.row.userId==userId || hasPerm('drawboard:update')"
            @click="UpdateData(scope.$index)">协作
          </el-button>
          <el-button 
            size="medium" 
            type="text"
            icon="el-icon-set-up"
            style="color: #607d8b"
            @click="ViewData(scope.$index)">观看
          </el-button>
          <!-- 删除需要验权-->
          <el-button type="text" 
            icon="el-icon-delete"
            style="color: #fc5454" 
            size="medium" 
            v-if="scope.row.userId==userId || hasPerm('drawboard:delete')"
            @click="removeData(scope.$index)">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="listQuery.pageNum"
      :page-size="listQuery.pageRow"
      :total="totalCount"
      :page-sizes="[10, 20, 50, 100]"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex'
  import { parseTime } from '@/utils';

  export default {
    data() {
      return {
        totalCount: 0, //分页组件--数据总条数
        list: [],//表格的数据
        listLoading: false,//数据加载等待动画
        listQuery: {
          pageNum: 1,//页码
          pageRow: 50,//每页条数
        },
        dialogStatus: 'create',
        dialogFormVisible: false,
        tmpData: {
          id:'',
          context:'',
          userId:' ',
          name:' ',
          sessionId: '',
          password: '',
        },
      }
    },
    created() {
      this.getList();
    },
    computed: {
      ...mapGetters([
        'userId'
      ]),
      formattedList: function () {
        this.list.forEach(data=>{  
            data.createTime=parseTime(data.createTime);  
            data.updateTime=parseTime(data.updateTime);  
        });
        return this.list
      }
    },
    methods: {
      getList() {
        //查询列表
        this.listLoading = true;
        this.api({
          url: "/drawboard/allList",
          method: "get",
          params: this.listQuery
        }).then(data => {
          this.listLoading = false;
          this.list = data.list;
          this.totalCount = data.totalCount;
        })
      },
      handleSizeChange(val) {
        //改变每页数量
        this.listQuery.pageRow = val
        this.handleFilter();
      },
      handleCurrentChange(val) {
        //改变页码
        this.listQuery.pageNum = val
        this.getList();
      },
      handleFilter() {
        //查询事件
        this.listQuery.pageNum = 1
        this.getList()
      },
      getIndex($index) {
        //表格序号
        return (this.listQuery.pageNum - 1) * this.listQuery.pageRow + $index + 1
      },
      addData() {
        this.$router.push({path:'/drawboard',query: {userId:this.userId}})
      },
      UpdateData($index) {
        let imgData = this.list[$index];
        this.$router.push({path:'/drawboard',query: {
          imgDataId : imgData.id,
          sessionId : imgData.sessionId,
          password : imgData.password,
        }})
      },
      ViewData($index) {
        let imgData = this.list[$index];
        this.$router.push({path:'/drawboard/viewer',query: {
          imgDataId : imgData.id,
          sessionId : imgData.sessionId,
        }})
      },
      removeData($index) {
        let _vue = this;
        this.$confirm('确定删除此记录?', '提示', {
          confirmButtonText: '确定',
          showCancelButton: false,
          type: 'warning'
        }).then(() => {
          let imgData = _vue.list[$index];
          _vue.api({
            url: "/drawboard/delete?id="+imgData.id,
            method: "post",
          }).then(() => {
            _vue.getList()
            _vue.$message.success("删除成功")
          }).catch(() => {
            _vue.$message.error("删除失败")
          })
        })
      },
    }
  }
</script>
