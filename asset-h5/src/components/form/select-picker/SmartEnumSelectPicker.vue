<template>
  <div>
    <van-field
      v-model="result"
      v-bind="$attrs"
      is-link
      readonly
      @click="show = !show"
    />
    <van-popup v-model="show" position="bottom">
      <van-picker
        :columns="columns"
        :title="$attrs.label"
        show-toolbar
        value-key="desc"
        @cancel="show = !show"
        @confirm="onConfirm"
      />
    </van-popup>
  </div>
</template>
<script>
export default {
  name: 'SmartEnumSelectPicker',
  model: {
    prop: 'selectValue'
  },
  props: {
    enumName: {
      type: String
    },
    selectValue: {
      type: String
    }
  },
  data() {
    return {
      show: false,
      result: this.selectValue,
      columns: this.$enum.getValueDescList(this.enumName)
    };
  },
  methods: {
    onConfirm(value) {
      this.result = value.desc;
      this.show = !this.show;
      this.$emit('change', value);
    }
  },
  watch: {
    selectValue: function (newVal) {
      this.result = newVal;
    },
    result(newVal) {
      this.$emit('input', newVal);
    }
  }
};
</script>

<style></style>
