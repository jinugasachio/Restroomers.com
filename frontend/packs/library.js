import Vue from 'vue'
import VueOnsen from 'vue-onsenui'
import { ValidationProvider } from 'vee-validate';
import { ValidationObserver } from 'vee-validate';
import { extend } from 'vee-validate';
import { required } from 'vee-validate/dist/rules';
import { email } from 'vee-validate/dist/rules';
import { min } from 'vee-validate/dist/rules';
import { confirmed } from 'vee-validate/dist/rules';

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
  'min', {
  ...min,
  message: '6文字以上で入力してください。'
})

extend(
  'confirmed', {
  ...confirmed,
  message: '同じ値を入力してください。'
})
