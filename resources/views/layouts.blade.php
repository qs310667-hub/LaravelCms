<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>@yield('meta_title', 'Website Title') -  The Official Website Name</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css" integrity="sha512-t7Few9xlddEmgd3oKZQahkNI4dS6l80+eGEzFQiqtyVYdvcSG2D3Iub77R20BdotfRPA9caaRkg1tyaJiPmO0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css" />

        <link href="{{asset('assets/css/styles.css')}}" rel="stylesheet" />
                <link href="{{asset('assets/css/customstyle.css')}}" rel="stylesheet" />
                    @vite(['resources/css/app.css', 'resources/js/app.js'])
<meta property="og:title" content="@yield('og_title', 'og title') – The Official Website of Drake"/>
<meta property="twitter:title" content="@yield('twitter_title', 'Website Name') – The Official Website Name"/>
<meta name="description" content="
@yield('description', 'Website Name is the official website of Drake. Shop Drake products • Certified Lover Boy • NOCTA • Better World Fragrance House • El Chico Studios') "/>
<meta property="og:description" content="
@yield('description', 'Website Name is the official website of Drake. Shop Drake products • Certified Lover Boy • NOCTA • Better World Fragrance House • El Chico Studios') "/>
<meta property="twitter:description" content="
@yield('description', 'Website Name is the official website of Drake. Shop Drake products • Certified Lover Boy • NOCTA • Better World Fragrance House • El Chico Studios') "/>

@yield('meta_tags')
    </head>
    <body id="app">
    @yield('content')
   
    <!-- SCRIPTS HERE - Reused on every page -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('assets/js/scripts.js') }}"></script>
    @stack('scripts')
    </body>
</html>