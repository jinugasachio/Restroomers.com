<template>
  <v-ons-tab id="direction"
    icon="ion-ios-navigate"
    @click.prevent="triggerUpdate"
  />
</template>


<script>

export default {

  name: "DirectionTab",

  data: function() {
    return {
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
    },
    pageStack(){
      return this.$store.state.pageStack
    },
    trigger(){
      return this.$store.state.trigger
    },
    existRoom(){
      if(this.pageStack.filter(function(page){
        return page.name == "Room"}).length >0){
        return true
      }else{
        return false
      }
    },
    consent(){
      if(this.existRoom){
        return window.confirm('ここまでのルートを表示してもよろしいですか？')
      }else{
        return window.confirm('現在地を取得してもよろしいですか？')
      }
    }
  },

  methods: {

    triggerUpdate(){
      this.$store.dispatch('updateTrigger')
    },

   //現在地を取得する
    getPosition(){
      if(this.consent) {
        const vm = this;
        const watchPosition = this.watchPosition;

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
          
          this.$emit('backToMap')
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
  },
  watch: {
    pageStack: {
      handler() {
        const button = document.getElementById('direction');
        if (this.pageStack.length > 1 && this.existRoom){
          button.classList.add('hoge')
        }else{
          button.classList.remove('hoge')
        }
      }
    },
    trigger: {
      handler() {
        if(this.existRoom){
          // this.getPosition();
          // this.guide();
          console.log('at room')
        }else{
          // this.getPosition();
          console.log('at map or list')
        }
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.hoge {
  background-color: red;
}
</style>