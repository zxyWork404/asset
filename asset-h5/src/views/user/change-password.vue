<!-- home -->
<template>
  <div>
    <router-nav-bar left-arrow left-text="返回" path="/dashboard/user" title=""/>

    <van-form @submit="onSubmit">
      <van-field
        v-model="formData.loginName"
        :rules="[{ required: true, message: '请填写旧密码' }]"
        label="旧密码"
        name="旧密码"
        placeholder="旧密码"
      />
      <van-field
        v-model="formData.loginPwd"
        :rules="[{ required: true, message: '请填写新密码' }]"
        label="新密码"
        name="新密码"
        placeholder="新密码"
        type="password"
      />
      <van-field
        v-model="formData.code"
        :rules="[{ required: true, message: '请填写新密码' }]"
        label="新密码"
        name="新密码"
        placeholder="新密码"
        style="width: 60%;float:left"
        type="password"
      />
      <div style="margin: 16px;">
        <van-button block native-type="submit" size="small" type="info">
          提交
        </van-button>
      </div>
    </van-form>
  </div>
</template>

<script>
import RouterNavBar from 'components/van-bar/RouterNavBar';

export default {
  components: {
    RouterNavBar
  },
  data() {
    return {
      formData: {
        loginName: '',
        loginPwd: '',
        code: '',
        codeUuid: ''
      },
      codeUrl: ''
    };
  },
  mounted() {
  },
  methods: {
    // 提交表单
    onSubmit() {
      this.$smart.loading();
      try {
        this.$toast.success('暂未实现');
        this.$router.replace('/dashboard/user');
      } catch (e) {
        console.log(e);
        this.$smartSentry.captureException(e);
      } finally {
        this.$smart.loadingClear();
      }
    }
  }
};
</script>
