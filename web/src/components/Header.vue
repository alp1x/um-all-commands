<script setup lang="ts">
    defineProps<{commandCount: Number;}>();
</script>

<template>
    <header>
        <h4>um-all-commands</h4>
        <kbd>total commands: {{ commandCount }}</kbd>
    </header>
</template>