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

                              <div class="pt-5 col-lg-12 px-4 c">

                             
                      
                 <div class="row pt-4 m-0">
                    <div class="col-12 p-0">
                                <div class="col-lg-12 ">
                            <div class="row m-0 pt-2 a-r-c">
  <posts-list-user></posts-list-user>
                    </div>
                    </div>

                    </div>
                 </div>
                 </div>
      
    </template>
      
</layout>
@endsection
