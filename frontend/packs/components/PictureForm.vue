<template>




        <v-ons-card id="name-and-photo">
          <v-ons-list>
            <v-ons-list-header>名前</v-ons-list-header>
            <v-ons-list-item>
              <div class="center list-item__center">
                <v-ons-input placeholder="例) 渋谷ストリーム 2F" type="text" class="name-input"
                >
                </v-ons-input>
              </div>
            </v-ons-list-item>

            <v-ons-list-header>写真 (複数可)</v-ons-list-header>
            <v-ons-list-item>
              <div class="center list-item__center">

                <label for="file_photo">
                  <img src="packs/images/camera.png" id="camera">
                  <input type="file" multiple="multiple" id="file_photo" style="display: none;"
                  >
                </label>

              </div>
            </v-ons-list-item>
          </v-ons-list>
        </v-ons-card>





</template>

<script>


export default {

  name: 'PictureForm',


  
}
</script>

<style scoped lang="scss">

#name-and-photo {

  .name-input {
    width: 100%;
  }

  #camera {
    width: 1.5rem;
  }
}

</style>