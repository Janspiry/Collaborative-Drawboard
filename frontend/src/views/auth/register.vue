<template>
  <body class="authentication-bg">
   <div class="account-pages my-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-10">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="row">
                                <div class="col-lg-6 d-none d-md-inline-block">
                                      <div class="register-page-sidebar">
                                          <div class="overlay"></div>
                                          <div class="auth-user-testimonial">
                                              <p class="lead">这是一个十分高效、便捷的平台</p>
                                              <p>- 某用户</p>
                                          </div>
                                      </div>
                                  </div>
                                <div class="col-md-6 p-5">
                                    <div class="mx-auto mb-5">
                                        <a href="index.html">
                                            <img src="../../assets/LOGO.png" alt="" height="120" />
                                            <!-- <h3 class="d-inline align-middle ml-1 text-logo">Shreyu</h3> -->
                                        </a>
                                    </div>
                                <h6 class="h5 mb-0 mt-4">欢迎加入!</h6>
                                <el-form autoComplete="on" :model="registerForm" :rules="loginRules" ref="registerForm" label-position="left"
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
                                        <input class="form-control" v-model="registerForm.username" autoComplete="on">
                                    </div>
                                  </el-form-item>
                                  <el-form-item prop="nickname">
                                    <span class="svg-container svg-container_login">
                                      <svg-icon icon-class="user"/>个性昵称
                                    </span>
                                    <div class="input-group input-group-merge">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="icon-dual" data-feather="mail"></i>
                                            </span>
                                        </div>
                                        <input class="form-control" v-model="registerForm.nickname" autoComplete="on">
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
                                        <input class="form-control" @keyup.enter.native="handleRegister" v-model="registerForm.password"
                                        >
                                    </div>
                                  </el-form-item>
                                  <el-form-item>
                                    <el-button class="btn btn-primary btn-block" style="width:100%;" :loading="loading" @click.native.prevent="handleRegister">
                                      注册
                                    </el-button>
                                  </el-form-item>
                                </el-form>
                                </div>
                                
                            </div>
                            
                        </div> <!-- end card-body -->
                    </div>
                    <!-- end card -->

                    <div class="row mt-3">
                        <div class="col-12 text-center">
                            <p class="text-muted">已有账号? <el-button type="text" @click.native.prevent="toLogin" class="text-primary font-weight-bold ml-1">去登录</el-button></p>
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
    name: 'register',
    data() {
      return {
        registerForm: {
          username: 'user1',
          password: '123456',
          nickname: '昵称1',
          roleId: 2,
        },
        loginRules: {
          username: [{required: true, trigger: 'blur', message: "请输入用户名"}],
          nickname: [{required: true, trigger: 'blur', message: "请输入昵称"}],
          password: [{required: true, trigger: 'blur', message: "请输入密码"}]
        },
        loading: false
      }
    },
    methods: {
      handleRegister() {
        this.$refs.registerForm.validate(valid => {
          if (valid) {
            this.loading = true
            this.api({
              url: "/user/register",
              method: "post",
              data: this.registerForm
            }).then(() => {
              this.loading = false
              this.$message.success("注册成功");
              this.$router.push({path: '/login'})
              this.dialogFormVisible = false
            }).catch(() => {
              this.loading = false
            })
          } else {
            return false
          }
        })
      },
      toLogin() {
        console.log('跳转至登录界面')
        this.$router.push({path: '/login'})
      }
    }
  }
</script>
<style src="../../styles/bootstrap.min.css" scoped>
</style>
<style src="../../styles/app.css" scoped>
</style>