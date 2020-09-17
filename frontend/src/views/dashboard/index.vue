<template>
  <el-container class="content-container is-vertical" style="height: 100%; width: 100%; overflow:auto; overflow-x: hidden !important;">
    <div style="height: 100%; width: 100%; text-align: center; display: table;">
    <div style="margin:5%">
        <dashboard-item :routes="permission_routers"></dashboard-item>
    </div>
    </div>
  </el-container>
</template>
<script>
  import {mapGetters} from 'vuex'
  import DashboardItem from './DashboardItem'

  export default {
    components: {DashboardItem},
    name: 'dashboard',
    data() {
      return {
        
      }
    },
    
    computed: {
      ...mapGetters([
        'permission_routers',
      ]),
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

