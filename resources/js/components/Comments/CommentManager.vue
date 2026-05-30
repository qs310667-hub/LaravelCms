<!-- resources/js/components/CommentsManager.vue -->
<template>

    <div  v-if="loading">
    <div class="row">
    <div class="col-lg-12 px-4">
    <CommentShimmer></CommentShimmer>
    </div>
    </div>
    
    </div>
  
  <div v-else class="row c-con pb-5">
  <div class="col-lg-12">
    <h1 v-for="comment in comments">Comments <b>({{comment.total}})</b></h1>

    <div class="row margin-top-comm pb-40px border-b border-light" v-if="props.user">
      <div class="col-lg-12 px-0">
        <div class="row">
          <div class="col-lg-12">
            <div class="d-flex align-items-center mb-3">
              <span> <img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
                   class="img-fluid rounded-circle"
                   height="32"
                   width="32"
                   alt="Post image"></span>
              <span class="ml-3 fs-14px">User name</span>
            </div>
          </div>
        </div> 
        <div class="row">
          <div class="col-lg-12">
            <!-- Trigger button -->
            <span v-if="!isCollapseOpen" 
                  class="fs-14px transition0-3s bg-light rounded-md py-2 px-3 text-muted d-block cursor-text" 
                  @click="openCollapse">
              What are your thoughts?
            </span>
            
            <!-- Collapsible form -->
            <div v-if="isCollapseOpen" class="transition0-3s">
              <form @submit.prevent="submitComment">
                <textarea 
                  id="comment" 
                  v-model="form.comment" 
                  class="form-control shadow-none fs-14px"
                  :class="{ 'is-invalid': errorMessagecomment }"
                  placeholder="What are your thoughts?"
                  autofocus
                  ref="textareaRef"
                ></textarea>
                
                <div v-if="errorMessagecomment" class="text-danger small mt-1">
                  {{ errorMessagecomment }}
                </div>

                <div class="d-flex justify-content-end mt-3">
                  <button 
                    type="button"
                    class="fs-14px btn border-0 outline-0 text-decoration-underline bg-transparent" 
                    @click="closeCollapse">
                    Cancel
                  </button>
                  <button 
                    class="fs-14px btn btn-dark border-0 outline-0 text-decoration rounded rounded-pill ml-2" 
                    type="submit"
                    :disabled="isSubmitting">
                    <span v-if="isSubmitting">Submitting...</span>
                    <span v-else>Submit</span>
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
     
    </div>
     <div class="row margin-top-comm pb-40px border-b border-light" v-else>
     <div class="col-lg-12">
     <div class="d-flex justify-content-center ">
      <a href="/login" class="btn btn-dark text-center rounded-0 btn-md">Login to comment</a>
      </div>

      </div>
      </div>
<div v-for="comment in comments">
<div v-if="comment.data && comment.data.length">

    <CommentItem
      
      v-for="comment in comments"
      :user="props.user"
      :key="comment.id"
      :comment="comment"
      :refresh-comments="fetchComments"
    />
    </div>
<div v-else class="p-5"><p class="m-0 p-0 text-center">No Comments Found</p></div>
    </div>
    <div class="d-flex justify-content-center align-items-center pb-4">
    
      <div v-if="loadMoreLoading" class="row w-100">
       
    <div class="col-lg-12 px-4">
      <CommentShimmer></CommentShimmer></div>
    </div>

     <button
      class="btn border border "
      v-else-if="nextPageUrl"
      @click="loadMore"
    >

     {{ 'Load More' }}
    </button>
    

    </div>
  </div>


    </div>



</template>

<script setup>
import { ref, onMounted, nextTick } from 'vue';
import CommentItem from './CommentItem.vue';
import axios from 'axios';

const slug = window.location.pathname.split('/').pop();
const props = defineProps({
    user: {
        type: Object,
        default: null
    },
   
});
const comments = ref([]);
const form = ref({
  comment: '',
  reply_id: '',
});
const errorMessagecomment = ref('');
const isCollapseOpen = ref(false);
const loading = ref(true);
const isSubmitting = ref(false);
const textareaRef = ref(null);
const nextPageUrl = ref(null);
const loadMoreLoading = ref(false);
const fetchComments = async (url = null) => {
  try {
     const apiUrl = url || `/api/posts/comments/${slug}`;
    const response = await axios.get(apiUrl);
    if(!url){
    comments.value = response.data;
    }else{
     comments.value.push(...response.data);

    }
          // Store the URL for the next page
          nextPageUrl.value = response.data[0].next_page_url;
  } catch (error) {
    console.error("Error fetching comments:", error);
  }finally{
  loading.value = false;
  }
};

// Open collapse and focus textarea
const openCollapse = async () => {
  isCollapseOpen.value = true;
  await nextTick();
  if (textareaRef.value) {
    textareaRef.value.focus();
  }
};

// Close collapse and reset
const closeCollapse = () => {
  isCollapseOpen.value = false;
  form.value.comment = '';
  errorMessagecomment.value = '';
};

const submitComment = async () => {
  // Quick validation
  if (!form.value.comment.trim()) {
    errorMessagecomment.value = 'Comment cannot be empty';
    return;
  }

  errorMessagecomment.value = '';
  isSubmitting.value = true;
  
  try {
    await axios.post(`/api/posts/comments/submitcomment/${slug}`, form.value);
    
   
  
    
    // Refresh comments
    await fetchComments();
       
  } catch (error) {
    // Keep open and show error
    errorMessagecomment.value = error.response?.data?.errors?.comment?.[0] || 'Failed to post comment';
  } finally {
    isSubmitting.value = false;
    isCollapseOpen.value = false;
     // Clear and close immediately on success
    form.value.comment = '';
  }
};
const loadMore = async () => {
      if (nextPageUrl.value) {
         loadMoreLoading.value = true; 
        await fetchComments(nextPageUrl.value);
         loadMoreLoading.value = false; 
      }
    };
onMounted(fetchComments);
</script>
