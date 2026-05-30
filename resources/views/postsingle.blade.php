
            
         @php
    use Illuminate\Support\Str;
    $Desc = Str::limit($post->seo->description , 15, '...');
@endphp

       @section('meta_tags')
         <meta property="og:image:url" content="{{$post->feature_image}}"/>
         <meta property="og:image:secure_url" content="{{$post->feature_image}}"/>
         <meta property="og:image:type" content="image/png"/>
         <meta property="og:image:type" content="image/jpeg"/>
         <meta property="og:image:width" content="2200"/>
         <meta property="og:image:height" content="2200"/>
       @endsection
       @section('meta_title', $post->seo->title)
       @section('og_title', $post->seo->title)
       @section('twitter_title', $post->seo->title)
       @section('description', $Desc)
       
@extends('layouts')
@section('content')
<layout  :user="{{ json_encode(auth()->user()) }}" >

    <template #content>
                    <div class="col-lg-12">
                     
                       <div class="row pt-5  pb-5">
                        <div class="col-lg-12  mx-auto  max-w-680px px-0 ">
                            
                                       <post-single></post-single>


                        </div>
                       </div>
                       <div class="row border-top pt-5 pb-5">
                    
                    <div class="col-lg-12 pt-2 max-w-680px mx-auto px-md-0 px-4">
               
                                                                       <related-post></related-post>

             
                    
                         </div>
                       </div>
                 <div class="row border-top pt-5">

                    <div class="col-lg-12 pt-2 max-w-680px mx-auto px-md-0 px-4">
                   
                        <div class="row">
                            <div class="col-lg-12 pt-2">
   
      
       <comment-manager :user="{{ json_encode(auth()->user()) }}"></comment-manager>
   </div>
</div>

                            </div>
                        </div>
                    </div>
                 </div>
              

    </template>
       
</layout>
@endsection






              