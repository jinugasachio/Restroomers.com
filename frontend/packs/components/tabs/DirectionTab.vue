<template>
  <v-ons-tab id="direction"
    icon="ion-ios-navigate"
    :label="label"
    @click.prevent="direct"
  />
</template>

<script>
export default {

  name: "DirectionTab",

  data() {
    return {
        id: null,
        successId: null,
        count: 0,
        lastTime: 0,
        marker: null,
        latlng: null,
        renderer: null,
        icon: {
          url: "packs/images/position.png",
          scaledSize: new google.maps.Size(22, 22)
        },
    };
  },

  computed: {
    map(){
      return this.$store.getters.map;
    },
    room(){
      return this.$store.getters.room.powder_room;
    },
    label(){
      if(this.atRoomPage && this.successId !== null){
        return 'Active';
      }
      else if(this.atRoomPage){
        return 'ルートを表示';
      }
      else if(this.successId !== null){
        return 'Active';
      }
    },
    pageStack(){
      return this.$store.getters.pageStack;
    },
    directionTrigger(){
      return this.$store.getters.directionTrigger;
    },
    guideTrigger(){
      return this.$store.getters.guideTrigger;
    },
    activeTab(){
      return this.$store.getters.activeTab;
    },
    atRoomPage(){
      const page = this.pageStack[this.pageStack.length - 1]
      if(page.name == "Room"){
        return true;
      }
    },
    targetForDirectMode(){
      return [
        this.pageStack,
        this.activeTab,
        this.guideTrigger,
      ]
    }
  },

  methods: {

    direct(){
      const vm = this;
      if(vm.successId !== null){
        vm.$ons.notification.confirm({message: 'GPS追跡を中止しますか？', title: ''})
          .then(function(response){
            if(response == 1){
              navigator.geolocation.clearWatch(vm.id);
              vm.id = null;
              vm.successId = null;
              vm.resetRoute();
            }
          });
      }
      else{
        vm.$store.dispatch('directionTrigger');
      }
    },

    getPosition(){
      const vm = this;
      if(navigator.geolocation){
        const geoSuccess = function(position){
          vm.successId  = vm.id; //gps-modeクラスと連動させるため
          const data    = position.coords;
          const latlng  = new google.maps.LatLng(data.latitude, data.longitude);
          const nowTime = ~~(new Date() / 1000);
          
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
          ++vm.count;
          vm.lastTime = nowTime;
          vm.map.panTo(latlng);
          vm.marker.setPosition(latlng);
          if (vm.count == 1){ //guide();のstart用で最初の一回だけ更新
            vm.latlng = latlng; //位置を更新
          }
        };

        const geoError = function(error){
          const errorMessage = {
            0: "原因不明のエラーが発生しました。" ,
            1: "位置情報サービスをオンにし、ブラウザに位置情報の共有を許可してください。" ,
            2: "電波状況などで位置情報が取得できませんでした。" ,
            3: "位置情報の取得に時間がかかり過ぎてタイムアウトしました。" ,
          };
          vm.$ons.notification.alert({message: errorMessage[error.code], title: ''});
        };

        const geoOptions = {
          enableHighAccuracy: false, //正確な位置情報を取得するか否か、消費電力多なので要注意
          timeout: 5000, //30秒でタイムアウト
          maximumAge: 5 * 60 * 1000, //位置情報の有効期限
          freaquency: 500 //一定間隔で位置情報を取得する際の間隔を指定、
                          //ただ取得できる位置情報が変わらなければ描写はしないらしい。実際に動いてみて検証するしかない。
                          //https://thinkit.co.jp/story/2012/05/18/3550?page=0%2C2
        };
        vm.count = 0;
        vm.id = navigator.geolocation.watchPosition(geoSuccess, geoError, geoOptions);
        if(vm.guideTrigger == false){
          vm.$emit('backToMap');
        }

      }
      else {
        vm.$ons.notification.alert({
          message: 'お使いの端末では、現在位置を取得できません。',
          title: ''
        });
      }
    },

    guide(){
      const vm = this;
      vm.$store.dispatch('guideTrigger') //falseに変える
      vm.renderer = new google.maps.DirectionsRenderer({
                      suppressMarkers: true
                    });
      vm.renderer.setMap(this.map);

      const start = vm.latlng;
      const goal = new google.maps.LatLng(vm.room.lat, vm.room.lng);
      const service = new google.maps.DirectionsService(); 
      const request = {
        origin:      start,
        destination: goal,
        travelMode: 'WALKING'
      };

      service.route(request, function(result, status){
        if (status === 'OK') {
          vm.$emit('backToMap');
          vm.renderer.setDirections(result); //取得したルート（結果：result）をセット
        }
        else{
          vm.$ons.notification.alert({
            message: '取得できませんでした：' + status,
            title: ''
          });
        }
      });
    },

    resetRoute(){
      if (this.renderer !== null){
        this.renderer.setMap(null);
      }
    }
  },

  watch:{
    successId: {
      handler(){
        if(this.successId == null){
          this.$emit('removeClass','direction','gps-mode');
          if(this.atRoomPage){
            this.$emit('addClass','direction','direct-mode');
          }
        }
        else{
          this.$emit('addClass','direction','gps-mode');
        }
      }
    },

    targetForDirectMode: {
      handler(){
          if(this.atRoomPage && this.successId == null){
            this.$emit('addClass','direction','direct-mode');
          }
          else{
            this.$emit('removeClass','direction', 'direct-mode');
          }
      }
    },

    directionTrigger:{
      handler(){
        const vm = this; 
        if(vm.atRoomPage){
          vm.$ons.notification.confirm({message: 'ルートを表示してもよろしいですか？', title: ''})
            .then(function(response){
              if(response == 1){
                vm.$store.dispatch('guideTrigger');
                vm.getPosition();
              }
            });
        }
        else {
          vm.$ons.notification.confirm({message: '現在地を取得してもよろしいですか？', title: ''})
            .then(function(response){
              if(response == 1){
                vm.getPosition();
              }
            });
        }
      }
    },

    latlng: {
      handler(){
        if(this.count == 1 && this.guideTrigger){
          this.guide();
        }
      }
    }

  }

}
</script>



<style lang="scss">

.direct-mode {
  background-color: #ff5757;

  .tabbar__button {
    color: #fff9f9;

    .tabbar__label {
      font-weight: 900;
    }
  }
}

.gps-mode {
  .tabbar__button {
    color: #ff5757;

    .ons-icon {
      border-radius: 50%;
      animation: pulse 1.3s infinite;
    }

    .tabbar__label {
      color: #5c5c5c;
    }
  }
}

@-webkit-keyframes pulse {
  0% {
    -webkit-box-shadow: 0 0 0 0 rgba(247, 163, 7, 0.4);
  }

  70% {
    -webkit-box-shadow: 0 0 0 15px rgba(247, 163, 44, 0);
  }

  100% {
    -webkit-box-shadow: 0 0 0 0 rgba(204, 163, 44, 0);
  }
}

@keyframes pulse {
  0% {
    -moz-box-shadow: 0 0 0 0 rgba(247, 163, 7, 0.4);
    box-shadow: 0 0 0 0 rgba(247, 163, 7, 0.4);
  }

  70% {
    -moz-box-shadow: 0 0 0 15px rgba(204, 163, 44, 0);
    box-shadow: 0 0 0 15px rgba(204, 163, 44, 0);
  }

  100% {
    -moz-box-shadow: 0 0 0 0 rgba(204, 163, 44, 0);
    box-shadow: 0 0 0 0 rgba(204, 163, 44, 0);
  }
}
</style>