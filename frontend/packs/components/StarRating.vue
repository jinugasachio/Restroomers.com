<template>
    <star-rating  
      :star-size="18"
      :increment="0.1"
      :read-only="true"
      :show-rating="false"
      v-model="bindRate"
    >
    </star-rating>
</template>

<script>

export default {
  name: 'Star',
  props:{
    averageRate: Number,
    userRate: Number,
  },
  data(){
    return{
      bindRate: null
    }
  },
  computed:{
    pageStack(){
      return this.$store.getters.pageStack
    }
  },
  mounted(){
      if(this.$el.classList[0] == "average-rate"){
        this.bindRate = this.averageRate
      }
      else if(this.$el.classList[0] == "user-review__star"){
        this.bindRate = this.userRate
      }
  }
}
</script>