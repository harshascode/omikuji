<script lang="ts">
	import { fade, scale, fly } from 'svelte/transition';
	import { backOut } from 'svelte/easing';

	let selectedCard: number | null = null;
	let isRevealing = false;
	let isShuffling = false;

	// Expanded fortune list with more variety
	const fortunes = [
		{
			number: 1,
			name: '大大吉',
			description: 'Supreme Fortune',
			color: 'from-purple-400 to-pink-500'
		},
		{ number: 2, name: '大吉', description: 'Greatest Fortune', color: 'from-red-400 to-pink-500' },
		{ number: 3, name: '中吉', description: 'Good Fortune', color: 'from-orange-400 to-red-500' },
		{
			number: 4,
			name: '小吉',
			description: 'Moderate Fortune',
			color: 'from-yellow-400 to-orange-500'
		},
		{ number: 5, name: '末吉', description: 'Future Fortune', color: 'from-green-400 to-teal-500' },
		{ number: 6, name: '吉', description: 'Blessing', color: 'from-blue-400 to-indigo-500' },
		{ number: 7, name: '凶', description: 'Unlucky', color: 'from-gray-400 to-gray-600' },
		{ number: 8, name: '大凶', description: 'Very Unlucky', color: 'from-slate-600 to-slate-800' }
	];

	let shuffledFortunes = [...fortunes];

	function shuffleCards() {
		isShuffling = true;
		for (let i = shuffledFortunes.length - 1; i > 0; i--) {
			const j = Math.floor(Math.random() * (i + 1));
			[shuffledFortunes[i], shuffledFortunes[j]] = [shuffledFortunes[j], shuffledFortunes[i]];
		}
		setTimeout(() => {
			isShuffling = false;
		}, 500);
	}

	function goToResult(fortune: number) {
		selectedCard = fortune;
		isRevealing = true;
		setTimeout(() => {
			window.location.href = `/result/${fortune}`;
		}, 10);
	}

	// Auto shuffle on mount
	shuffleCards();
</script>

<div
	class="flex min-h-screen flex-col items-center justify-center bg-gradient-to-b from-red-50 to-pink-50 px-4 py-12"
	in:fade={{ duration: 300 }}
>
	<div
		class="w-full max-w-5xl rounded-2xl bg-white/90 p-8 shadow-xl backdrop-blur-sm"
		in:scale={{ duration: 400, delay: 200, easing: backOut }}
	>
		<!-- Header Section -->
		<div class="mb-12 text-center" in:fly={{ y: -20, duration: 600, delay: 400 }}>
			<h1
				class="mb-4 bg-gradient-to-r from-red-600 to-pink-600 bg-clip-text text-5xl font-bold text-transparent"
			>
				恋みくじを引く
			</h1>
			<p class="text-lg text-gray-600">心を穏やかにし、恋みくじをタップしてください。</p>
			<button
				class="mt-4 rounded-full bg-gradient-to-r from-red-500 to-pink-500 px-6 py-2 text-white shadow-lg transition-all hover:scale-105 hover:shadow-xl disabled:opacity-50"
				on:click={shuffleCards}
				disabled={isRevealing || isShuffling}
			>
				カードをシャッフル
			</button>
		</div>

		<!-- Fortune Cards Grid -->
		<div
			class="mb-8 grid grid-cols-2 gap-6 sm:grid-cols-3 lg:grid-cols-4"
			class:pointer-events-none={isShuffling}
		>
			{#each shuffledFortunes as fortune (fortune.number)}
				<div
					class="transform transition-all duration-300"
					class:animate-shake={isShuffling}
					style="transition-delay: {Math.random() * 0.2}s"
				>
					<button
						type="button"
						class="group relative h-48 w-full transform cursor-pointer transition-all duration-300 hover:scale-105"
						class:opacity-50={isRevealing && selectedCard !== fortune.number}
						on:click={() => goToResult(fortune.number)}
						disabled={isRevealing || isShuffling}
					>
						<div
							class="absolute inset-0 rounded-xl bg-gradient-to-br {fortune.color} opacity-75 transition-opacity group-hover:opacity-100"
						></div>
						<div
							class="relative h-full rounded-xl border border-white/20 bg-white/10 p-6 backdrop-blur-sm"
						>
							<div
								class="writing-vertical flex h-full items-center justify-center space-y-2 text-2xl font-medium text-white"
							>
								<div class="font-bold text-yellow-300">{fortune.name}</div>
								<div class="text-base opacity-90">{fortune.description}</div>
							</div>
						</div>
					</button>
				</div>
			{/each}
		</div>

		<!-- Action Button -->
		<div class="mt-8 text-center" class:hidden={isRevealing}>
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

	@keyframes shake {
		0%,
		100% {
			transform: translateX(0);
		}
		25% {
			transform: translateX(-5px) rotate(-1deg);
		}
		75% {
			transform: translateX(5px) rotate(1deg);
		}
	}

	.animate-shake {
		animation: shake 0.5s ease-in-out;
	}
</style>
