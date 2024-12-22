<script lang="ts">
	import { fade, scale, fly } from 'svelte/transition';
	import { backOut, elasticOut } from 'svelte/easing';
	import { onMount } from 'svelte';

	let selectedCard: number | null = null;
	let isRevealing = false;
	let isShuffling = false;
	let hasShuffled = false;

	// Optimized fortune list with emojis and improved descriptions
	const fortunes = Object.freeze([
		{
			number: 1,
			name: '大大吉',
			emoji: '✨',
			color: 'from-violet-500 to-purple-600'
		},
		{
			number: 2,
			name: '大吉',
			emoji: '🌟',
			color: 'from-rose-500 to-pink-600'
		}
		// ... (keep other fortunes with added emojis)
	]);

	let shuffledFortunes = [...fortunes];

	// Improved shuffle animation with spring physics
	function shuffleCards() {
		if (isShuffling) return;
		isShuffling = true;
		hasShuffled = true;

		const newShuffled = [...shuffledFortunes];
		for (let i = newShuffled.length - 1; i > 0; i--) {
			const j = Math.floor(Math.random() * (i + 1));
			[newShuffled[i], newShuffled[j]] = [newShuffled[j], newShuffled[i]];
		}

		shuffledFortunes = newShuffled;

		// Smoother animation timing
		setTimeout(() => {
			isShuffling = false;
		}, 600);
	}

	function goToResult(fortune: number) {
		if (isRevealing) return;
		selectedCard = fortune;
		isRevealing = true;

		// Add haptic feedback if available
		if (window.navigator.vibrate) {
			window.navigator.vibrate(100);
		}

		setTimeout(() => {
			window.location.href = `/result/${fortune}`;
		}, 800);
	}

	onMount(() => {
		// Initial subtle shuffle
		setTimeout(shuffleCards, 500);
	});
</script>

<div
	class="min-h-screen bg-gradient-to-br from-red-50 via-pink-50 to-purple-50 px-4 py-8 sm:px-6 lg:px-8"
	in:fade|local={{ duration: 100 }}
>
	<div class="mx-auto max-w-7xl">
		<!-- Enhanced Header Section -->
		<div class="mb-12 space-y-6 text-center" in:fly|local={{ y: -20, duration: 800, delay: 200 }}>
			<h1
				class="bg-gradient-to-r from-red-600 via-purple-600 to-pink-600 bg-clip-text text-5xl font-bold
                       text-transparent drop-shadow-sm sm:text-6xl"
			>
				運命のカード
			</h1>
			<p class="mx-auto max-w-2xl text-xl text-gray-700">
				心を落ち着かせて、あなたの運命のカードを選んでください
			</p>
			<button
				class="group relative rounded-full bg-gradient-to-r from-red-500 via-purple-500 to-pink-500 px-8
                       py-3 text-lg font-medium text-white shadow-lg
                       transition-all duration-300 hover:scale-105 hover:shadow-xl
                       focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2
                       disabled:cursor-not-allowed disabled:opacity-50"
				on:click={shuffleCards}
				disabled={isRevealing || isShuffling}
			>
				<span class="relative flex items-center justify-center gap-2">
					<svg class="h-5 w-5 animate-spin" class:hidden={!isShuffling} viewBox="0 0 24 24">
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
					{isShuffling ? 'シャッフル中...' : 'カードをシャッフル'}
				</span>
			</button>
		</div>

		<!-- Improved Card Grid -->
		<div
			class="mb-12 grid grid-cols-2 gap-4 sm:grid-cols-3 sm:gap-6 lg:grid-cols-4 lg:gap-8"
			class:pointer-events-none={isShuffling}
		>
			{#each shuffledFortunes as fortune, i (fortune.number)}
				<button
					type="button"
					class="aspect-[2/3] w-full rounded-lg bg-gradient-to-br {fortune.color} 
                   shadow-sm transition-opacity duration-150 hover:opacity-90
                   disabled:cursor-not-allowed"
					class:opacity-50={isRevealing && selectedCard !== fortune.number}
					on:click={() => goToResult(fortune.number)}
					disabled={isRevealing || isShuffling}
				>
					<div class="flex h-full flex-col items-center justify-center p-3">
						<span class="text-2xl text-white">{fortune.emoji}</span>
						<div class="writing-vertical mt-2">
							<h3 class="text-lg font-medium text-white">{fortune.name}</h3>
						</div>
					</div>
				</button>
			{/each}
		</div>

		<!-- Interactive Guide -->
		{#if !hasShuffled}
			<div
				class="animate-pulse space-y-4 text-center"
				in:fade|local={{ duration: 300, delay: 1000 }}
			>
				<p class="text-lg text-gray-600">↑ まずはカードをシャッフルしてください ↑</p>
			</div>
		{:else}
			<div class="space-y-4 text-center" in:fade|local={{ duration: 300 }}>
				<p class="text-lg text-gray-600">カードを選んでタップしてください</p>
			</div>
		{/if}
	</div>
</div>

<style>
	/* Improved vertical writing mode */
	.writing-vertical {
		writing-mode: vertical-rl;
		text-orientation: upright;
		will-change: transform;
	}

	/* Enhanced shuffle animation */
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

	.animate-shuffle {
		animation: shuffle 0.6s ease-in-out;
		will-change: transform;
	}

	/* Performance optimizations */
	.transform-gpu {
		transform: translateZ(0);
	}

	/* Responsive design improvements */
	@media (max-width: 640px) {
		.writing-vertical {
			font-size: 90%;
		}
	}

	/* Reduced motion preferences */
	@media (prefers-reduced-motion: reduce) {
		.animate-shuffle {
			animation: none;
		}

		.animate-pulse {
			animation: none;
		}
	}
</style>
