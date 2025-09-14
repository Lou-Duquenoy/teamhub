<template>
  <main class="max-w-4xl mx-auto p-6 space-y-6">
    <header class="flex items-center justify-between">
      <h1 class="text-2xl font-bold">TeamHub</h1>
      <nav class="space-x-4">
        <RouterLink to="/">Accueil</RouterLink>
        <RouterLink to="/health">Santé API</RouterLink>
      </nav>
    </header>
    <RouterView />
  </main>
</template>