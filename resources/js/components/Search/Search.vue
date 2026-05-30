<template>
    <div class="row"><div class="input-c position-relative ">
    <div class="input-group search-wrapper bg-light ms-4 flex-nowrap">
  <span class="input-group-text " id="basic-addon1">
    <i class="bi bi-search"></i>
  </span>
  <form @submit.prevent="handleSearch">
  <input type="text"  v-model="searchQuery"
        @input="onInput" class="form-control  border-0 bg-transparent search-input" placeholder="Search..." aria-label="Search" aria-describedby="basic-addon1">
  <button type="submit" class="d-none"></button>
  </form>
</div>
    <div class="bg-white py-4 px-3 ab-s position-absolute top-100 ms-4 left-4 shadow" 
    v-if="container"
    >
 
    <div v-if="loading">
    <small>{{"Loading..."}}</small>
    </div>
    <div v-else-if="posts && posts.length || tags && tags.length || categories && categories.length ">
    <div v-if="posts && posts.length">
    <div class="pb-2">
   <small class="text-muted">Topics</small>
   </div>
   <div class="border-top py-2" >
   
   <small v-for="post in posts"><a :href="post.slug" class="d-block py-1 text-capitalize text-decoration-none text-dark ">{{post.title}}</a></small>
   </div>
   </div>
      <div  v-if="tags && tags.length">
    <div class="" >
   <small class="text-muted">Tags</small>
   </div>
   <div class="border-top py-2">
   <small v-for="tag in tags"><a :href="'/tag/' + tag.slug" class="d-block py-1 text-capitalize text-decoration-none text-dark ">{{tag.name}}</a></small>
   </div>
   </div>
     <div v-if="categories && categories.length">
    <div class="" >
   <small class="text-muted">Categories</small>
   </div>
   <div class="border-top py-2">
   <small v-for="category in categories"><a :href="'/category/' + category.slug" class="d-block py-1 text-capitalize text-decoration-none text-dark ">{{category.name}}</a></small>
   </div>
   </div>
    </div>
    <div v-else>
    <small>{{"Nothing found..."}}</small>
    </div>
    </div>  

    </div></div>  
                                                                                          

</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
const slug = window.location.pathname.split('/').pop()
const loading = ref(false);          // start false
const searchQuery = ref('');
const container = ref(false);
const posts = ref([]);
const tags = ref([]);
const categories = ref([]);
const debounceTimer = ref(null);
let currentController = null;

const onInput = () => {
  // Immediately show dropdown and spinner if there is text
  if (searchQuery.value.length >= 1) {
    container.value = true;
    loading.value = true;            // 👈 start spinner right away
  } else {
    // Empty query: hide everything
    container.value = false;
    loading.value = false;
    posts.value = [];
    tags.value = [];
    categories.value = [];
    return;
  }

  // Cancel any pending request
  if (currentController) {
    currentController.abort();
  }

  // Clear previous debounce timer
  if (debounceTimer.value) {
    clearTimeout(debounceTimer.value);
  }

  // Set new timer
  debounceTimer.value = setTimeout(() => {
    liveSearch();
  }, 300);
};

const liveSearch = async () => {
  // Don't clear results here – keep previous ones visible while loading
  if (searchQuery.value.length < 1) return;

  // Create abort controller for this request
  currentController = new AbortController();
  const signal = currentController.signal;
  let wasCancelled = false;

  try {
    const response = await axios.get('/api/search', {   // leading slash!
      params: { q: searchQuery.value },
      signal,
    });

    posts.value = response.data.posts || [];
    tags.value = response.data.tags || [];
    categories.value = response.data.categories || [];
  } catch (error) {
    if (axios.isCancel(error)) {
      wasCancelled = true;          // request was cancelled
    } else {
      console.error(error);
    }
  } finally {
    // Only turn off loading if this request completed (not cancelled)
    if (!wasCancelled) {
      loading.value = false;
    }
    currentController = null;
  }
};

const handleSearch = () => {
  if (searchQuery.value.length >= 1) {
    window.location.href = `/search?q=${encodeURIComponent(searchQuery.value)}`;
  }
};
</script>
