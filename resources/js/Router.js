import { createRouter, createWebHistory } from 'vue-router';
import PostsList from './components/Posts/PostsList.vue'; // Create this component next

const routes = [
    {
        path: '/',
        name: 'home',
        component: PostsList,
        props: (route) => ({ 
            feed: route.query.feed || 'regular' 
        })
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;