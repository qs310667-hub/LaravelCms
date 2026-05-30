<template>
    <div class="pt-md-5 col-md-8 px-0 px-md-4">
                            <div class="row m-0">
                                <div class="col-lg-12 p-0 mx-auto max-w-768px">

                             <div class="row m-0 d-none d-md-block">
                                <div class="col-lg-12 px-0 pb-2">
<h1 class="text-capitalize fw-bold u-t fs-1">{{posts.name}}</h1>
                                </div>
                             </div>
                            <div class=" row  m-0">
                             <div class="col-lg-12 px-0 border-bottom pt-2 pb-3">
                     <ul type="none" class=" d-flex ms-auto mt-2 mb-0 p-0">
                                <li class="nav-item "><a class="nav-link me-4  position-relative  c-active" href="#!">Home</a></li>
                                <li class="nav-item "><a class="nav-link me-4   position-relative" href="#!">About</a></li>
</ul>
                 </div>
                 </div>
                 <div class="row pt-4 m-0">
                    <div class="col-12 p-0">
                      <div class="container-md p-0 mb-4" v-for="post in posts.posts" :key="post.id">
                                                                 <a :href="post.slug" class="text-decoration-none d-block text-dark">

  <div class="card border-0 medium-card">
    <div class="row g-0 align-items-center">
      
      <!-- Text Content -->
      <div class="col-9 ps-0">
        <div class="card-body px-0">
          

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
</div>
                    </div>
                 </div>
                    </div>
                            </div>
                        </div>
                        <div class="col-md-4 md-border-start px-md-5 pt-5 pt-md-0  max-w-368px">
                         <div class="row pt-md-5 mb-4">
                            <div class="col-lg-12 px-0">
                            
                            <div class="row m-0">
                                <div class="col-lg-12 p-0">
                                     <div class="row m-0 mb-2 mb-md-4">
                                        <div class="col-lg-12 p-0 d-flex d-md-block">
                                            <img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded rounded-circle u-img mb-3"
             alt="Post image">
             <div class="ms-3 m-md-0">
                                                  <p class="fw-bold mb-2">{{posts.name}}</p>
                                                   <a href="#" class="text-decoration-none text-muted">123 Followers</a>
                                                    </div>

                                        </div>
                                     </div>
                                     <div class="row m-0">
                                        <div class="col-lg-12 p-0">
                                            <a class="rounded-pill text-center px-3 d-block d-md-inline py-2 bg-dark text-light text-decoration-none" href="#">
                                                <span class="text-decoration-none fw-medium">Follow</span></a>
                                        </div>
                                     </div>
                                   
                                </div>
                            </div>
                            </div>
                         </div>
                         
                        </div>
              
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
const formatDate = (dateString) => {
  return new Date(dateString).toLocaleDateString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric'
  });
}
const slug = window.location.pathname.split('/').pop()

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

onMounted(async () => {
  try {
    const response = await axios.get(`api/user/${slug}`); // Fetch from your API route
    posts.value = response.data;
  } catch (error) {
    console.error('Error fetching posts:', error);
  }
});
</script>
