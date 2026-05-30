<template>

   <div v-if="loading" class="skeleton-wrapper">
  <PostSingleShimmer>
  </PostSingleShimmer>
</div>
  <div class="row m-0"  v-else-if="post && post.id"  >
                            <div class="col-lg-12 ">
 
                  <div class="row "  :key="post.id">
                            <div class="col-lg-12 pt-5 px-4 px-md-0">
                                <div class="row">
                                    <div class="col-lg-12 pb-4">
                                        <h1 class="fw-bold p-title">
                                        {{post.title}}
</h1>
                                    </div>
                                </div>
                         
                                <div class="row">
                                    <div class="col-lg-12 pb-4 d-flex align-items-center flex-wrap">
<span><a href="#" class="text-decoration-none d-flex text-dark"><span> <img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded rounded-circle p-img"
             alt="Post image"> </span> <span class="ms-2 ">{{post.author?.name}}</span></a></span>
<span class="badge rounded-pill bg-white text-dark py-2 px-3 border border-dark  ms-2">Follow</span>
<span class="text-muted ms-2">5 min read</span>
<span class="mx-2 text-muted">.</span>
<span class="text-muted">{{ formatDate(post.created_at) }}</span>
                                    </div>
                                </div>
                                <div class="row m-0">
                                    <div class="col-lg-12 px-4 py-2 border-top border-bottom ">
<div class="row">
<div class="col-6 d-flex align-items-center">
    <span class="text-muted d-flex align-items-center"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
</svg><span class="ms-1">1</span></span>
    <span class="ms-2 text-muted d-flex align-items-center"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
  <path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>
</svg><span class="ms-1"><FormatViews :views="post.top_level_comments_count"></FormatViews></span></span>
 <span class="text-muted d-flex align-items-center ms-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
</svg><span class="ms-1"><FormatViews :views="post.views_count"></FormatViews></span></span>
   
</div>
<div class="col-6 text-end">
<div class="dropdown p-0">
  <button class="border-0 bg-white text-muted" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
</svg>
  </button>
  <ul class="dropdown-menu ">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another action</a></li>
    <li><a class="dropdown-item" href="#">Something else here</a></li>
  </ul>
</div>
</div>
</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row pt-5">
                            <div class="col-lg-12 px-0 pt-1">
                                
                                    <div class="f-i position-relative">
                                        <img
                                         v-if="post.feature_image" 
      :src="'/storage/' + post.feature_image"
             class="img-fluid w-100 bg-light position-absolute top-0 left-0 bg-light h-100"
             alt="Post image"> 
              <img
      v-else 
      src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid w-100 position-absolute top-0 left-0  bg-light h-100"
             alt="Post image"> 
                                    </div>
                                 
                                <div class="row m-0 pb-2">
                                    <div class="fs-4 px-md-0  col-lg-12 pt-5 p-body px-4" v-html="post.body">

                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class="row ">
                            <div class="col-lg-12 px-4 px-md-0">
                            <ul type="none" class="d-flex p-0 m-0">

<li v-for="tags in post.tags"><a :href="'/tag/' + tags.slug" class="text-decoration-none fs-5"><p class="badge rounded-pill bg-light fw-normal text-dark border border-dark p-2 px-3 text-capitalize">{{tags.name}}</p></a></li>
</ul>
                            </div></div>    
                    </div>
                                </div>
                                                            <div class="row " v-else>No</div>    

</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
const slug = window.location.pathname.split('/').pop()
const post = ref([])
const loading = ref(true)

const formatDate = (dateString) => {
  return new Date(dateString).toLocaleDateString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric'
  });
}

onMounted(async () => {
  try {
    const response = await axios.get(`/api/posts/${slug}`)
    post.value = response.data
  } catch (error) {
    console.error('Error fetching posts:', error);
  } finally {
    loading.value = false;
  }
});
</script>
