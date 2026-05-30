<template>
    <div class="py-4">
                                <h1 class="fw-bold fs-1"><span class="text-muted">Results for</span> <b class="">{{query}}</b></h1>
                             </div>
                            <div class=" row  m-0 sticky-nav">
                             <div class="col-lg-12 px-0 border-bottom pt-2 pb-3">
                     <ul type="none" class=" d-flex ms-auto mt-2 mb-0 p-0">
                                <li class="nav-item "><a class="nav-link me-4  position-relative  " :href="'/search?q=' + query">Posts</a></li>
                                <li class="nav-item "><a class="nav-link me-4   position-relative " :href="'/search/categories?q=' + query">Categories</a></li>
                                <li class="nav-item "><a class="nav-link me-4   position-relative c-active" :href="'/search/tags?q=' + query">Tags</a></li>

</ul>
                 </div>
                 </div>
                 <div class="row pt-4 m-0">
                    <div class="col-12 p-0">
                    <div v-if="loading">
                    <small class="text-center d-block">Loading...</small>
                    </div>
                       <div v-else class="container p-0 mb-4">
                       <div>
<ul type="none" class="p-0 d-flex flex-wrap gap-2"  >
                                  
    <li  v-for="tag in tags.data" :key="tag.id"><a :href="'/tag/' + tag.slug" class="text-capitalize"><span class="badge py-2 px-3 rounded-pill text-bg-light fw-light fs-14px">{{tag.name}}</span>
</a></li>

</ul>
<div ref="infiniteScrollTrigger" style="height: 10px;"></div>
<div class="mt-4 d-flex justify-content-center">
  <small class="text-center m-auto d-block" v-if="loadMoreLoading">
  {{"Loading"}}
  </small>
  <button
      class="btn border border  m-auto"
      v-else-if="nextPageUrl"
      @click="loadMore"
    >

     {{ 'Load More' }}
    </button>
    </div>
</div>
</div>

                    </div>
                 </div>
                 
</template>

<script setup>
import { ref, onMounted , onUnmounted} from 'vue';
import axios from 'axios';
const urlParams = new URLSearchParams(window.location.search);
const query = urlParams.get('q');
const loading = ref(true);
const categories = ref([]);
const tags = ref([]);
const posts = ref([]);
const loadMoreLoading = ref(false);
const nextPageUrl = ref({});


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
const fetchtags = async (url = null) => {
 
  try {
     const apiUrl = url || `/api/search/tags`;
    const response = await axios.get(apiUrl ,  {   // leading slash!
      params: { q: query },
    });
    if(!url){
        tags.value = response.data.tags;

    }else{
tags.value.data = [...tags.value.data, ...response.data.tags.data];
    }
   
    posts.value = response.data.posts;
    categories.value = response.data.categories;
    nextPageUrl.value = response.data.tags.next_page_url;

  console.log(response);
  } catch (error) {
    console.error('Error fetching categories:', error);
  }finally{
      loading.value = false;

  }
}
onMounted(async () => {
 fetchtags(); // Wait for tags to load first
});

const loadMore = async () => {
      if (nextPageUrl.value) {
          
         loadMoreLoading.value = true; 
        await fetchtags(nextPageUrl.value);
         loadMoreLoading.value = false; 
         
      }
    };
  
</script>
