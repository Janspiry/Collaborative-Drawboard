<template>
  <div class="board">
    <!-- 主画图区 -->
    <div class="board-wrapper">
      <transition-group tag="div" name="fade">
        <div
          v-for="(i, index) in canvasArr"
          v-show="index === canvasIndex"
          :key="`d${index}`"
        >
          <canvas :id="`c${index}`"></canvas>
        </div>
      </transition-group>
    </div>
    <!-- 右侧分页器 -->
    <div class="board-page" v-if="showBoardPage">
      <div
        v-for="(item, index) in canvasArr"
        :key="`p${index}`"
        class="board-page-item"
        :class="{ 'page-active': index === canvasIndex }"
        @click="$emit('changePage', item, index)">
        {{ index + 1 }}
        
      </div>
    </div>
    <!-- 调试坐标 -->
    <!-- <div class="position-point">
      [第 {{ canvasIndex + 1}} 页]
    </div> -->
  </div>
</template>
<script>
  export default {
    name: 'PicBoard',
    props: {
      bgType: {
        type: String,
        default: ''
      },
      canvasArr: {
        type: Array,
        default: () => []
      },
      canvasIndex: {
        type: Number,
        default: 0
      },
      showBoardPage: {
        type: Boolean,
        default: true
      }
    }
  }
</script>

<style lang="less" scoped>
  .board {
    width: calc(100% - 40px); 
    float: right;
    overflow: hidden;
    .fade-enter-active,
    .fade-leave-active {
      transition: opacity 0.5s;
    }

    .fade-enter,
    .fade-leave-to {
      opacity: 0;
    }
  
    &-wrapper {
      float: right;
      height: 100%;
      background: url(../../assets/images/grid.jpg) repeat;
    }
  
    &-page {
      position: absolute;
      right: 0;
      top: 50%;
      transform: translate(0, -50%);
      width: 50px;
      height: 60%;
      overflow-y: auto;
      /*background-color: bisque;*/
    
      &-item {
        margin-left: 2px;
        width: 25px;
        height: 25px;
        border-radius: 15%;
        border: 1px solid #c7c7d3;
        // box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .6);
        margin-bottom: 10px;
        cursor: pointer;
        text-align: center;
        color: black;
        background-color: #c7c7d3;
      }
    
      &-item:hover {
        background-color: #409eff;
        // box-shadow: 0 1px 6px 0 rgba(0, 0, 0, .6);
      }
    
      .page-active {
        color: white;
        background-color: #409eff;
        border: 1px solid #409eff;
        // box-shadow: 0 1px 6px 0 rgba(0, 0, 0, .6);
      }
    }
    
    .position-point {
      text-align: center;
      position: absolute;
      width: 90px;
      left: 0;
      right: 0;
      bottom: 20px;
      margin: auto;
      color: #74bc7b;
      font-weight: 500
    }
  }
</style>
