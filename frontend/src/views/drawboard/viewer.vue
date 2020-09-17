<template>
  <!-- 工具栏 -->
  <div class="student">
    <PicBoard
    style="width:100%; 
    float: right;
    overflow: hidden;"
      :canvasArr="canvasArr"
      :canvasIndex="canvasIndex"
      :showBoardPage="false"
    >
    </PicBoard>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex'
  import { fabric } from 'fabric'
  import socket from "@/utils/socket"
  import boardMixin from '@/utils/mixins'
  import PicBoard from "@/components/DrawingTools/PicBoard"

  export default {
    
    name: 'StudentBoard',
    
    mixins: [boardMixin],
    
    components: {
      PicBoard
    },
    computed: {
      ...mapGetters([
        'userId'
      ])
    },
    data() {
      return {
        tmpData: {
          context:'',
          userId:' ',
          name:' ',
          sessionId: '',
        },
      }
    },
    mounted() {
      this.$store.dispatch('CloseSideBar')
      this.init();
      this.initDrawBoard();
      this.addListener();
      this.sendSynchroEvent();
      //监听界面大小变化
      const that = this
      window.onresize = () => {
        return (() => {
            window.screenWidth = document.body.clientWidth
            that.screenWidth = window.screenWidth
        })()
      }
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
    methods: {
      
      init() {
        this.canvasObj = new fabric.Canvas(`c${this.canvasIndex}`, {
          isDrawingMode: false,
          selectable: false,
          selection: false
        })
        this.canvasObj.setHeight(window.innerHeight);
        this.canvasObj.setWidth(window.innerWidth);
        this.$set(this.canvasArr, this.canvasIndex, this.canvasObj);
         //不允许选择
        this.canvasObj.skipTargetFind = true;
      },

      initDrawBoard() {
        // console.log('this.userId',this.userId)
        if (this.$route.query.imgDataId != undefined) {
          this.api({
            url: "/drawboard/detail?id=" + this.$route.query.imgDataId,
            method: "get",
            //使用data存储于body中，parameter存储于header中
          }).then(data => {
            this.tmpData = data;
            this.tmpData.context=decodeURI(this.tmpData.context)
            this.play(this.tmpData.context);
            
            this.session.sessionId = this.$route.query.sessionId
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
        }
       
      },
      addListener() {
        // 接受工作端播放的数据
        var _this = this
        let url='receive/'+this.tmpData.sessionId
        console.log('接收信息/')
        socket.on(url, (client_data) => {
          _this.play(client_data.data);
        })
      },
      
      // 播放
      play(data) {
        this.canvasObj.loadFromJSON(data, () => {
          this.canvasObj.renderAll();
        });
       
      }
    }
  }
</script>

<style lang="less" scoped>
  .student {
  }
</style>
