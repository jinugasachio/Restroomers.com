<template>
    <v-ons-tabbar  position="auto" animation="none"
      :tabs="tabs"
      :visible="true"
      :index.sync="activeIndex"
    >
      <v-ons-tab v-for="(tab, i) in tabs"
        :icon="tabs[i].icon"
        :label="tabs[i].label"
        :badge="tabs[i].badge"
        :key= i
      >
      </v-ons-tab>
      <v-ons-tab 
        icon="ion-ios-search"
        @click.prevent="searchRoom"
      />
      <v-ons-tab
        icon="ion-ios-navigate"
        @click.prevent="getPosition"
      />
    </v-ons-tabbar>
</template>


<script>
import UserPage from './UserPage.vue'
import Navigator from './Navigator.vue'

export default {

  name: "TabBar",

  components: {
    UserPage,
    Navigator,
  },

  data: function() {
    return {
      activeIndex: 0,
      icon: {
        url: "packs/images/position.png",
        scaledSize: new google.maps.Size(22, 22)
      },
      tabs: [
        {
          icon: 'ion-ios-home',
          label: '',
          page: Navigator,
          props: {
            myProp: 'This is a page prop!'
          },
          // key: ""
        },
        {
          // icon: 'packs/images/lipstick.png',
          // 上の形では指定できないっぽい
          icon: 'ion-ios-heart',
          label: '',
          page: UserPage,
          badge: '',
          // key: ""
        }],

    };
  },

  methods: {

    searchRoom(){
      debugger;
      this.activeIndex = 0
      console.log('search!!')
    },

   //現在地を取得する
    getPosition(){
      const vm = this
      const state = this.$store.state

      // Geolocation APIに対応してる場合
      if( navigator.geolocation )
      { //取得成功
        const geoSuccess = function(position){
          const data = position.coords
          const lat = data.latitude
          const lng = data.longitude
          const latlng = new google.maps.LatLng(lat,lng)

          new google.maps.Marker({
            map: state.map,
            position: latlng,
            icon: vm.icon
          });
          //現在地がその時表示しているmap城の近くだったらスライドで移動する、
          //地図が滑らかに動くには、移動先が表示画面内に存在している必要があります。
          state.map.panTo(new google.maps.LatLng(lat,lng)); 
        };
        //取得失敗
        const geoError = function(error){
          const errorMessage = {
            0: "原因不明のエラーが発生しました。" ,
            1: "位置情報の取得が許可されませんでした。" ,
            2: "電波状況などで位置情報が取得できませんでした。" ,
            3: "位置情報の取得に時間がかかり過ぎてタイムアウトしました。" ,
          }
          alert( errorMessage[error.code]);
        };
        //オプション
        const geoOptions = {
          enableHighAccuracy: false, //かなり正確な位置情報を取得するか否か
          timeout: 60000, //１分でタイムアウト
          maximumAge: 5 * 60 * 1000, //位置情報の有効期限
        };
        const consent = window.confirm('現在地を取得してもよろしいですか？')
        if (consent){
          this.activeIndex = 0
          this.$store.dispatch('resetPageStack')
          navigator.geolocation.getCurrentPosition(geoSuccess, geoError, geoOptions)
        }
      }
      // Geolocation APIに対応していない場合
      else {
        alert( "お使いの端末では、現在位置を取得できません。" ) ;
      }
    }
  },
}
</script>

<style lang="scss">

.tabbar__item {
  &:active {
    background-color: #f2f2f2;

    .tabbar__button {
      color: #ff9705;
    }
  }

  :checked + .tabbar__button {
    color: #ff9705;
  }
}
</style>