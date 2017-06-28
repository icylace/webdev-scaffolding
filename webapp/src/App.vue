<template>
  <div>
    <h1>YESLint</h1>
    <router-view></router-view>
    <!--
    <pre>
      {{ JSON.stringify(rules, undefined, 2) }}
    </pre>
    <table>
      <thead>
        <tr>
          <th>Rule:</th>
          <th>Description</th>
          <th>Category</th>
          <th>Recommended</th>
          <th>Fixable</th>
          <th>Deprecated</th>
          <th>Schema</th>
        </tr>
      </thead>
      <tbody>
        <tr is="app-rule" v-for="(rule, name) in rules" :name="name" :rule="rule"></tr>
      </tbody>
    </table>
    -->
  </div>
</template>

<script>
  // @flow
  "use strict"

  import {} from "./main.css"
  import rules from "../generated/rules"

  export default {
    data() {
      return {
        rules: rules,
      }
    },
    created() {
      this.$router.push("/")
    },
  }
</script>
