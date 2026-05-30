@php $featured = request('feed') === 'featured'; @endphp
@extends('layouts')
@section('meta_tags')
<meta property="twitter:site" content="@websitename"/>
<meta property="twitter:creator" content="@websitename"/>
<link rel="canonical" href="https://websitename.com"/>
<meta property="og:url" content="https://websitename.com"/>
<meta name="robots" content="index,follow"/>
<meta property="og:image" content="https://cdn.shopify.com/s/files/1/0454/5616/2972/files/cover-image_1b6f9254-77d4-4b0a-abdf-e3119f0ff44a.webp?v=1686597752"/>

@endsection
@section('content')
<layout  :user="{{ json_encode(auth()->user()) }}" >

    <template #content>

                              <div class="pt-5 col-lg-8 px-4 c">

                             
                            <div style="transform: translate(0px, 8px);" class=" row  m-0 sticky-nav z-10 bg-white">
                             <div class="col-lg-12 px-0 border-bottom pt-2 pb-3">
                     <ul type="none" class=" d-flex ms-auto mt-2 mb-0 p-0">
                                <li class="nav-item "><router-link to="/" class="nav-link me-4 position-relative " :class="{ 'c-active': $route.path === '/' && !$route.query.feed }">
    For you
</router-link></li>
                                <li class="nav-item "><router-link to="/?feed=featured" class="nav-link me-4 position-relative " :class="{ 'c-active': $route.query.feed === 'featured' }"
                                >
    Featured
</router-link></li>
</ul>
                 </div>
                 </div>
                 <div class="row pt-4 m-0">
                    <div class="col-12 p-0">
                                <div class="col-lg-12 p-0 mx-auto max-w-768px">
                            <div class="row m-0 pt-2 a-r-c">
  <posts-list></posts-list>
                    </div>
                    </div>

                    </div>
                 </div>
                 </div>
      
    </template>
       <template #right-sidebar>

    
                             
       @include('Components/Layouts/RightSidebar/RightSidebar')
      
    </template>
</layout>
@endsection
