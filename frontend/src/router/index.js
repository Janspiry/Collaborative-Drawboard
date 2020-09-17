import Vue from 'vue'
import Router from 'vue-router'
// in development env not use Lazy Loading,because Lazy Loading too many pages will cause webpack hot update too slow.so only in production use Lazy Loading
/* layout */
import Layout from '../views/layout/Layout'

const _import = require('./_import_' + process.env.NODE_ENV)
Vue.use(Router)
export const constantRouterMap = [
  {path: '/login', component: _import('auth/login'), hidden: true},
  {path: '/register', component: _import('auth/register'), hidden: true},
  {path: '/404', component: _import('404'), hidden: true},
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    name: '首页',
    hidden: true,
    children: [{
      path: 'dashboard', 
      meta: {title: '首页', icon: 'tree', navShow: true},
      component: _import('dashboard/index')
    }]
  }
]
export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({y: 0}),
  routes: constantRouterMap
})
export const asyncRouterMap = [
  {
    path: '/drawboard',
    component: Layout,
    redirect: '/drawboard/',
    name: '协同画板',
    meta: {title: '协同画板', icon: 'example'},
    children: [
      {
        //path 存放路径
        path: '',
        //name 定义面包屑的标题
        name: '画板协作',
        //component引入自定义组件
        component: _import('drawboard/worker'),
        //meta 定义侧边栏的标题及图标,是否展示导航栏
        meta: {title: '画板协作', icon: 'form', navShow: false},
        //menu用于权限验证，只有拥有drawboard menu_code的用户可以看到界面入口
        menu: 'drawboard'
      },
      {
        path: 'viewer',
        name: '画板观看',
        hidden: true,
        component: _import('drawboard/viewer'),
        meta: {title: '画板观看', icon: 'eye', navShow: false},
        menu: 'drawboard'
      },
      {
        path: 'mylist',
        name: '我的发布',
        component: _import('drawboard/mylist'),
        meta: {title: '我的发布', icon: 'tree', navShow: true},
        menu: 'drawboard'
      },
      {
        path: 'attended',
        name: '观看历史',
        component: _import('drawboard/attended'),
        meta: {title: '观看历史', icon: 'eye', navShow: true},
        menu: 'drawboard'
      },
      {
        path: 'alllist',
        name: '所有画布',
        component: _import('drawboard/alllist'),
        meta: {title: '所有画布', icon: 'tree', navShow: true},
        menu: 'alldrawboard'
      },
    ]
  },
  {
    path: '/user',
    component: Layout,
    redirect: '/user/',
    name: '',
    meta: {title: '用户权限', icon: 'table'},
    children: [
      {
        path: '', name: '用户列表', component: _import('user/user'), 
        meta: {title: '用户列表', icon: 'user', navShow: true}, menu: 'user'
      },
      {
        path: 'role',
        name: '权限管理',
        component: _import('user/role'),
        meta: {title: '权限管理', icon: 'password', navShow: true},
        menu: 'role'
      },
    ]
  },
  {path: '*', redirect: '/404', hidden: true}
]
