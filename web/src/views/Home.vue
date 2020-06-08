<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'
const axios = require( 'axios' ).default
export default {
  name: 'Home',
  components: {
    HelloWorld
  },
  data() {
    return {
      hello: "NO"
    }
  },
  mounted() {
    axios.get(`/api/v1/hello`).then((res)=>{
      this.hello = res.data
    })
  }
}
</script>
