<template>
    <v-ons-page>
      <ToolBar/>
      <div class="wrapper">
        <PictureForm/>
        <FacilityForm/>
        <DetailForm/>
        <v-ons-button
          modifier="large"
        >
          投稿する
        </v-ons-button>
      </div>
    </v-ons-page>
</template>

<script>
import ToolBar from './ToolBar.vue'
import PictureForm from './PictureForm.vue'
import FacilityForm from './FacilityForm.vue'
import DetailForm from './DetailForm.vue'

export default {

  name: 'RoomForm',
  components: {
    ToolBar,
    PictureForm,
    FacilityForm,
    DetailForm
  },
  
}
</script>