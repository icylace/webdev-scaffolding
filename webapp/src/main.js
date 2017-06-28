// @flow
"use strict"

import Vue from "vue"
import VueRouter from "vue-router"
import App from "./App.vue"
import { routes } from "./routes"

Vue.use(VueRouter)

const router = new VueRouter({
  routes,
  mode: "history",
})

new Vue({
  el: "#app",
  router,
  render: h => h(App),
})






// Vue.component("app-rule-option", {
//   template: `
//     <div class="form-control">
//
//       <pre>{{ name }}: {{ JSON.stringify(option, null, 2) }}</pre>
//
//     </div>
//   `,
//   props: ["name", "option"],
// })
//
// Vue.component("app-rule", {
//   template: `
//     <tr>
//       <td>
//         <p>{{ name }}</p>
//       </td>
//       <!--
//       <td>
//         <p>{{ rule.description }}</p>
//       </td>
//       <td>
//         <p>{{ rule.category }}</p>
//       </td>
//       <td>
//         <p v-if="rule.recommended" style="color: green">√</p>
//       </td>
//       <td>
//         <p v-if="rule.fixable" style="background-color: yellow">{{ rule.fixable }}</p>
//       </td>
//       <td>
//         <div v-if="rule.deprecated" style="color: purple">
//           <p>√ : replaced by {{ rule.replacedBy }}</p>
//         </div>
//       </td>
//       -->
//       <td>
//         <table>
//           <tr>
//             <td v-for="(value, key) in rule.schema" valign="top">
//               <app-rule-option :name="key" :option="value"></app-rule-option>
//             </td>
//           </tr>
//         </table>
//       </td>
//     </tr>
//   `,
//   props: ["name", "rule"],
// })

// Vue.component("field", {
//   template: `
//     <input :value="x" @input="$emit("input", $event.target.value)">
//   `,
//   props: ["x"],
// })

// new Vue({
//   el: "#app",
//   data: {
//     rules: {},
//   },
//   created() {
//     fetch("/rules.json")
//       .then(response => response.json())
//       .then(data => this.rules = data)
//   },
//   methods: {
//     ruleUrl(ruleName) {
//       return "http://eslint.org/docs/rules/" + ruleName
//     },
//   },
// })












// (function ($) {
//   $(function () {
//     $('html').removeClass('no-js');
//   });
// })(window.jQuery);
