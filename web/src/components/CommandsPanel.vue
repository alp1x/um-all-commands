<script setup lang="ts">
    defineProps<{filteredCommands: string[];}>();
</script>

<template>
    <div class="panel">
        <div class="grid">
            <button v-for="command in filteredCommands" :key="command" class="secondary" data-tooltip="server command">
                {{ command }}
            </button>
            <kbd v-if="!filteredCommands.length">No commands found</kbd>
        </div>
    </div>
</template>