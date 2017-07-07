<template>
  <div>
    <h1>APP</h1>
    <router-view></router-view>
  </div>
</template>

<script>
  // @flow
  "use strict"

  import {} from "./main.css"

  export default {
    // data() {
    //   return {
    //   }
    // },
    created() {
      this.$router.push("/")
    },
  }
</script>
