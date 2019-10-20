<template>
    <v-ons-page>
      <ToolBar/>
      <div class="wrapper">
        <ImageForm/>
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
import ImageForm from './ImageForm.vue'
import FacilityForm from './FacilityForm.vue'
import DetailForm from './DetailForm.vue'

export default {

  name: 'RoomForm',
  components: {
    ToolBar,
    ImageForm,
    FacilityForm,
    DetailForm
  },
  
}
</script>