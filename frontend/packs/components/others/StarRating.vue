<template>
    <star-rating  
      :star-size="starSize"
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
    userRate:    Number,
  },

  data(){
    return{
      starSize: 18,
      bindRate: null
    }
  },

  computed:{
    pageStack(){
      return this.$store.getters.pageStack
    },
    size:{
      get(){ return this.starSize },
      set(newSize){ this.starSize = newSize }
    }
  },

  methods:{
    changeBindModel(){
      if(this.$el.classList[0] == "average-rate"){
        this.bindRate = this.averageRate
      }
      else if(this.$el.classList[0] == "user-review__inner__star"){
        this.bindRate = this.userRate
        this.size = 14
      }
    },
  },
  mounted(){
    this.changeBindModel();
  }
}
</script>