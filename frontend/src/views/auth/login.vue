<template>
  <!-- <div class="login-container">
    <el-form autoComplete="on" :model="loginForm" :rules="loginRules" ref="loginForm" label-position="left"
             label-width="0px"
             class="card-box login-form">
      <h3 class="title">登录系统</h3>
      <el-form-item prop="username">
        <span class="svg-container svg-container_login">
          <svg-icon icon-class="user"/>
        </span>
        <el-input v-model="loginForm.username" autoComplete="on"/>
      </el-form-item>
      <el-form-item prop="password">
        <span class="svg-container">
          <svg-icon icon-class="password"></svg-icon>
        </span>
        <el-input type="password" @keyup.enter.native="handleLogin" v-model="loginForm.password"
                  autoComplete="on"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" style="width:100%;" :loading="loading" @click.native.prevent="handleLogin">
          登录
        </el-button>
      </el-form-item>
    </el-form>
  </div> -->
  <body class="authentication-bg">
   <div class="account-pages my-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-10">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="row">
                                <div class="col-md-6 p-5">
                                    <div class="mx-auto mb-5">
                                        <a href="index.html">
                                            <img src="../../assets/LOGO.png" alt="" height="120" />
                                            <!-- <h3 class="d-inline align-middle ml-1 text-logo">Shreyu</h3> -->
                                        </a>
                                    </div>
                                <h6 class="h5 mb-0 mt-4">欢迎回来!</h6>
                                <el-form autoComplete="on" :model="loginForm" :rules="loginRules" ref="loginForm" label-position="left"
                                        label-width="0px"
                                        >
                                  <el-form-item prop="username">
                                    <span class="svg-container svg-container_login">
                                      <svg-icon icon-class="user"/>用户名
                                    </span>
                                    <div class="input-group input-group-merge">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="icon-dual" data-feather="mail"></i>
                                            </span>
                                        </div>
                                        <input class="form-control" v-model="loginForm.username" autoComplete="on">
                                    </div>
                                  </el-form-item>
                                  <el-form-item prop="password">
                                    <span class="svg-container">
                                      <svg-icon icon-class="password"/>密码
                                    </span>
                                    <div class="input-group input-group-merge">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="icon-dual" data-feather="lock"></i>
                                            </span>
                                        </div>
                                        <input type="password" class="form-control" @keyup.enter.native="handleLogin" v-model="loginForm.password"
                                        >
                                    </div>
                                  </el-form-item>
                                  <el-form-item>
                                    <el-button class="btn btn-primary btn-block" style="width:100%;" :loading="loading" @click.native.prevent="handleLogin">
                                      登录
                                    </el-button>
                                  </el-form-item>
                                </el-form>
                                </div>
                                <div class="col-lg-6 d-none d-md-inline-block">
                                    <div class="auth-page-sidebar">
                                        <div class="overlay"></div>
                                        <div class="auth-user-testimonial">
                                            <p class="lead">这是一个十分高效、便捷的平台</p>
                                            <p>- 某用户</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div> <!-- end card-body -->
                    </div>
                    <!-- end card -->

                    <div class="row mt-3">
                        <div class="col-12 text-center">
                            <p class="text-muted">还没有账户? <el-button type="text" @click.native.prevent="toRegister" class="text-primary font-weight-bold ml-1">去注册</el-button></p>
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                </div> <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
  </body>
</template>
<script>
  export default {
    name: 'login',
    data() {
      return {
        loginForm: {
          username: 'admin',
          password: '123456'
        },
        loginRules: {
          username: [{required: true, trigger: 'blur', message: "请输入用户名"}],
          password: [{required: true, trigger: 'blur', message: "请输入密码"}]
        },
        loading: false
      }
    },
    methods: {
      handleLogin() {
        this.$refs.loginForm.validate(valid => {
          if (valid) {
            this.loading = true
            this.$store.dispatch('Login', this.loginForm).then(data => {
              this.loading = false
              if ("success" === data.result) {
                this.$router.push({path: '/'})
              } else {
                this.$message.error("账号/密码错误");
              }
            }).catch(() => {
              this.loading = false
            })
          } else {
            return false
          }
        })
      },
      toRegister() {
        console.log('跳转至注册界面')
        this.$router.push({path: '/register'})
      }
    }
  }
</script>
<style src="../../styles/bootstrap.min.css" scoped>
</style>
<style src="../../styles/app.css" scoped>
</style>