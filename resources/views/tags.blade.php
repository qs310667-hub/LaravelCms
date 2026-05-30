

      @php
    use Illuminate\Support\Str;
    $Desc = Str::limit($tag->seo->description , 15, '...');
@endphp
       @section('meta_title', $tag->seo->title)
       @section('og_title', $tag->seo->title)
       @section('twitter_title', $tag->seo->title)
       @section('description', $Desc)
@extends('layouts')
@section('content')
<layout  :user="{{ json_encode(auth()->user()) }}" >
    <template #content>

    
                    
               
                        
                    <div class="col-lg-12">
                     
                       <div class="row mt-4 pt-1 pb-3">
                        <div class="col-lg-12">
                                                                          <tag-title></tag-title>

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
                        <div class="row m-0">
                            <div class="col-lg-12 p-0">                  
                         <tag-single></tag-single>
                        </div>
                    </div>
                 </div>
                 
                       </div>
                      
              
                    </div>
                
      
    </template>
     
</layout>
        
@endsection


                        
               
    
 