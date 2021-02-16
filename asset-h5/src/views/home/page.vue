<template>
  <div>
    <van-nav-bar title="欢迎来到小山数据科技管理平台"/>
    <img alt src="../../assets/images/logo.png" style="width: 100%; padding-top: 20%;"/>
    <div style="margin: 16px;">
      <el-button type="info" size="medium" round @click="registertoForm">点击注册</el-button>
    </div>

  </div>
</template>

<script>
export default {
  name: "page",
  methods:{
    registertoForm() {
      this.$router.replace('/register');
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
