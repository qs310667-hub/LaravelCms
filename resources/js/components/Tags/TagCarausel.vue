<template>
<div v-if="loading" class="skeleton-wrapper">
      <div class="skeleton-header">
        <div class="skeleton-avatar"></div>
        <div class="skeleton-author">
          <div class="skeleton-line" style="width: 120px"></div>
          <div class="skeleton-line" style="width: 80px"></div>
        </div>
      </div>
      <div class="skeleton-title"></div>
      <div class="skeleton-subtitle"></div>
      <div class="skeleton-image"></div>
      <div class="skeleton-text"></div>
      <div class="skeleton-text"></div>
      <div class="skeleton-text" style="width: 80%"></div>
    </div>
    <div class="swiper-wrapper" v-else-if="tags">
                                  
      <div class="swiper-slide"  v-for="tag in tags" :key="tag.id">
      
        <a :href="'/tag/' + tag.slug" class="text-decoration-none "><h4 class="m-0"><span class="border border-0 border-dark badge rounded-pill bg-light text-black fw-light text-capitalize">{{tag.slug}}</span></h4></a>
</div>
</div>
                                                                                        <div class="row " v-else><div class="text-center col-lg-12">No Posts Found</div></div>  
                                                                                          

</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
const slug = window.location.pathname.split('/').pop()
const tags = ref([])
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
    const response = await axios.get(`/api/tags`)
    tags.value = response.data
  } catch (error) {
    console.error('Error fetching categories:', error);
  } finally {
    loading.value = false;
  }
});
</script>
