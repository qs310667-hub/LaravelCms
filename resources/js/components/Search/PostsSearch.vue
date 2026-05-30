<template>
     <div class="py-4">
                                <h1 class="fw-bold fs-1"><span class="text-muted">Results for</span> <b class="">{{query}}</b></h1>
                             </div>
                            <div class=" row  m-0 sticky-nav">
                             <div class="col-lg-12 px-0 border-bottom pt-2 pb-3">
                     <ul type="none" class=" d-flex ms-auto mt-2 mb-0 p-0">
                               <li class="nav-item "><a class="nav-link me-4  position-relative c-active " :href="'/search?q=' + query">Posts</a></li>
                                <li class="nav-item "><a class="nav-link me-4   position-relative " :href="'/search/categories?q=' + query">Categories</a></li>
                                <li class="nav-item "><a class="nav-link me-4   position-relative" :href="'/search/tags?q=' + query">Tags</a></li>

</ul>
                 </div>
                 </div>
                 <div class="row pt-4 m-0">
                    <div class="col-12 p-0">
                    <div v-if="loading">
                    <small class="text-center d-block">Loading...</small>
                    </div>
                       <div v-else class="container p-0 mb-4" v-for="post in posts.data" :key="post.id">
                                                                 <a :href="'/posts/' + post.slug" class="text-decoration-none d-block text-dark">

  <div class="card border-0 medium-card">
    <div class="row g-0 align-items-center">
      
      <!-- Text Content -->
      <div class="col-9 ps-0">
        <div class="card-body px-0">
          <small class="text-muted text-capitalize link-area">
            <span v-if="post.category">In The <a :href="'/category/' + post.category.slug" class="text-decoration-none text-capitalize text-dark ">{{post.category.slug}}</a> by </span><a :href="'@' + post.author?.slug" class=" text-dark text-decoration-none text-capitalize link-underline-opacity-0 link-underline-opacity-100-hover">{{ post.author.name }}</a>
          </small>

          <h5 class="card-title mt-2 fw-bold">
{{ post.title }}   
       </h5>

        
           <div class="card-text text-muted" v-html="post.body"></div>
        

          <div class="d-flex align-items-center text-muted small">
            <span>{{ formatDate(post.created_at) }}</span>
            <span class="mx-2">•</span>
            <span>{{ formatViews(post.views_count) }} views</span>
            <span class="mx-2">•</span>
            <span>29 comments</span>
          </div>
        </div>
      </div>

      <!-- Image -->
      <div class="col-3 text-end img-post position-relative">
      <img 
      v-if="post.feature_image" 
      :src="'/storage/' + post.feature_image" 
      :alt="post.title"
      class="img-fluid position-absolute top-0 left-0 w-100 h-100"
    />
        <img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             v-else
             class="img-fluid position-absolute top-0 left-0 w-100 h-100"
             alt="Post image">
      </div>

    </div>
  </div>
  </a>

  <div class="mt-4 d-flex justify-content-center">
  <small class="text-center m-auto d-block" v-if="loadMoreLoading">
  {{"Loading"}}
  </small>
  </div>
</div>

                    </div>
<div ref="infiniteScrollTrigger" style="height: 10px;"></div>

                 </div>
</template>

<script setup>
import { ref, onMounted , onUnmounted } from 'vue';
import axios from 'axios';
const urlParams = new URLSearchParams(window.location.search);
const query = urlParams.get('q');
const loading = ref(true);
const categories = ref([]);
const tags = ref([]);
const loadMoreLoading = ref(false);
const infiniteScrollTrigger = ref(null);
const observer = ref(null);
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
const posts = ref([]);
const fetchposts = async (url = null) => {
try {
      const apiUrl = url || `/api/search/posts`;
    const response = await axios.get(apiUrl ,  {   // leading slash!
      params: { q: query },
    });
    if(!url){
    posts.value = response.data.posts;

    }else{
 posts.value.data = [...posts.value.data, ...response.data.posts.data];
    }
   
    
    categories.value = response.data.categories;
    tags.value = response.data.tags;
    nextPageUrl.value = response.data.posts.next_page_url;

  console.log(posts.value);
  } catch (error) {
    console.error('Error fetching posts:', error);
  }finally{
      loading.value = false;

  }
}
onMounted(async () => {
  await fetchposts(); // Wait for tags to load first
  
  observer.value = new IntersectionObserver((entries) => {
    if (entries[0].isIntersecting && nextPageUrl.value && !loadMoreLoading.value) {
      loadMore();
    }
  }, { threshold: 0.5 });
  
  if (infiniteScrollTrigger.value) {
    observer.value.observe(infiniteScrollTrigger.value);
  }
});
const loadMore = async () => {
      if (nextPageUrl.value) {
          
         loadMoreLoading.value = true; 
        await fetchposts(nextPageUrl.value);
         loadMoreLoading.value = false; 
         
      }
    };
    onUnmounted(() => {
  if (observer.value) {
    observer.value.disconnect();
  }
});
</script>
