<template>
  <v-ons-card class="detail">
      <v-ons-list-header>詳細情報 (任意)</v-ons-list-header>
      <v-ons-list-item class="detail__list"
        v-for="d in detailForm"
        :key="d.name" 
      >
        <label v-text="d.name" class="center">
        </label>              
        <label class="right">
          <v-ons-input type="text"
            @change="inputDetail"
            :data-key="d.key"
            :placeholder="d.holder"
          >
          </v-ons-input>
        </label>
      </v-ons-list-item>
  </v-ons-card>
</template>

<script>
import roomFormData from "../modules/room_form.json"

export default {

  name: 'DetailForm',

  data(){
    return{
      detailForm: roomFormData[2]
    }
  },
  methods:{
    inputDetail(e){
      this.$emit('inputDetail', e.currentTarget)
    }
  }
  
}
</script>

<style lang="scss" scoped>

.detail {
  margin-bottom: 2rem;

  &__list {
    font-size: 0.8rem;
  }
}
</style>
