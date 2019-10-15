<template>
  <div id="heart" @click="like">
    <span>{{ roomLikes.length }}</span>
  </div>
</template>

<script>

export default {

  name: 'HeartButton',

  computed:{
    room(){
      return this.$store.getters.room.powder_room
    },
    headers(){
      return this.$store.getters.headers
    },
    currentUser(){
      return this.$store.getters.currentUser.data
    },
    roomLikes(){
      return this.$store.getters.roomLikes 
    },
    isLiked(){
      const vm = this;
      const liked = this.roomLikes.filter(function(like){
        return like.user_id == vm.currentUser.id
      })
      return liked
    }
  },
  
  methods:{
    like(){
      if(this.headers !== null){
        this.changeClass();
        if(this.isLiked.length == 0){
          const likeParams = { "powder_room_id": this.room.id }
          this.$store.dispatch('like', likeParams);
        }
        else{
          this.unLike();
        }
      }
      else{
        this.$ons.notification.alert({ message: 'ログインしてください。', title: '' });
      }
    },
    unLike(){
      const params = { "id": this.isLiked[0].id }
      this.$store.dispatch('unlike', params)
    },
    changeClass(){
      const button = document.getElementById('heart');
      button.classList.toggle('isAnimating')
    },
  },

  mounted(){
    if(this.headers !== null && this.isLiked.length > 0){
      this.changeClass();
    }
  }

}
</script>

<style lang="scss" scoped>

#heart {
  position: absolute;
  top: -0.16rem;
  right: 1rem;
  width: 35px;
  height: 35px;
  cursor: pointer;
  background-image: url('https://abs.twimg.com/a/1446542199/img/t1/web_heart_animation.png');
  background-repeat: no-repeat;
  background-position: 0.5% 45%;
  background-size: 4000%;

  span {
    position: absolute;
    top: 9px;
    right: -11px;
    display: inline-block;
  }
}

.isAnimating {
  background-position: 99.51% 45% !important;
  animation: heart-burst 1s steps(28) 1;
}

@keyframes heart-burst {
  from { background-position: 0.5% 45%; }
  to { background-position: 99.51% 45%; }
}
</style>