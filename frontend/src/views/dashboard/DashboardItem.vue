<template >
  <el-row :gutter="12" >
    
    <el-col :span="8">
      <el-card :body-style="{ padding: '0px' }" shadow="hover">
        <router-link to="drawboard/">
          <img src="../../assets/images/draw.png" class="image">
          <div style="padding: 14px;">
            <span>新的协作</span>
          </div>
        </router-link>
      </el-card>
    </el-col>
    <el-col :span="8">
      <el-card :body-style="{ padding: '0px' }" shadow="hover">
        <router-link to="drawboard/mylist">
          <img src="../../assets/images/list.png" class="image">
          <div style="padding: 14px;">
            <span>我的发布</span>
          </div>
        </router-link>
    </el-card>
    
    </el-col>
    <el-col :span="8">
      <el-card :body-style="{ padding: '0px' }" shadow="hover">
        <router-link to="drawboard/attended">
          <img src="../../assets/images/history.png" class="image">
          <div style="padding: 14px;">
            <span>观看历史</span>
          </div>
        </router-link>
    </el-card>
    
    </el-col>
    
  </el-row>
</template>
<script>
  export default {
    name: 'DashboardItem',
    props: {
      routes: {
        type: Array
      }
    },
    data() {
      return {
        
      }
    }
  }
</script>
<style>
  .time {
    font-size: 13px;
    color: #999;
  }
  
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width: 100%;
    display: block;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  
  .clearfix:after {
      clear: both
  }
</style>

