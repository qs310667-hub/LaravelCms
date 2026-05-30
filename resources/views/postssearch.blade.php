

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css" integrity="sha512-t7Few9xlddEmgd3oKZQahkNI4dS6l80+eGEzFQiqtyVYdvcSG2D3Iub77R20BdotfRPA9caaRkg1tyaJiPmO0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="{{asset('assets/css/styles.css')}}" rel="stylesheet" />
                <link href="{{asset('assets/css/customstyle.css')}}" rel="stylesheet" />
                    @vite(['resources/css/app.css', 'resources/js/app.js'])


    </head>
    <body id="app">
        <div class="d-flex" id="wrapper">
            <!-- Sidebar--> 
            <div class="border-end bg-white pt-5" id="sidebar-wrapper">
                <div class="list-group list-group-flush pt-4 side-nav">
                    <a class="list-group-item list-group-item-action list-group-item-light px-4 py-0 my-2 border-0 relative side-active d-flex align-items-center" href="#!"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
</svg> <span class="ms-3">Dashboard</span></a>
                    <a class="list-group-item list-group-item-action list-group-item-light px-4 py-0 my-2 border-0 relative d-flex align-items-center" href="#!"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
</svg> <span class="ms-3">Profile</span></a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="z-10 navbar navbar-expand-lg navbar-light bg-white border-bottom position-fixed top-0 end-0 start-0">
                    <div class="container-fluid ">
                        <div class="d-flex align-items-center justify-content-between w-100">
<div class="d-flex align-items-center">
                        <button class="btn btn-white" id="sidebarToggle"><i class="bi bi-list fs-4"></i></button>
<div class="img-area-logo ms-2">
                      <a href="/" class="d-block"> <img src="{{ asset('assets/logo.png') }}" alt="Company Logo" ></a> 

</div>
               <search-bar></search-bar>
               </div>
               <div class="dropdown p-0 position-relative">
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
        <a href="#" class="text-decoration-none d-flex px-24px text-muted">

        <span><img
      src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded rounded-circle"
             alt="Post image"
             width="48"
             height="48"
             
             > </span>
             <span class="ms-3 ">
                
                 <small class="">User Name</small>
                 <p class=" fs-11px m-0">View Profile</p>
             </span>
        </a>
    </div>
   
    <div class="mt-3">
        <a class="text-decoration-none  px-24px d-flex flex-col text-muted" href="#"><small>Sign out</small>
                 <p class=" fs-11px m-0">ga....@gmail.com</p>
    </a>
    </div>
   
   
  </ul>
</div>
                        </div>

                    
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid h-100 pt-5 px-0">
                    <div class="row h-100 m-0">
                        
                 
                    <div class="col-lg-12 p-0">
                        <div class="row px-0 h-100 m-0">
                        <div class="pt-5 col-lg-8 px-4 cards-area">
                            <div class="row m-0">
                                <div class="col-lg-12 p-0 mx-auto max-w-768px">

                          
                 <posts-search></posts-search>

                    </div>
                            </div>
                        </div>
                        <div class="col-lg-4 d-none d-lg-block right-side-bar border-start px-5 pt-5 max-w-368px">
                         <div class="row pt-2 mb-4">
                            <div class="col-lg-12 px-0">
                            <div class="row mx-0 mb-4">
                                <div class="col-lg-12 px-0">
                                     <p class="fw-500 m-0">Staff Picks</p>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-lg-12 p-0">
                                     <div class="row m-0 mb-2">
                                        <div class="col-lg-12 p-0">
                                            <a href="#" class="text-decoration-none d-flex align-items-center text-dark"> <img src="https://dummyimage.com/120x120/ff6f3d/ffffff&text=Git"
             class="img-fluid rounded rounded-circle p-img"
             alt="Post image"> <span class="ms-2">User</span></a>
                                        </div>
                                     </div>
                                     <div class="row m-0">
                                        <div class="col-lg-12 p-0">
<p class="fw-bold m-0">Title</p>
                                        </div>
                                     </div>
                                     <div class="row m-0">
                                        <div class="col-lg-12 p-0">
<small class="text-muted">1 day ago</small>
                                        </div>
                                     </div>
                                </div>
                            </div>
                            </div>
                         </div>
                         <div class="row pt-2">
                            <div class="col-lg-12 px-0">
                               <div class="row m-0 mb-4">
                                <div class="col-lg-12 p-0">
                                    <p class="fw-500 m-0">Recommended topics</p>
                                </div>
                               </div>
                               <div class="row m-0">
                                <div class="col-lg-12 p-0">
                                           <post-tags></post-tags>


                                </div>
                               </div>
                            </div>
                            <div class="row">
                            <div class=" col-lg-12 p-0">
<ul class="d-flex flex-wrap p-0 gap-2">
    <li><a href="#" class="text-muted text-decoration-none"><small>Help</small></a></li>
    <li><a href="#" class="text-muted text-decoration-none"><small>Status</small></a></li>
    <li><a href="#" class="text-muted text-decoration-none"><small>About</small></a></li>
    <li><a href="#" class="text-muted text-decoration-none"><small>Privacy</small></a></li>

</ul>
                            </div>
                            </div>
                         </div>
                        </div>
                </div>
                 
                    </div>
                       </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="{{ asset('assets/js/scripts.js')}}"></script>
    </body>
</html>
