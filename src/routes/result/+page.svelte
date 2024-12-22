<script lang="ts">
	import { page } from '$app/state';

	// Static data
	const fortunes = [
		{ number: 1, name: '大大吉', emoji: '✨', color: 'from-violet-500 to-purple-600' },
		{ number: 2, name: '大吉', emoji: '🌟', color: 'from-rose-500 to-pink-600' },
		{ number: 3, name: '大吉', emoji: '🌟', color: 'from-rose-500 to-pink-600' },
		{ number: 4, name: '大吉', emoji: '🌟', color: 'from-rose-500 to-pink-600' },
		{ number: 5, name: '大吉', emoji: '🌟', color: 'from-rose-500 to-pink-600' },
		{ number: 6, name: '大吉', emoji: '🌟', color: 'from-rose-500 to-pink-600' },
		{ number: 7, name: '大吉', emoji: '🌟', color: 'from-rose-500 to-pink-600' }
	];

	// Reactive state using Svelte store
	import { writable } from 'svelte/store';
	const shuffledCards = writable(fortunes);
	const isShuffling = writable(false);
	const hasShuffled = writable(false);

	// Shuffle functionality using SvelteKit's action
	function handleShuffle() {
		isShuffling.set(true);
		hasShuffled.set(true);

		const shuffled = [...$shuffledCards].sort(() => Math.random() - 0.5);
		shuffledCards.set(shuffled);

		setTimeout(() => isShuffling.set(false), 600);
	}
</script>

<div
	class="min-h-screen bg-gradient-to-br from-red-50 via-pink-50 to-purple-50 px-4 py-8 sm:px-6 lg:px-8"
>
	<div class="mx-auto max-w-7xl">
		<!-- Header Section -->
		<header class="animate-fade-in mb-12 space-y-6 text-center">
			<h1
				class="bg-gradient-to-r from-red-600 via-purple-600 to-pink-600 bg-clip-text text-5xl
                       font-bold text-transparent drop-shadow-sm sm:text-6xl"
			>
				運命のカード
			</h1>
			<p class="mx-auto max-w-2xl text-xl text-gray-700">
				心を落ち着かせて、あなたの運命のカードを選んでください
			</p>

			<!-- Shuffle Button -->
			<button
				type="button"
				on:click={handleShuffle}
				disabled={$isShuffling}
				class="group relative rounded-full bg-gradient-to-r from-red-500 via-purple-500
                       to-pink-500 px-8 py-3 text-lg font-medium text-white shadow-lg
                       transition-all duration-300 hover:scale-105 hover:shadow-xl
                       focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2
                       disabled:cursor-not-allowed disabled:opacity-50"
			>
				<span class="relative flex items-center justify-center gap-2">
					{#if $isShuffling}
						<svg class="h-5 w-5 animate-spin" viewBox="0 0 24 24">
							<circle
								class="opacity-25"
								cx="12"
								cy="12"
								r="10"
								stroke="currentColor"
								stroke-width="4"
								fill="none"
							/>
							<path
								class="opacity-75"
								fill="currentColor"
								d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
							/>
						</svg>
						シャッフル中...
					{:else}
						カードをシャッフル
					{/if}
				</span>
			</button>
		</header>

		<!-- Fortune Cards Grid -->
		<section
			class="mb-12 grid grid-cols-2 gap-4 sm:grid-cols-3 sm:gap-6 lg:grid-cols-4 lg:gap-8"
			class:pointer-events-none={$isShuffling}
			class:animate-shuffle={$isShuffling}
		>
			{#each $shuffledCards as fortune (fortune.number)}
				<a
					href="/result/{fortune.number}"
					class="group block aspect-[2/3] w-full rounded-lg bg-gradient-to-br {fortune.color}
                          shadow-sm transition-all duration-300 hover:scale-105 hover:shadow-xl
                          focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2"
				>
					<article class="flex h-full flex-col items-center justify-center p-3">
						<span class="text-2xl text-white" aria-hidden="true">{fortune.emoji}</span>
						<h2 class="writing-vertical mt-2 text-lg font-medium text-white">
							{fortune.name}
						</h2>
					</article>
				</a>
			{/each}
		</section>

		<!-- User Guide -->
		<footer class="text-center">
			{#if !$hasShuffled}
				<p class="animate-pulse text-lg text-gray-600">↑ まずはカードをシャッフルしてください ↑</p>
			{:else}
				<p class="animate-fade-in text-lg text-gray-600">カードを選んでタップしてください</p>
			{/if}
		</footer>
	</div>
</div>

<style>
	/* Base card animations */
	.animate-fade-in {
		animation: fadeIn 0.5s ease-out;
	}

	.animate-shuffle {
		animation: shuffle 0.6s ease-in-out;
	}

	/* Vertical writing mode */
	.writing-vertical {
		writing-mode: vertical-rl;
		text-orientation: upright;
	}

	/* Animations */
	@keyframes fadeIn {
		from {
			opacity: 0;
		}
		to {
			opacity: 1;
		}
	}

	@keyframes shuffle {
		0%,
		100% {
			transform: translateX(0) rotate(0deg);
		}
		25% {
			transform: translateX(-5%) rotate(-5deg);
		}
		75% {
			transform: translateX(5%) rotate(5deg);
		}
	}

	/* Responsive adjustments */
	@media (max-width: 640px) {
		.writing-vertical {
			font-size: 90%;
		}
	}

	/* Accessibility - Reduced motion */
	@media (prefers-reduced-motion: reduce) {
		.animate-shuffle,
		.animate-pulse {
			animation: none;
		}
	}
</style>
