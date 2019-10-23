<template>
<div class="wrapper" v-show="postTrriger">
  <div class="top-message">投稿する場所を中心に合わせてください。</div>
  <img src="packs/images/center.png" id="target">
  <div class="button-box">
    <button @click="getCenter" class="button-box__done">決定</button>
    <button @click="close" class="button-box__cancel">キャンセル</button>
  </div>
</div>
</template>

<script>
import roomForm from './RoomForm.vue'

export default {

  name: 'GetCenter',
  components:{
    roomForm
  },
  computed: {
    postTrriger(){
      return this.$store.getters.postTrriger
    }
  },
  methods:{
    getCenter(){
      const vm = this;
        this.$ons.notification.confirm({message: 'この場所に投稿しますか?', title: ''})
       .then(function(response){
          if(response == 1){




            
            vm.$store.dispatch('pushPage', roomForm)
          }
        })
    },
    close(){
      this.$store.dispatch('postTrriger')
    }
  }

}
</script>

<style lang="scss" scoped>

.wrapper {
  position: relative;
  width: 100%;

  .top-message {
    position: absolute;
    z-index: 2;
    width: 100%;
    font-size: 1rem;
    font-weight: 600;
    line-height: 50px;
    color: #fff;
    text-align: center;
    background-color: #fdaaaa;
  }

  #target {
    position: absolute;
    top: 44vh;
    right: 0;
    left: 0;
    z-index: 2;
    width: 5rem;
    margin: auto;
  }

  .button-box {
    position: absolute;
    top: 58vh;
    z-index: 2;
    width: 100%;
    text-align: center;

    button {
      width: 140px;
      font-weight: 600;
      line-height: 35px;
      color: #fcfcfc;
      background-color: #f57070;
      border: none;
      border-radius: 10px;

      &:focus {
        outline: 0;
      }

      &:active {
        background-color: #cf6161;
      }
    }

    &__done {
      margin-right: 25px;
    }

    &__cancel {
      margin-left: 25px;
    }
  }
}
</style>