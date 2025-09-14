<template>
  <section class="p-6 bg-white rounded-xl shadow">
    <h2 class="text-xl font-semibold mb-4">Santé API</h2>
    <button class="px-4 py-2 rounded bg-black text-white" @click="check">Tester</button>
    <pre class="mt-4 bg-gray-100 p-4 rounded">{{ resp }}</pre>
  </section>
</template>

<script setup lang="ts">
import axios from 'axios'
import { ref } from 'vue'

const resp = ref('')
const base = import.meta.env.VITE_API_BASE_URL || 'http://localhost:8080'

async function check() {
  const { data } = await axios.get(`${base}/api/health`)
  resp.value = JSON.stringify(data, null, 2)
}
</script>