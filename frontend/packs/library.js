import Vue from 'vue'
import VueOnsen from 'vue-onsenui'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate';
import { required, email, max, min, confirmed } from 'vee-validate/dist/rules';

Vue.use(VueOnsen);
Vue.component('ValidationProvider', ValidationProvider);
Vue.component('ValidationObserver', ValidationObserver);
Vue.component('star-rating', VueStarRating.default);

// rules for Veevalidate
extend(
  'required', {
    ...required,
    message: '必須項目です。'
  });

extend(
  'email', {
  ...email,
  message: '有効な形式で入力してください。'
})

extend(
  'max', {
  ...max,
  message: '20文字以内で入力してください。'
})

extend(
  'min', {
  ...min,
  message: '6文字以上で入力してください。'
})

extend(
  'confirmed', {
  ...confirmed,
  message: '上記と同じ値を入力してください。'
})
