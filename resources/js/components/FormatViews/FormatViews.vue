<template>
{{ formatViews(props.views) }}
</template>
<script setup>
const props = defineProps({
     views: {
        type: Number,
        default: null
    },

});
const formatViews = (count) => {
  if (count >= 1000000000) {
    return (count / 1000000000).toFixed(1) + 'B';
  }
  if (count >= 1000000) {
    return (count / 1000000).toFixed(1) + 'M';
  }
  if (count >= 1000) {
    return (count / 1000).toFixed(1) + 'K';
  }
  return count.toString();
};
</script>