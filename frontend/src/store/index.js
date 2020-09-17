import Vue from 'vue'
import Vuex from 'vuex'
import app from './modules/app'
import user from './modules/user'
import permission from './modules/permission'
import getters from './getters'
import draw from './modules/draw'
import tools from './modules/tools'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    app,
    user,
    permission,
    //添加画板module
    tools,
    draw
  },
  getters
})

export default store
