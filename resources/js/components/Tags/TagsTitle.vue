<template>
<div v-if="loading" class="skeleton-wrapper">
     <div class="placeholder-glow d-flex justify-content-center mb-4">
<div class="placeholder col-4" style="height: 35px;"></div>

</div>
    </div>
<div class="row mb-4" v-else><div class="col-lg-12">
<h1 class="fw-bold text-center text-capitalize">{{tag.name}}</h1>
                                      </div></div>

</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
const slug = window.location.pathname.split('/').pop()
const tag = ref([])
const loading = ref(true)

const formatDate = (dateString) => {
  return new Date(dateString).toLocaleDateString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric'
  });
}
const formatViews = (count) => {
  if (count >= 1000000000) {
    return (count / 1000000000).toFixed(1) + 'B';
  }
  if (count >= 1000000) {
    return (count / 1000000).toFixed(1) + 'M';
  }
  if (count >= 1000) {
    return (count / 1000).toFixed(1) + 'K';
  }
  return count.toString();
};

onMounted(async () => {
  try {
    const response = await axios.get(`/api/tag/${slug}`)
    tag.value = response.data.tag;
    console.log(tag);
  } catch (error) {
    console.error('Error fetching categories:', error);
  } finally {
    loading.value = false;
  }
});
</script>
