<template>
  <div>
    <div class="danger">
      <div class="form-container">
        <div class="form-item form-submit">
          <div class="form-subitem" @click="$refs.submit.click()">
            <button ref="submit" @click="submit">Submit</button>
          </div>
        </div>
      </div>
    </div>
    <p>{{ result }}</p>
  </div>
</template>

<script>
  // @flow
  "use strict"

  export default {
    data() {
      return {
      }
    },
    methods: {
      submit() {
      },
    },
  }
</script>
