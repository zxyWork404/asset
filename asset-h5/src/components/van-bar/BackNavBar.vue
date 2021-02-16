<template>

  <van-nav-bar :title="title" left-arrow left-text="返回" @click-left="onClickLeft"/>

</template>
<script>
export default {
  name: 'BackNavBar',
  props: {
    title: {
      type: String
    }
  },
  data() {
    return {};
  },
  methods: {
    onClickLeft() {
      this.$router.go(-1);
    }
  }
};
</script>

