<template>
<div v-if="Loading" class="p-0">
<PostListShimmer ></PostListShimmer>
</div>
 <div class="container p-0"  v-else-if="posts.data && posts.data.length">

                       <div class=" c-a px-0 mb-20px border-bottom pb-20px" v-for="post in posts.data" :key="post.id">
                                                                 <a :href="'posts/' + post.slug" class="text-decoration-none d-block text-dark">

  <div class="card border-0 medium-card">
    <div class="row g-0 align-items-center">
      
      <!-- Text Content -->
      <div class="col-9 ps-0">
        <div class="card-body p-0">
          <small class="text-muted text-capitalize link-area mb-3">
            <span v-if="post.category">In The <a :href="'/category/' + post.category.slug" class="text-decoration-none text-capitalize text-dark ">{{post.category.slug}}</a>
            </span>
          </small>

          <h5 class="card-title mt-2 fw-bold">
{{ post.title }}   
       </h5>

        
           <div class="card-text text-muted" v-html="post.body"></div>
        

          <div class="d-flex align-items-center text-muted small mt-3">
            <span>{{ formatDate(post.created_at) }}</span>
            <span class="mx-2">•</span>
            <span><FormatViews :views="post.views_count"></FormatViews> views</span>
            <span class="mx-2">•</span>
            <span><FormatViews :views="post.top_level_comments_count"></FormatViews> Comments</span>
          </div>
        </div>
      </div>

      <!-- Image -->
      <div class="col-3 text-end img-post position-relative">
      <img 
      v-if="post.feature_image" 
      :src="'/storage/' + post.feature_image" 
      :alt="post.title"
      class="img-fluid position-absolute top-0 left-0 w-100 h-100 bg-light"
    />
    
        <img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             v-else
             class="img-fluid position-absolute top-0 left-0 w-100 h-100"
             alt="Post image">
      </div>

    </div>
  </div>
  
  </a>
</div>
   
</div>
<div v-else>
   <p class="text-center text-muted">No Posts Found.</p>
   </div>
 <div class="mt-4 d-flex justify-content-center">
  <small class="text-center m-auto d-block" v-if="loadMoreLoading">
  {{"Loading"}}
  </small>
  </div>
  
<div ref="infiniteScrollTrigger" style="height: 10px;"></div>

</template>

<script setup>
import { ref, onMounted , onUnmounted, watch } from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';
const loadMoreLoading = ref(false);
const Loading = ref(true);
const infiniteScrollTrigger = ref(null);
const observer = ref(null);
const nextPageUrl = ref({});
const posts = ref([]);
const route = useRoute();

const formatDate = (dateString) => {
  return new Date(dateString).toLocaleDateString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric'
  });
}

const fetchposts = async (url = null) => {
  try {
       const hasFeatured = window.location.search.includes('feed=featured');
       let apiUrl;
       if(hasFeatured){
       apiUrl = url || `/api/posts?feed=featured`;

       }else{
       apiUrl = url || `/api/posts`;

       }
    const response = await axios.get(apiUrl);
    if(!url){
    posts.value = response.data;
    }else{
 posts.value.data = [...posts.value.data, ...response.data.data];
    }
    nextPageUrl.value = response.data.next_page_url;
  } catch (error) {
    console.error('Error fetching posts:', error);
  }finally{
   Loading.value = false;

  }
}
watch(() => route.query.feed, () => {
  Loading.value = true;
  posts.value = [];
  nextPageUrl.value = null;
  fetchposts();
}, { immediate: true });

onMounted(async () => {
  console.log("YES");
   await fetchposts();
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
