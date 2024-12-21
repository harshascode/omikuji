<script lang="ts">
	import { fade, scale } from 'svelte/transition';

	let selectedCard: number | null = null;
	let isRevealing = false;

	function goToResult(fortune: number) {
		selectedCard = fortune;
		isRevealing = true;
		setTimeout(() => {
			window.location.href = `/result/${fortune}`;
		}, 800);
	}

	const fortunes = [
		{ number: 1, name: '大吉', description: 'Greatest Fortune' },
		{ number: 2, name: '中吉', description: 'Good Fortune' },
		{ number: 3, name: '小吉', description: 'Moderate Fortune' },
		{ number: 4, name: '末吉', description: 'Future Fortune' }
	];
</script>

<div
	class="flex min-h-screen flex-col items-center justify-center bg-gradient-to-b from-red-50 to-pink-50 px-4 py-12"
>
	<div
		class="w-full max-w-4xl rounded-2xl bg-white/90 p-8 shadow-xl backdrop-blur-sm"
		in:scale={{ duration: 400, delay: 200 }}
	>
		<!-- Header Section -->
		<div class="mb-12 text-center">
			<h1
				class="mb-4 bg-gradient-to-r from-red-600 to-pink-600 bg-clip-text text-4xl font-bold text-transparent"
			>
				恋みくじを引く
			</h1>
			<p class="text-lg text-gray-600">心を穏やかにし、恋みくじをタップしてください。</p>
		</div>

		<!-- Fortune Cards Grid -->
		<div class="mb-8 grid grid-cols-2 gap-6 md:grid-cols-4">
			{#each fortunes as fortune}
				<button
					type="button"
					class="group relative transform transition-all duration-300 hover:scale-105"
					class:opacity-50={isRevealing && selectedCard !== fortune.number}
					on:click={() => goToResult(fortune.number)}
					disabled={isRevealing}
				>
					<div
						class="absolute inset-0 rounded-xl bg-gradient-to-br from-red-400 to-pink-500 opacity-75 transition-opacity group-hover:opacity-100"
					/>
					<div class="relative rounded-xl border border-white/20 bg-white/10 p-6 backdrop-blur-sm">
						<div class="writing-vertical space-y-2 text-2xl font-medium text-white">
							<div class="font-bold text-yellow-300">{fortune.name}</div>
							<div class="text-base opacity-90">{fortune.description}</div>
						</div>
					</div>
				</button>
			{/each}
		</div>

		<!-- Action Button -->
		<div class="mt-8 text-center">
			<p class="mb-4 text-sm text-gray-500">タップして運命を探る</p>
			<div class="mx-auto h-16 w-16 animate-bounce">
				<svg
					xmlns="http://www.w3.org/2000/svg"
					fill="none"
					viewBox="0 0 24 24"
					stroke="currentColor"
					class="text-red-400"
				>
					<path
						stroke-linecap="round"
						stroke-linejoin="round"
						stroke-width="2"
						d="M19 14l-7 7m0 0l-7-7m7 7V3"
					/>
				</svg>
			</div>
		</div>
	</div>
</div>

<style>
	.writing-vertical {
		writing-mode: vertical-rl;
		text-orientation: upright;
	}
</style>
