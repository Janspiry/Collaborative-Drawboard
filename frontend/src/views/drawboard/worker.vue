<template>
  <div>
    <!-- 左侧工具栏 -->
    <LeftTools
      @uploadFile="uploadFile"
      @handleTools="handleTools">
    </LeftTools>
    
    <!-- 上方工具栏 -->
    <TopTools @handleTools="handleTools"></TopTools>
    <!-- 主画图区 -->
    <PicBoard
      
      :canvasArr="canvasArr"
      :canvasIndex="canvasIndex"
      
      @changePage="changePage"
    >
    </PicBoard>
    <div class="operation">
      <!-- <div class="edit-tools"> -->
        <el-button
          type="info" 
          size="medium"
          @click="isShare = true">分享
        </el-button>
        <el-input v-model="tmpData.name"  minlength="1" placeholder="输入标题"></el-input>
        <el-button v-if="this.drawMode == 'add'" 
          type="primary" 
          size="medium"
          @click="addData">新增
        </el-button>
        <el-button v-else 
          type="success" 
          size="medium"
          @click="saveData">保存
        </el-button>
      <!-- </div> -->
    </div>
    <el-dialog
      title="分享链接"
      :visible.sync="isShare"
      width="30%">
      <div>协作者链接</div>
      <!-- <el-link type="primary" :href="this.showWorkerLink">{{showWorkerLink}}</el-link> -->
      <el-link type="primary" >{{showWorkerLink}}</el-link>
      <el-divider></el-divider>
      <div>观看者链接</div>
      <!-- <el-link type="primary" :href="this.showViewerLink">{{showViewerLink}}</el-link> -->
      <el-link type="primary" >{{showViewerLink}}</el-link>
    </el-dialog>
  </div>
</template>
<script>
import Vue from 'vue'
  import { fabric } from 'fabric'
  //画布组件
  import boardMixin from '@/utils/mixins'
  //密码与对话ID随机生成器
  import { randomString } from '@/utils';
  //画布布局
  import TopTools from "@/components/DrawingTools/TopTools"
  import PicBoard from "@/components/DrawingTools/PicBoard"
  import LeftTools from "@/components/DrawingTools/LeftTools"
  import {mapGetters} from 'vuex'
  import socket from "@/utils/socket"
  export default {
    
    name: 'TeacherBoard',
    
    components: {
      PicBoard,
      LeftTools,
      TopTools
    },
    
    mixins: [boardMixin],
    
    data() {
      return {
        drawingObject: null, // 当前绘制对象
        isDrawing: false,
        textObject: null,
        drawMode : 'add',//新增画布或者修改
        tmpData: {
          id: '',
          context:'',
          userId:'',
          name: '新建画布1',
          sessionId: '',
          password: '',
        },
        clientId: '',
        savedFlag: false,//保存标志
        screenWidth: document.body.clientWidth,// 窗口大小，用于自适应缩放
        isShare: false,//分享窗口
      }
    },
    
    mounted() {
      this.$store.dispatch('CloseSideBar')
      this.initKeyboardEvent();
      this.initCanvas();
      //接收画布列表的数据
      this.initDrawBoard();
      //监听事件
      this.addListener();
      //同步画布
      this.sendSynchroEvent();

      //用户刷新界面提示
      Vue.prototype.closeBeforeSave = () => {
        //如果进入页面不进行点击等操作，直接关闭，会不触发
        window.onbeforeunload = function (e) {
          e = e || window.event;
          // 兼容IE8和Firefox 4之前的版本
          if (e) {
            e.returnValue = "关闭提示";
          }
          // Chrome, Safari, Firefox 4+, Opera 12+ , IE 9+
          return "关闭提示";
        };
      }
      this.closeBeforeSave();
      this.destroyed();

      //监听界面大小变化
      const that = this
      window.onresize = () => {
        return (() => {
            window.screenWidth = document.body.clientWidth
            that.screenWidth = window.screenWidth
        })()
      }
    },
    
    computed: {
      ...mapGetters([
        'userId'
      ]),
      isFreeDrawing() {
        return this.type === 'free';
      },
      showWorkerLink() {
        var link = 'http://localhost:9520/#/drawboard'
        link = link +'?imgDataId=' + this.tmpData.id
        + '&sessionId=' + this.tmpData.sessionId
        + '&password=' + this.tmpData.password
        return link;
      },
      showViewerLink() {
        var link = 'http://localhost:9520/#/drawboard/viewer'
        link = link +'?imgDataId=' + this.tmpData.id
        + '&sessionId=' + this.tmpData.sessionId
        return link;
      },

    },
    watch:{
        screenWidth(val){
            // 为了避免频繁触发resize函数导致页面卡顿，使用定时器
            if(!this.timer){
                // 一旦监听到的screenWidth值改变，就将其重新赋给data里的screenWidth
                this.screenWidth = val
                this.timer = true
                let that = this
                this.canvasObj.setWidth(this.screenWidth - 70);
                setTimeout(function(){
                    // console.log('窗口宽度变化：',that.screenWidth)
                    that.timer = false
                },200)
            }
        }
    },
    beforeRouteLeave(to, from, next) {
      if (this.savedFlag === false) {
        this.$confirm('检测到未保存的内容，是否保存画布？', '确认信息', {
          distinguishCancelAndClose: true,
          confirmButtonText: '保存',
          cancelButtonText: '直接退出',
        }).then(() => {
          if (this.drawMode == 'add') {
            this.addData()
          } else {
            this.saveData()
          }
          next(true);
        }).catch(action => {
          // console.log('action',action)
          if(action === 'cancel'){
            next(true);
          } else {
            next(false);
          }
        })
      }else {
        next(true);
      }
    },
    
    methods: {
      destroyed() {
        // 取消对事件的监听
        window.onbeforeunload = null;
      },
      initDrawBoard() {
        // console.log('初始化initDrawBoard')
        if (this.$route.query.imgDataId != undefined) {
          this.api({
            url: "/drawboard/detail?id=" + this.$route.query.imgDataId,
            method: "get",
            //使用data存储于body中，parameter存储于header中
          }).then(data => {
             // console.log('获取画布数据')
            this.drawMode = 'edit'
            this.tmpData = data
            this.tmpData.id = this.$route.query.imgDataId
            this.tmpData.sessionId = this.$route.query.sessionId
            this.tmpData.password = this.$route.query.password
            this.tmpData.context = decodeURI(this.tmpData.context)
            this.canvasObj.loadFromJSON(this.tmpData.context, () => {
            this.canvasObj.renderAll()

            //若是浏览别人画布，需要添加浏览记录
            if( this.userId != this.tmpData.userId) {
              var tmp ={
                user_id : this.userId,
                drawboard_id : this.tmpData.id
              }
              console.log('tmp',tmp)
              this.api({
                url: "/drawboard/record/add",
                method: "post",
                data: tmp
              })
            }
            })
          })
        } else {
          //新画布，随机生成密码等，并启动后台监听
          this.drawMode = 'add'
          this.tmpData.sessionId = randomString(8)
          this.tmpData.password = randomString(8)
          this.tmpData.userId = this.$route.query.userId
          if (this.tmpData.userId == undefined || this.tmpData.userId == null) {
            this.tmpData.userId = this.userId
          }
          //启动后台监听
        } 
        // console.log('this.tmpData',this.tmpData)
        this.session.sessionId = this.tmpData.sessionId
        this.session.password = this.tmpData.password
        this.clientId = randomString(6)
        this.session.clientId = this.clientId
        // console.log('this.userId',this.userId)

        
      },
      addData() {
        //选择编码存储或直接Json储存，encodeURI用于请求头方式的非法字符转换
        this.tmpData.context=JSON.stringify(this.canvasObj)
        // this.tmpData.context=encodeURI(JSON.stringify(this.canvasObj))

        this.savedFlag = true
        this.api({
          url: "/drawboard/add",
          method: "post",
          //使用data存储于body中，parameter存储于header中
          data: this.tmpData
        }).then(data => {
          this.$message.success("成功添加新画布");
          this.$router.push({path:'/drawboard/mylist'})
        })
      },
      saveData() {
        this.tmpData.context=JSON.stringify(this.canvasObj)
        this.savedFlag = true
        this.api({
          url: "/drawboard/update",
          method: "post",
          data: this.tmpData
        }).then(data => {
          this.$message.success("保存成功");
        })
      },
      initCanvas() {
        this.addCanvas();
        this.initEvent();
      },

      initEvent() {
        this.canvasObj.on({
          'mouse:down': this.mouseDown,
          'mouse:up': this.mouseUp,
          'mouse:move': this.mouseMove,
          'object:added': this.objectAdded,
          'object:rotating': this.objectRotating,
          'object:scaling': this.objectScaling,
          'object:moving': this.objectMoving,
          'object:modified': this.objectModified,
          'selection:created': this.selectionCreated
        });
      },

      initKeyboardEvent() {
        document.addEventListener('keydown', ({ keyCode }) => {
          const isUpArrow = keyCode === 38;
          const isDownArrow = keyCode === 40;
          if (isUpArrow || isDownArrow) {
            const index = isUpArrow ? this.canvasIndex - 1 : this.canvasIndex + 1;
            this.changePage(this.canvasArr[index], index);
          }
        });
      },
      addListener() {
        // 接受工作端播放的数据
        let url='receive/' + this.tmpData.sessionId
        var _this = this
        socket.on(url, (client_data) => {
          console.log('接收同步信息，url=/',url)
          // console.log('客户端ID=/',client_data.senderId)
          if(client_data.senderId != this.clientId)
          _this.canvasObj.loadFromJSON(client_data.data, () => {
          _this.canvasObj.renderAll()
          })
        })
        let url1='synchroFromServer/' + this.tmpData.sessionId
        console.log('监听来自其他端的同步请求/')
        socket.on(url1, () => {
          console.log('worker端发送同步信息/')
          _this.sendEvent();
        })
      },
      uploadFile(e) {
        // 设置图片
        const addImage = (data) => {
          const imgObj = new Image();
          imgObj.src = data;
          imgObj.onload = () => {
            const image = new fabric.Image(imgObj);
            this.canvasObj.centerObject(image);
            this.canvasObj.add(image);
            this.canvasObj.renderAll();
          }
        };
        // 设置背景
        const addBackground = (data) => {
          fabric.Image.fromURL(data, (img) => {
            this.canvasObj.setBackgroundImage(img, this.canvasObj.renderAll.bind(this.canvasObj), {
              scaleX: this.canvasObj.width / img.width,
              scaleY: this.canvasObj.height / img.height
            });
          });
        };
        const reader = new FileReader();
        reader.onload = (event) => {
          const data = event.target.result;
          (this.type === 'background' ? addBackground : addImage)(data);
        }
        reader.readAsDataURL(e.target.files[0]);
      }
    }
  }
</script>

<style lang="less" scoped>
  .operation {
    z-index: 999;
    position: absolute;
    bottom: 8px;
    left: 50%;
    transform: translate(-50%);
    display: flex;
    justify-content: center;

  }
</style>
