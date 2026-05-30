<!-- resources/js/components/CommentItem.vue -->
<template>
    <!-- Toast Container (positioned top-right) -->
    <div class="toast-container position-fixed top-0 end-0 p-3 w-100">
        <!-- The Toast Component -->
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header p-0">
            </div>
            <div class="toast-body alert alert-success m-0 d-flex justify-content-between">
                                <span>{{successMessage}}</span>

                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>

            </div>
        </div>
    </div>
    
    <div class="c-main">
  <div class=" comment-item border-top border-light " v-for="comment in (comment?.data || comment)">
    <div class="comment-content pt-25px pb-16px">
      <!-- Display comment user and content -->
       <div class="row" >
      <div class="col-lg-12 ">
        <div class="row mb-2">
      <div class="col-lg-12 ">
     <div class="d-flex justify-content-between align-items-center">
    <div>
      <div  class="d-flex align-items-center"><img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded-circle"
             height="32"
             width="32"
             alt="Post image">
             <span class="fs-14px ml-3">
<span class="text-capitalize">{{comment.user.name}}</span>
 <div><small class="text-muted">{{ formatDate(comment.created_at) }}</small></div>
 </span>
</div>
     
      </div>
      
     <div v-if="props.user"><div class="dropdown">
  <button class=" btn border-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
</svg>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#" @click.prevent="editComment(comment)">Edit</a></li>
    <li><a class="dropdown-item text-danger" href="#" data-bs-toggle="modal" :data-bs-target="'#deleteModal' + comment.id">
    Delete
    </a></li>
  </ul>
</div></div>
      </div>
      
      </div>
      
      </div>
      

<!--Delete Modal -->
<div class="modal fade" :id="'deleteModal' + comment.id" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <span>Are you Sure?</span>
      </div>
      <div class="modal-footer">
        <form @submit.prevent="deleteComment(comment.id)" class="d-flex gap-2">

        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
        <button 
            type="submit" 
            class="btn btn-dark" 
            :disabled="deletingStates[comment.id]"
          >
            <span v-if="deletingStates[comment.id]" class="spinner-border spinner-border-sm me-2"></span>
            {{ deletingStates[comment.id] ? 'Deleting...' : 'Delete' }}
          </button>
</form>
      </div>
    </div>
  </div>
</div>
       <div class="row mb-2">
      <div class="col-lg-12 ">
         <form v-if="editingCommentId === comment.id" @submit.prevent="updateComment(comment.id)">
                         <div class="form-control p-0 border-0 mb-2">
                    <textarea action="" id="comment" v-model="form.comment"  class="form-control"></textarea>
</div>
 <div class="d-flex justify-content-between ">
 <div>

 </div>
 <div class="d-flex align-items-center gap-2">
                      <button type="button" class="text-dark p-0 text-decoration-none" @click="cancelEdit(comment)">Cancel</button>
                    <button 
            type="submit" 
            class="btn btn-dark" 
            :disabled="updatingStates[comment.id]"
          >
            <span v-if="updatingStates[comment.id]" class="spinner-border spinner-border-sm me-2"></span>
            {{ updatingStates[comment.id] ? 'Updating...' : 'Update' }}
          </button>
                    </div>
</div>
                    </form>
                         <div v-else v-html="comment.text" class="fs-14px"></div>

      </div>
      
      </div>
      
      </div>
      
      </div>
      
     
      <div class="d-flex gap-2">
      <button v-if="user"   class="fs-14px p-0 text-decoration-underline btn btn-transparent text-muted cursor-text text-dark" data-bs-toggle="collapse" :data-bs-target="'#collapseExample' + comment.id" aria-expanded="false" :aria-controls="'collapseExample' + comment.id">
Reply </button>
  <button v-if="comment?.replies?.length ?? comment?.replies_count" class="fs-14px p-0 text-decoration-underline btn btn-transparent text-muted cursor-text text-dark" data-bs-toggle="collapse" @click="fetchreplies(comment.id)" :data-bs-target="'#collapseExamplereply' + comment.id" aria-expanded="false" :aria-controls="'collapseExample' + comment.id">
Replies {{ comment?.replies?.length ?? comment?.replies_count ?? 0 }} </button>
 </div>
    </div>

    <!-- Reply Form (add logic for submission) -->
<div  class="  "
>
    <div class="collapse collapsec mt-3 transition0-3s replies-container mb-0" :id="'collapseExample' + comment.id">


                 
                    
                     <form @submit.prevent="submitCommentreply(comment.id)" class="mb-3">
                         <div class="form-control p-0 border-0 mb-2">
                    <textarea action="" id="comment" v-model="form.comment"  class="form-control"                   :class="{ 'is-invalid': errorMessagecomment[comment.id]  }"
></textarea>
 <div v-if="errorMessagecomment[comment.id]" class="text-danger small mt-1">
                  {{ errorMessagecomment[comment.id] }}
                </div>
</div>
 <div class="d-flex justify-content-between ">
 <div>

 </div>
 <div class="d-flex gap-2 align-items-center">
                      <a href="#" class="text-dark p-0 text-decoration-none"  data-bs-toggle="collapse" :data-bs-target="'#collapseExample' + comment.id" aria-expanded="false" aria-controls="collapseExample">Cancel</a>
  <button 
            type="submit" 
            class="btn btn-dark" 
            :disabled="submittingStates[comment.id]"
          >
            <span v-if="submittingStates[comment.id]" class="spinner-border spinner-border-sm me-2"></span>
            {{ submittingStates[comment.id] ? 'Submitting...' : 'Submit' }}
          </button>
                              </div>
</div>
                    </form>
</div>

    <!-- Recursively render replies if they exist -->
      
    <div  class="replies-container collapse" :id="'collapseExamplereply' + comment.id">
 <div v-if="loadingReplies[comment.id] && !replies[comment.id]?.data?.length">
      <p class="text-center"><CommentShimmer></CommentShimmer></p>
    </div>
    <div v-else-if="replies[comment.id] && replies[comment.id].data && replies[comment.id].data.length">
      <CommentItem
        v-if="replies[comment.id]"
        :comment="replies[comment.id]"
        :refresh-comments="refreshComments"
        :refresh-replies="() => fetchreplies(comment.id)"
        :all-replies="replies"
        :user="props.user"
      />
 
      <div class="d-flex align-items-center justify-content-center ">
       <div v-if="loadMoreLoading[comment.id]" class="shimmer-load-more">
       <CommentShimmer></CommentShimmer>
      </div>
     <button
     class="btn border border mb-4"
      v-else-if="nextPageUrl[comment.id]"
      @click="loadMore(comment.id)"
    >
      {{ 'Load More' }}
    </button>
    
    </div>
    </div>
    </div>
  </div>
        </div>

  </div>
</template>

<script setup>
import { ref , onMounted } from 'vue';
import axios from 'axios';

const slug = window.location.pathname.split('/').pop()
const deletingStates = ref({});
const submittingStates = ref({});
const updatingStates = ref({});
const editingCommentId = ref(null);
const  commentId = ref(null);
const  test = ref({});

const  replies = ref({});
const editText = ref(null);
const nextPageUrl = ref({});
const loadMoreLoading = ref({});
const loadingReplies = ref({});
const loadingMoreReplies = ref({}); // Track loading state for each comment's replies
const replyPagination = ref({}); // Store pagination data per comment
const showReplies = ref({}); // Track which reply sections are visible
   const formatDate = (dateString) => {
  return new Date(dateString).toLocaleDateString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric'
  });
}

const fetchreplies = async (commentId, url = null) => {
  loadingReplies.value[commentId] = true;
  try {
     const apiUrl = url || `/api/posts/comments/${commentId}/replies`;
    const response = await axios.get(apiUrl);
    console.log(response)
    if(!url){
    replies.value[commentId] = response.data;
    console.log(replies);
    }else{
const newReplies = response.data.data || response.data;
replies.value[commentId].data = [...replies.value[commentId].data, ...newReplies];

    }


    test.value[commentId] = "YES";
          // Store the URL for the next page
          nextPageUrl.value[commentId] = response.data.next_page_url;
          console.log(replies.value[commentId])
  } catch (error) {
    console.error("Error fetching comments:", error);
  }finally{
      loadingReplies.value[commentId] = false;

  }
};


const loadMore = async (commentId) => {
      if (nextPageUrl.value[commentId]) {
          
         loadMoreLoading.value[commentId] = true; 
        await fetchreplies(commentId ,nextPageUrl.value[commentId]);
         loadMoreLoading.value[commentId] = false; 
         
      }
    };
const editComment = (comment) => {
  editingCommentId.value = comment.id;
  form.value.comment = comment.text;
};
const cancelEdit = () => {
  editingCommentId.value = null;
  editText.value = '';
};

const props = defineProps({
     user: {
        type: Object,
        default: null
    },
  comment: Object,
  refreshComments: Function,  // This is the function from parent
  refreshReplies: Function,
  allReplies: Object,
});
const form = ref({
  comment: '',
  reply_id: '',
});
const activeError = ref({
  formId: null,
  message: ''
});
const successMessage = ref('');
const errorMessagecomment = ref({});

const submitCommentreply = async (replyId = null) => {
 
  successMessage.value = '';
  submittingStates.value[replyId] = true;
  try {
    form.value.reply_id = replyId;
    // Send POST request to your Laravel endpoint
    const response = await axios.post(`/api/posts/comments/submitcomment/${slug}`, form.value);
    await props.refreshComments();
    if (props.refreshReplies) {
      await props.refreshReplies();
    }
    const replyCollapse = document.getElementById(`collapseExamplereply${replyId}`);
  if (replyCollapse) {
      const isOpen = replyCollapse.classList.contains('show');
      console.log("Replies collapse is open?", isOpen);
       const element = document.querySelector('.c-container');
      if (isOpen) {
        console.log("Replies are visible - fetching all replies");
        await fetchreplies(replyId);
      }else{
            element.classList.remove('mb-3');

      }
    
  }
      
    console.log(replyId);
       
  } catch (error) {
console.log(error) ; 
  errorMessagecomment.value = {
        ...errorMessagecomment.value,
        [replyId]: error.response.data.errors.comment[0] // "The comment field is required."
      }
}
finally {
   submittingStates.value[replyId] = false;
  successMessage.value = 'Successfully submitted';
  
  // Correct way to hide a Bootstrap collapse
    if (!form.value.comment.trim()) {
  
    return;
  }
const replyCollapse = document.getElementById(`collapseExample${replyId}`);
if (replyCollapse) {
    const bsCollapse = bootstrap.Collapse.getInstance(replyCollapse);
    if (bsCollapse) {
        bsCollapse.hide();
    } else {
        // If instance doesn't exist, create new one and hide
        new bootstrap.Collapse(replyCollapse, {
            toggle: false
        }).hide();
    }
}
form.value.comment = null;
};
}
const updateComment = async (commentId) => {
  successMessage.value = '';
  errorMessagecomment.value = '';
  updatingStates.value[commentId] = true;
  try {
    form.value.reply_id = commentId;
    // Send POST request to your Laravel endpoint
    const response = await axios.put(`/api/posts/comments/updatecomment/${slug}`, form.value);
          await props.refreshComments();

     if (props.refreshReplies) {
      await props.refreshReplies();
    }
      
       
  } catch (error) {
console.log(error) ; 
}finally{
    editingCommentId.value = null;
    form.value.comment = null;
    updatingStates.value[commentId] = false;
  
form.value.comment = null;
       
}
};
const deleteComment = async (commentId) => {
  successMessage.value = '';
  errorMessagecomment.value = '';
  deletingStates.value[commentId] = true;
  const modalElement = document.getElementById(`deleteModal${commentId}`);

  try {
    commentId = commentId;
    
const response = await axios.delete(`/api/posts/comments/deletecomment/${commentId}`);

    
        await props.refreshComments();
        if (props.refreshReplies) {
      await props.refreshReplies();
         successMessage.value = "Reply successfully deleted"
    }else{
               successMessage.value = "Comment successfully deleted"

    }
      

    console.log('YRSS');
       
  } catch (error) {
console.log(error) ; 
}finally {
 deletingStates.value[commentId] = false;
 if (window.bootstrap) {
        const modal = bootstrap.Modal.getInstance(modalElement);
        if (modal) {
          modal.hide();
        }
      }
  };
      const toastEl = document.getElementById('liveToast');
      if (toastEl) {
        var toast = new bootstrap.Toast(toastEl);
        toast.show();
      }
   successMessage.value = 'Comment successfully deleted';

}
const collapsemb3 = async () => {
  
}
onMounted(collapsemb3);
const showReplyForm = ref(false);
</script>

<style scoped>
.replies-container {
  margin-left: 20px; /* Indent replies */
  border-left: 1px solid #ccc;
  padding-left: 24px;
margin-top: 0;
margin-bottom: 24px;
}

</style>
