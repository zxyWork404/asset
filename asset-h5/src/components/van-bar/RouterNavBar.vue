<template>

  <van-nav-bar :title="title" left-arrow left-text="返回" @click-left="onClickLeft"/>

</template>
<script>
export default {
  name: 'RouterNavBar',
  props: {
    title: {
      type: String
    },
    path: {
      type: String
    }
  },
  data() {
    return {};
  },
  methods: {
    onClickLeft() {
      this.$router.push(this.path);
    }
  }
};
</script>

