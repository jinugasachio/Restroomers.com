<template>
  <v-ons-tab id="direction"
    icon="ion-ios-navigate"
    :label="label"
    @click.prevent="updateDirectionTrigger"
  />
</template>

<script>
export default {

  name: "DirectionTab",

  data: function() {
    return {
        id: null,
        count: 0,
        lastTime: 0,
        marker: null,
        latlng: null,
        icon: {
          url: "packs/images/position.png",
          scaledSize: new google.maps.Size(22, 22)
        },
    };
  },

  computed: {
    map(){
      return this.$store.state.map;
    },
    room(){
      return this.$store.state.room.powder_room;
    },
    label(){
      if(this.existRoom){
        return 'ルートを表示！'
      }
      else if(this.id !== null){
        return 'GPS起動中！'
      }
    },
    pageStack(){
      return this.$store.state.pageStack
    },
    directionTrigger(){
      return this.$store.state.directionTrigger
    },
    guideTrigger(){
      return this.$store.state.guideTrigger
    },
    existRoom(){
      if(this.pageStack.filter(function(page){
        return page.name == "Room"}).length >0){
          return true
      }
      else{
        return false
      }
    },
  },

  methods: {

    updateDirectionTrigger(){
      if(this.id !== null){
        console.log('stop')
        if(window.confirm('GPS追跡を中止しますか？')){
          navigator.geolocation.clearWatch(this.id);
          this.id = null;
          this.changeClass('direction');
        }
      }
      else{
        this.$store.dispatch('updateDirectionTrigger')
      }
    },

    changeClass(className){
      const button = document.getElementById('direction');
      if (this.pageStack.length > 1 && this.existRoom){
        button.classList.add(className)
      }
      else if(this.id !== null){
        button.classList.add(className)
      }
      else{
        button.classList.remove(className)
      }
    },

   //現在地を取得する
    getPosition(){
      const vm = this;
      // Geolocation APIに対応してる場合
      if(navigator.geolocation){
        //取得成功
        const geoSuccess = function(position){
          // debugger;
          const data = position.coords;
          const latlng = new google.maps.LatLng(data.latitude, data.longitude);
          const nowTime = ~~(new Date() / 1000); // UNIX Timestamp

          // 前回の書き出しから3秒以上経過していたら描写
          // 毎回HTMLに書き出していると、ブラウザがフリーズするため
          if( (vm.lastTime + 3) > nowTime){
            return false;
          };

          if(vm.marker == null){
            vm.marker = new google.maps.Marker({
                            map: vm.map,
                            position: latlng,
                            clickable: true,
                            icon: vm.icon
                        });
          };

          ++vm.count; // 処理回数をカウント
          vm.lastTime = nowTime; //更新履歴を残す
          //現在地がその時表示しているmap城の近くだったらスライドで移動する、
          //地図が滑らかに動くには、移動先が表示画面内に存在している必要があります。
          vm.map.panTo(latlng);
          vm.marker.setPosition(latlng);
          if (vm.count == 1){ //guide();のstart用で最初の一回だけ更新
            vm.latlng = latlng; //位置を更新
          }
          console.log(vm.count+"回目の書き出し");
        };

        //取得失敗
        const geoError = function(error){
          const errorMessage = {
            0: "原因不明のエラーが発生しました。" ,
            1: "位置情報サービスをオンにし、ブラウザに位置情報の共有を許可してください。" ,
            2: "電波状況などで位置情報が取得できませんでした。" ,
            3: "位置情報の取得に時間がかかり過ぎてタイムアウトしました。" ,
          };
          alert( errorMessage[error.code]);
        };

        //オプション
        const geoOptions = {
          enableHighAccuracy: false, //正確な位置情報を取得するか否か、消費電力多なので要注意
          timeout: 5000, //30秒でタイムアウト
          maximumAge: 5 * 60 * 1000, //位置情報の有効期限
          freaquency: 500 //一定間隔で位置情報を取得する際の間隔を指定
        };
        vm.$emit('backToMap');
        vm.changeClass('direction')
      vm.count = 0;
      vm.id = navigator.geolocation.watchPosition(geoSuccess, geoError, geoOptions);
      }
      // Geolocation APIに対応していない場合
      else {
        alert( "お使いの端末では、現在位置を取得できません。" ) ;
      }
    },


  //行きたい部屋まで案内する
    guide(){
      const service = new google.maps.DirectionsService();
      const renderer = new google.maps.DirectionsRenderer({
                         suppressMarkers: true
                       });
      renderer.setMap(this.map);

      const start = this.latlng 
      const end = new google.maps.LatLng(this.room.lat, this.room.lng);
      const request = {
        origin: start,      // 出発地点の緯度経度
        destination: end,   // 到着地点の緯度経度
        travelMode: 'WALKING'
      };

      service.route(request, function(result, status){
        if (status === 'OK') {
          renderer.setDirections(result); //取得したルート（結果：result）をセット
        }
        else{
          alert("取得できませんでした：" + status);
        }
      });

    },
  },

  watch: {

    pageStack: {
      handler(){ this.changeClass('direction')}
    },

    directionTrigger: {
      handler() {
        if(this.existRoom){
          if(window.confirm('ルートを表示してもよろしいですか？')){
            this.getPosition();
          }
        }
        else {
            if(window.confirm('現在地を取得してもよろしいですか？')){
              this.getPosition();
            }
        }
      }
    },

    latlng: {
      handler() {
        if(this.count == 1 && this.guideTrigger){
          this.guide();
        }
      }
    }

  }

}
</script>



<style lang="scss">

.direction {
  background-color: #ff5757;

  .tabbar__button {
    color: #fff;
  }
}

</style>