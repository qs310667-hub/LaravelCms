
<template>

        <div class="d-flex" id="wrapper">
            <!-- Sidebar--> 
 
            <div class="bg-white  max-w-240px w-100 border-end pt-5" id="sidebar-wrapper">
                <div  class="list-group list-group-flush pt-4 side-nav">
                    <a class="list-group-item list-group-item-action list-group-item-light px-4 py-0 my-2 border-0 relative side-active d-flex align-items-center" href="/"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
</svg> <span class="ms-3">Home</span></a>
                    <a class="list-group-item list-group-item-action list-group-item-light px-4 py-0 my-2 border-0 relative d-flex align-items-center" href="/profile"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
</svg> <span class="ms-3">Profile</span></a>
            </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <header>
                <nav class="z-10 navbar navbar-expand-lg navbar-light bg-white border-bottom position-fixed top-0 end-0 start-0">
                    <div class="container-fluid ">
                        <div class="d-flex align-items-center justify-content-between w-100">
<div class="d-flex align-items-center">

<button class="btn btn-pwhite d-md-none offcanvas-sidebtn d-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
 <i class="bi bi-list fs-4"></i>
</button>



                        <button class="btn side-btn btn-white border-0 shadow-0" id="sidebarToggle"><i class="bi bi-list fs-4"></i></button>
                        
<div class="img-area-logo ms-2">
                      <a href="/" class="d-block"> <img src="/assets/logo.png" alt="Company Logo" ></a> 

</div>
               <search-bar></search-bar>
               
               </div>
             
               <div class="dropdown p-0 position-relative" v-if="user">
  <button class="border-0 bg-white text-muted" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    <img
      src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded rounded-circle"
             alt="Post image"
             width="32"
             height="32"
             
             > 
  </button>
  <ul class="dropdown-menu position-absolute right-0 left-auto top-100 w-max py-3 shadow  l-d border-0">
    <div class="border-b pb-3 border-light">
        <a href="/profile" class="text-decoration-none d-flex px-24px text-muted">

        <span><img
      src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded rounded-circle"
             alt="Post image"
             width="48"
             height="48"
             
             > </span>
             <span class="ms-3 ">
                
                 <small class="">{{ user.name }}</small>
                 <p class=" fs-11px m-0">View Profile</p>
             </span>
        </a>
    </div>
   
    <div class="mt-3">
        <a class="text-decoration-none  px-24px d-flex flex-col text-muted" href="/logout" ><small>Sign out</small>
                 <p class=" fs-11px m-0">{{ user.email}}</p>
    </a>
    </div>
   
   
  </ul>
</div>
  <div v-else>

<div class="d-flex gap-4 px-2">                           
<small class=""><a :href="'/login'" class="text-decoration-none text-dark "><span class=" ">Sign In</span></a></small>
<small><a :href="'/register'" class="text-decoration-none text-white rounded-pill bg-dark text-dark py-2 px-3 border border-dark "><span class=" ">Sign Up</span></a></small>
               </div>
               </div>
                        </div>

                    
                    </div>
                </nav>
                </header>
                <!-- Page content-->
                <main class="h-100">
                <div class="container-xxl h-100 pt-5 px-0">
                    <div class="row h-100 m-0">
                        
                 
                    <div class="col-lg-12 p-0">
                        <div class="row px-0 h-100 m-0">
             
<slot name="content"></slot>

                            
                        
                        <slot name="right-sidebar"></slot>
        </div>
        </div>
        </div>
        </div>
        </main>
        </div>
        </div>
       <div class="offcanvas offcanvas-sidebar max-w-240px border-end p-0 offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
 dsada
  <div class="offcanvas-body p-0">
  <div class="d-flex justify-content-between align-items-center pt-2 container-fluid">
  <button class="btn btn-pwhite  offcanvas-sidebtn border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
  <i class="bi bi-list fs-4"></i>
  </button>
  <div class="img-area-logo ms-2">
                      <a href="/" class="d-block"> <img src="/assets/logo.png" alt="Company Logo" ></a> 

</div>
  </div>
  <div>
           <div class="bg-white  max-w-240px w-100" >
                <div class="list-group list-group-flush pt-4 side-nav">
                    <a class="list-group-item list-group-item-action list-group-item-light px-4 py-0 my-2 border-0 relative side-active d-flex align-items-center" href="#!"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
</svg> <span class="ms-3">Dashboard</span></a>
                    <a class="list-group-item list-group-item-action list-group-item-light px-4 py-0 my-2 border-0 relative d-flex align-items-center" href="#!"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
</svg> <span class="ms-3">Profile</span></a>
            </div>
            </div>
          </div>
  
    
  
  </div>
</div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
// Define props
const props = defineProps({
    user: {
        type: Object,
        default: null
    },
   
});
onMounted(() => {
    console.log(
        "YES"
    )
  const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
          console.log("YES");
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }
});
</script>