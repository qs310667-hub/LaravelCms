<template>
<div v-if="loading" class="skeleton-wrapper">
  <TagShimmer></TagShimmer>
    </div>

 <ul type="none" class="p-0 d-flex flex-wrap gap-2" v-else-if="tags.data  && tags.data.length" >
                                  
    <li v-for="tag in tags.data"><a :href="'tag/' + tag.slug" class="text-capitalize"><span class="badge py-2 px-3 rounded-pill text-bg-light fw-light fs-14px">{{tag.name}}</span>
</a></li>

</ul>
<small v-else>
No Topics Found.
</small>
<div>

<small v-if="tags.total > 10">
<a href="/tags" class="text-capitalize h-t mt-2 text-decoration-none text-muted">{{"See all topics"}}
</a>
</small>
</div>
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
    console.log(response)
  } catch (error) {
    console.error('Error fetching categories:', error);
  } finally {
    loading.value = false;
  }
});
</script>
