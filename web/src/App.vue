<script setup lang="ts">
import { onMounted, onUnmounted, ref, computed } from 'vue';
import { vDraggable } from '@neodrag/vue';
import { fetchNui } from './utils/fetchNui';
import Header from './components/Header.vue';
import CommandsPanel from './components/CommandsPanel.vue';

const commands = ref<Array<string>>([]);
const searchTerm = ref('');
const pageStatus = ref(false);

const filteredCommands = computed(() => {
  return commands.value.filter(command => command.toLowerCase().includes(searchTerm.value.toLowerCase()))
})

const handleMessage = (e: MessageEvent) => {
  if (e.data.commands) {
    commands.value = e.data.commands;
    pageStatus.value = true;
  }
};

const handleKeyDown = (e: KeyboardEvent) => {
  if (e.key !== 'Escape') return;
  pageStatus.value = false;
  fetchNui('close');
};

onMounted(() => {
  window.addEventListener('message', handleMessage);
  document.addEventListener('keydown', handleKeyDown);
});

onUnmounted(() => {
  window.removeEventListener('message', handleMessage);
  document.removeEventListener('keydown', handleKeyDown);
});
</script>

<template>
  <main v-if="pageStatus" v-draggable>
      <Header :commandCount="commands.length" />
        <label for="Search">
          <input
            type="search"
            id="search"
            v-model="searchTerm"
            placeholder="Search.."
            required
          />
        </label>
      <CommandsPanel :filteredCommands="filteredCommands" />
  </main>
</template>
