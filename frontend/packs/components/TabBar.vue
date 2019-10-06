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
        latlng: null,
        icon: {
          url: "packs/images/position.png",
          scaledSize: new google.maps.Size(22, 22)
        }
      },

    };
  },

  computed: {
    map(){
      return this.$store.state.map;
    }
  },

  methods: {

    searchRoom(){
      this.activeIndex = 0
      console.log('search!!')
    },

   //現在地を取得する
    getPosition(){
      const consent = window.confirm('現在地を取得してもよろしいですか？')
      if(consent) {
        const vm = this;
        const watchPosition = this.watchPosition;
        // const map = this.$store.state.map;

        // Geolocation APIに対応してる場合
        if(navigator.geolocation){
          //取得成功
          const geoSuccess = function(position){
            const data = position.coords;
            const latlng = new google.maps.LatLng(data.latitude, data.longitude);
            const nowTime = ~~(new Date() / 1000); // UNIX Timestamp

            // 前回の書き出しから3秒以上経過していたら描写
            // 毎回HTMLに書き出していると、ブラウザがフリーズするため
            if( (watchPosition.lastTime + 3) > nowTime ){
              return false;
            }
            if(watchPosition.marker == null){
              watchPosition.marker = new google.maps.Marker({
                                        map: vm.map,
                                        position: latlng,
                                        clickable: true,
                                        icon: watchPosition.icon
                                      });
            }

            watchPosition.lastTime = nowTime; //更新履歴を残す
            watchPosition.latlng = latlng; //位置を更新
            ++watchPosition.count; // 処理回数をカウント
            // debugger;
            //現在地がその時表示しているmap城の近くだったらスライドで移動する、
            //地図が滑らかに動くには、移動先が表示画面内に存在している必要があります。
            vm.map.panTo(latlng);
            watchPosition.marker.setPosition(latlng);
            console.log(watchPosition.count+"回目の書き出し")
          };

          //取得失敗
          const geoError = function(error){
            const errorMessage = {
              0: "原因不明のエラーが発生しました。" ,
              1: "位置情報サービスをオンにし、ブラウザに位置情報の共有を許可してください。" ,
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
          watchPosition.id = navigator.geolocation.watchPosition(geoSuccess, geoError)
        }
        // Geolocation APIに対応していない場合
        else {
          alert( "お使いの端末では、現在位置を取得できません。" ) ;
        }
      }
    },

    //行きたい部屋まで案内する
    guide(){
      // const watchPosition = this.watchPosition;
      const service = new google.maps.DirectionsService();
      const renderer = new google.maps.DirectionsRenderer({suppressMarkers: true});
      renderer.setMap(this.map);
debugger;
      const start = new google.maps.LatLng(36.504975, 139.76422960000002);
      debugger;
      const end = new google.maps.LatLng(35.66019636, 139.70036142);
      const request = {
        origin: start,      // 出発地点の緯度経度
        destination: end,   // 到着地点の緯度経度
        travelMode: 'WALKING'
      };
      service.route(request, function(result, status){
        if (status === 'OK') {
          renderer.setDirections(result); //取得したルート（結果：result）をセット
        }else{
          alert("取得できませんでした：" + status);
        }
      });
    }
  },
  mounted(){
    // debugger;
    // this.getPosition();
    // debugger;
    // this.guide();
  }
}
</script>

<style lang="scss">

.tabbar__item {
  &:active {
    background-color: #f3f0ec;

    .tabbar__button {
      color: #ff5a47;
    }
  }

  :checked + .tabbar__button {
    color: #ff5a47;
  }
}

</style>