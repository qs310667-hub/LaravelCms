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
    <div class="row "  v-else>
    <div class="col-lg-12">
   
         <div class="row mb-4">
            <div class="col-lg-12">
                <div class="mb-2">
                      <a href="#" class="text-dark text-decoration-none d-flex mb-2">

                    <div class="c-img mr-2">
 <img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded-circle"
             alt="Post image">
                    </div>
                    <div class="c-content">
<span class="fs-6">User name </span>
                    </div>
                    </a>
                                          <button type="button" class="text-muted d-block w-100 py-2 px-3 bg-light text-start text-decoration-none" data-bs-toggle="collapse" data-bs-target="#collapse" aria-expanded="false" aria-controls="collapse">Whats your thoughts?</button>

                </div>
                <div  class="collapse visible" id="collapse">
                     <form @submit.prevent="submitComment()">
                         <div class="form-control p-0 border-0 mb-2">
                    <textarea action="" id="comment" v-model="form.comment"  class="form-control"></textarea>
</div>
 <div class="d-flex justify-content-between ">
 <div>
  <div v-if="successMessage" class="success">{{ successMessage }}</div>
                    <div v-if="!form.reply_id" class="text-danger small">
        {{ errorMessagecomment }}
      </div>

 </div>
 <div>
                      <a href="#" class="text-dark p-0 text-decoration-none" data-bs-toggle="collapse" data-bs-target="#collapse" aria-expanded="false" aria-controls="collapse">Cancel</a>
                    <button type="submit" class="btn btn-dark ms-2">Submit</button>
                    </div>
</div>
                    </form>
                     

                </div>
            </div>
        </div>
                                                            <div class="row " v-if="comment.length > 0"  v-for="comment in comment[0]"> 
                                                            <div class="row mb-4">
            <div class="col-lg-12">
                 <div class="mb-2">
                 <a href="#" class="text-dark text-decoration-none d-flex">

                    <div class="c-img mr-2">
 <img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded-circle"
             alt="Post image">
                    </div>
                    <div class="c-content">
<span class="fs-6 text-capitalize">{{comment.user.name}} </span>
<small class="text-muted ml-2">{{ formatDate(comment.created_at) }}</small>
                    </div>
                    

                    </a>
                    <p class="m-0 p-0">{{comment.text}}</p>
                    <small class="d-flex mt-2">
                        <button class="d-flex "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
  <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
</svg><span class="ml-1">10</span></button>
                        <button class="d-flex ms-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16">
  <path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.38 1.38 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51q.205.03.443.051c.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.9 1.9 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2 2 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.2 3.2 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.8 4.8 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591"/>
</svg><span class="ml-1">10</span></button>
                        <button class="ms-4" type="button" data-bs-toggle="collapse" :data-bs-target="'#collapse' + comment.id" aria-expanded="false" :aria-controls="'collapse' + comment.id">Reply</button>
                    </small>
                </div>
                <div class="collapse visible" :id="'collapse' + comment.id">
                     <form @submit.prevent="submitComment(comment.id)">
                         <div class="form-control p-0 border-0 mb-2">
                    <textarea action="" id="comment" v-model="form.comment"  class="form-control"></textarea>
                    <div v-if="activeError.formId === 'reply_' + comment.id" class="text-danger small">
        {{ activeError.message }}
      </div>
                     <div v-if="successMessage" class="success mt-2">{{ successMessage }}</div>
</div>
 <div class="d-flex justify-content-between ">
 <div>
  <div v-if="successMessage" class="success">{{ successMessage }}</div>
                      <div v-if="form.reply_id === comment.id" class="success">{{ errorMessagecomment }}</div>
 </div>
 <div>
                      <a href="#" class="text-dark p-0 text-decoration-none" data-bs-toggle="collapse" data-bs-target="'#collapse' + comment.id" aria-expanded="false" aria-controls="collapse{{comment.id}}">Cancel</a>
                    <button type="submit" class="btn btn-dark ms-2">Submit</button>
                    </div>
</div>
                    </form>
                </div>
                  </div>
                    </div>
                    
                <div class="row ps-4 mb-4">
                    <div class="col-lg-12">
<div class="row"  v-if="comment.replies.length > 0">

                    
            <div class="col-lg-12">
                 <div class="mb-2">
                  <a href="#" class="text-dark text-decoration-none d-flex">

                    <div class="c-img mr-2">
 <img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded-circle"
             alt="Post image">
                    </div>
                    <div class="c-content">
<span class="fs-6 text-capitalize">{{comment.replies[0].user.name}} </span>
<small class="text-muted ml-1">{{ formatDate(comment.replies[0].created_at) }}</small>
                    </div>

                    </a>    
                                   <p class="m-0 p-0">{{comment.replies[0].text}}</p>
<small class="d-flex mt-2">
                        <button class="d-flex "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
  <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
</svg><span class="ml-1">10</span></button>
                        <button class="d-flex ms-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16">
  <path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.38 1.38 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51q.205.03.443.051c.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.9 1.9 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2 2 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.2 3.2 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.8 4.8 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591"/>
</svg><span class="ml-1">10</span></button>
                        <button class="ms-4" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">Reply</button>
                    </small>
                </div>
                <div class="collapse visible" id="collapse3">
                      <form @submit.prevent="submitComment(comment.replies[0].id)">
                         <div class="form-control p-0 border-0 mb-2">
                    <textarea action="" id="comment" v-model="form.comment"  class="form-control"></textarea>
</div>
 <div class="d-flex justify-content-between ">
 <div>
  <div v-if="successMessage" class="success">{{ successMessage }}</div>
  
                      <div v-if="form.reply_id === comment.replies[0].id" class="success">{{ errorMessagecomment }}</div>
 </div>
 <div>
                      <a href="#" class="text-dark p-0 text-decoration-none" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">Cancel</a>
                    <button type="submit" class="btn btn-dark ms-2">Submit</button>
                    </div>
</div>
                    </form>
                </div>
                </div>
                </div>
              
                <div v-for="replies in comment.replies">
                
                  <div class="row ps-4 mt-4" v-if="replies.replies.length > 0" v-for="replies in replies.replies">
            <div class="col-lg-12 ps-4">
                 <div class="mb-2">
                             <a href="#" class="text-dark text-decoration-none d-flex">

                    <div class="c-img mr-2">
 <img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded-circle"
             alt="Post image">
                    </div>
                    <div class="c-content">
<span class="fs-6 text-capitalize">{{replies.user.name}} </span>
<small class="text-muted ml-1">{{ formatDate(replies.created_at) }}</small>
                    </div>
                    </a>
                    <p class="m-0 p-0">{{replies.text}}</p>
<small class="d-flex mt-2">
                        <button class="d-flex "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
  <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
</svg><span class="ml-1">10</span></button>
                        <button class="d-flex ms-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16">
  <path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.38 1.38 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51q.205.03.443.051c.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.9 1.9 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2 2 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.2 3.2 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.8 4.8 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591"/>
</svg><span class="ml-1">10</span></button>
                        <button class="ms-4" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapse4">Reply</button>
                    </small>
                        </div>
                <div class="collapse visible" id="collapse4">
                
                    <form @submit.prevent="submitComment(replies.id)">
                         <div class="form-control p-0 border-0 mb-2">
                    <textarea action="" id="comment" v-model="form.comment"  class="form-control"></textarea>
</div>
 <div class="d-flex justify-content-between ">
 <div>
  <div v-if="successMessage" class="success">{{ successMessage }}</div>
                      <div v-if="form.reply_id === replies.id" class="success">{{ errorMessagecomment }}</div>
 </div>
 <div>
                      <a href="#" class="text-dark p-0 text-decoration-none" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">Cancel</a>
                    <button type="submit" class="btn btn-dark ms-2">Submit</button>
                    </div>
</div>
                    </form>
                <div v-for="replies in replies.replies">
                {{replies}}</div>
                </div>
                </div>
                </div>
                    </div>
                    </div>
          
            </div>
            
        </div>
        <div class="row" v-else>
<div class="col-lg-12"><h5 class="text-center text-muted">No comments found.</h5></div>
</div>
              </div></div> 


</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
const slug = window.location.pathname.split('/').pop()
const comment = ref([])
const loading = ref(true)
const form = ref({
  comment: '',
  reply_id: '',
});
const activeError = ref({
  formId: null,
  message: ''
});
const successMessage = ref('');
const errorMessagecomment = ref('');

const submitComment = async (replyId = null) => {
  successMessage.value = '';
  errorMessagecomment.value = '';
  try {
    form.value.reply_id = replyId;
    // Send POST request to your Laravel endpoint
    const response = await axios.post(`/api/posts/comments/submitcomment/${slug}`, form.value);
    

    
    
      
    console.log(form.value);
       
  } catch (error) {
    
     errorMessagecomment.value = error.response.data.errors.comment[0];
  }
};


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
    const response = await axios.get(`/api/posts/comments/${slug}`)
    comment.value = response.data
  } catch (error) {
    console.error('Error fetching posts:', error);
  } finally {
    loading.value = false;
  }
});
</script>
