 @php
    use Illuminate\Support\Str;
    $Desc = Str::limit($category->seo->description , 15, '...');
@endphp
       @section('meta_title', $category->seo->title)
       @section('og_title', $category->seo->title)
       @section('twitter_title', $category->seo->title)
       @section('description', $Desc)
@extends('layouts')
@section('content')
<layout  :user="{{ json_encode(auth()->user()) }}" >

    <template #content>

                 




                 
                    <div class="col-lg-12">
                     
                       <div class="row mt-4  pb-3">
                        <div class="col-lg-12 pt-4">
                                     
                                                                                        <category-title></category-title>

                                      <div class="row"><div class="col-lg-12">

                                      </div></div>

                        </div>
                       </div>
                 <div class="row border-top pt-5">
                   
                    <div class="col-lg-12 px-4 pt-2">
                        <div class="row">
                            <div class="col-lg-12 pb-4">
<h4 class="fw-bold">Recommended Topics</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                                 
                                                   
                         <category-single></category-single>
                        </div>
                    </div>
                 </div>
          
      
    </template>
       
</layout>

@endsection

