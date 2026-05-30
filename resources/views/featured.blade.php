

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
        <link href="{{asset('assets/css/styles.css')}}" rel="stylesheet" />
                <link href="{{asset('assets/css/customstyle.css')}}" rel="stylesheet" />
                    @vite(['resources/css/app.css', 'resources/js/app.js'])


    </head>
    <body id="app">
        <div class="d-flex" id="wrapper">
            <!-- Sidebar--> 
            <div class="border-end bg-white pt-5" id="sidebar-wrapper">
                <div class="list-group list-group-flush pt-5 side-nav">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Dashboard</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Shortcuts</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Overview</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Events</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Status</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom position-fixed top-0 end-0 start-0">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">Action</a>
                                        <a class="dropdown-item" href="#!">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">Something else here</a>
                                    </div>
                                </li>
                            </ul>
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

                             
                            <div class=" row  m-0">
                             <div class="col-lg-12 px-0 border-bottom pt-2 pb-3">
                     <ul type="none" class=" d-flex ms-auto mt-2 mb-0 p-0">
                                <li class="nav-item "><a class="nav-link me-4  position-relative  " href="/">For you</a></li>
                                <li class="nav-item "><a class="nav-link me-4   position-relative c-active" href="?feed=featured">Featured</a></li>
</ul>
                 </div>
                 </div>
                 <div class="row pt-4 m-0">
                    <div class="col-12 p-0">
                 <posts-list></posts-list>

                    </div>
                 </div>
                    </div>
                            </div>
                        </div>
                        <div class="col-lg-4 d-none d-lg-block right-side-bar border-start px-5 pt-5 max-w-368px">
                         <div class="row pt-2 mb-4">
                            <div class="col-lg-12 px-0">
                            <div class="row mx-0 mb-4">
                                <div class="col-lg-12 px-0">
                                     <p class="fw-bold m-0">Staff Picks</p>
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
                                    <p class="fw-bold m-0">Recommended topics</p>
                                </div>
                               </div>
                               <div class="row m-0">
                                <div class="col-lg-12 p-0">
                                           <post-tags></post-tags>


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
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="{{ asset('assets/js/scripts.js')}}"></script>
    </body>
</html>
