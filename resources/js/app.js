import './bootstrap';
import router from './Router';
import { createApp } from 'vue/dist/vue.esm-bundler.js';
import PostsList from './components/Posts/PostsList.vue'; // Create this component next
import PostSingle from './components/Posts/PostSingle.vue'; // Create this component next
import Tags from './components/Tags/Tags.vue'; // Create this component next
import TagSingle from './components/Tags/TagSingle.vue'; // Create this component next
import TagCarausel from './components/Tags/TagCarausel.vue'; // Create this component next
import RelatedPost from './components/Posts/RelatedPost.vue'; // Create this component next
import TagTitle from './components/Tags/TagsTitle.vue'; // Create this component next
import PostsListUser from './components/User/PostsListUser.vue'; // Create this component next
import CategorySingle from './components/Categories/CategorySingle.vue'; // Create this component next
import CategoryTitle from './components/Categories/CategoryTitle.vue'; // Create this component next
import CommentItem from './components/Comments/CommentItem.vue'; // Create this component next
import CommentManager from './components/Comments/CommentManager.vue'; // Create this component next
import Profile from './Pages/Profile/Edit.vue'; // Create this component next
import Layout from './Layouts/MainLayout.vue'; // Create this component next
import Layoutsidebar from './Layouts/Sidebar/sidebar.vue'; // Create this component next
import PostListShimmer from './Layouts/Shimmers/Posts/PostList.vue'; // Create this component next
import TagShimmer from './Layouts/Shimmers/Tags/Tags.vue'; // Create this component next
import RightSidebar from './Layouts/RightSidebar/RightSidebar.vue'; // Create this component next
import CardShimmer from './Layouts/Shimmers/Categories/CategorySingle.vue'; // Create this component next
import PostSingleShimmer from './Layouts/Shimmers/Posts/PostSingle.vue'; // Create this component next
import RelatedPostShimmer from './Layouts/Shimmers/Posts/RelatedPost.vue'; // Create this component next
import CommentShimmer from './Layouts/Shimmers/Comments/Comments.vue'; // Create this component next
import FormatViews from './Components/FormatViews/FormatViews.vue'; // Create this component next
const app = createApp({});
app.use(router);
app.component('posts-list', PostsList);
app.component('post-single', PostSingle);
app.component('post-tags', Tags);
app.component('tag-single', TagSingle);
app.component('tag-carausel', TagCarausel);
app.component('related-post', RelatedPost);
app.component('tag-title', TagTitle);
app.component('posts-list-user', PostsListUser);
app.component('category-single', CategorySingle);
app.component('category-title', CategoryTitle);
app.component('comment-manager', CommentManager);
app.component('comment-item', CommentItem);
app.component('profile', Profile);
app.component('layout', Layout);
app.component('layout-sidebar', Layoutsidebar);
app.component('PostListShimmer', PostListShimmer);
app.component('TagShimmer', TagShimmer);
app.component('RightSidebar', RightSidebar);
app.component('CardShimmer', CardShimmer);
app.component('PostSingleShimmer', PostSingleShimmer);
app.component('RelatedPostShimmer', RelatedPostShimmer);
app.component('CommentShimmer', CommentShimmer);
app.component('FormatViews', FormatViews);

app.mount('#app');
