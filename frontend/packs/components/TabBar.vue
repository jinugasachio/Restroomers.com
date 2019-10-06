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
        }
      ],
      watchPosition: {
        id: null,
        count: 0,
        lastTime: 0,
        marker: null,
        icon: {
          url: "packs/images/position.png",
          scaledSize: new google.maps.Size(22, 22)
        }
      },

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
      const consent = window.confirm('現在地を取得してもよろしいですか？')
      if(consent) {
        const vm = this.watchPosition
        const map = this.$store.state.map

        // Geolocation APIに対応してる場合
        if(navigator.geolocation){
          //取得成功
          const geoSuccess = function(position){
            const data = position.coords
            const lat = data.latitude
            const lng = data.longitude
            const latlng = new google.maps.LatLng(lat,lng)
            const nowTime = ~~(new Date() / 1000);// UNIX Timestamp

            // 前回の書き出しから3秒以上経過していたら描写
            // 毎回HTMLに書き出していると、ブラウザがフリーズするため
            if( (vm.lastTime + 3) > nowTime ){
              return false
            }

            vm.lastTime = nowTime

            if(vm.marker == null){
              vm.marker = new google.maps.Marker({
                            map: map,
                            position: latlng,
                            icon: vm.icon
                          });
            }
            ++vm.count; // 処理回数
            // debugger;
            //現在地がその時表示しているmap城の近くだったらスライドで移動する、
            //地図が滑らかに動くには、移動先が表示画面内に存在している必要があります。
            map.panTo(latlng);
            vm.marker.setPosition(latlng)
            console.log(vm.count+"回目の書き出し")
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
            enableHighAccuracy: false, //正確な位置情報を取得するか否か、消費電力多なので要注意
            timeout: 5000, //30秒でタイムアウト
            maximumAge: 5 * 60 * 1000, //位置情報の有効期限
            freaquency: 500 //一定間隔で位置情報を取得する際の間隔を指定
          };
          
          this.activeIndex = 0
          this.$store.dispatch('resetPageStack')
          vm.id = navigator.geolocation.watchPosition(geoSuccess, geoError)
        }
        // Geolocation APIに対応していない場合
        else {
          alert( "お使いの端末では、現在位置を取得できません。" ) ;
        }
      }
    }
  },
  updated(){
    // debugger;
  }
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