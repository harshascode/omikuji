<script lang="ts">
	import { fade, scale } from 'svelte/transition';

	let selectedCard: number | null = null;
	let isRevealing = false;
	let showFortune = false;
	let fortuneNumber: number | null = null;

	const cards = Array.from({ length: 32 }, (_, i) => ({
		id: i,
		isFlipped: false
	}));

	function selectCard(cardId: number) {
		if (selectedCard !== null || isRevealing) return;

		selectedCard = cardId;
		isRevealing = true;

		// Calculate fortune number (1-4) based on the card selected
		fortuneNumber = (cardId % 4) + 1;

		// Add animation delay before showing fortune
		setTimeout(() => {
			showFortune = true;
		}, 1000);
	}

	function goToResult(fortune: number) {
		window.location.href = `/result/${fortune}`;
	}

	function resetSelection() {
		selectedCard = null;
		isRevealing = false;
		showFortune = false;
		fortuneNumber = null;
	}
</script>

<div
	class="flex min-h-screen flex-col items-center bg-gradient-to-b from-red-50 to-pink-50 px-4 py-12"
>
	<!-- Title Section -->
	<div class="mb-12 text-center">
		<h1 class="mb-8 text-4xl font-medium tracking-wider text-red-900">恋みくじを引く</h1>
		<p class="mb-12 text-lg tracking-wider text-red-700">
			{#if !selectedCard}
				心を穏やかにし、恋みくじをタップしてください。
			{:else if isRevealing && !showFortune}
				運命が決まっています...
			{:else}
				あなたの運勢が明らかになりました！
			{/if}
		</p>
	</div>

	{#if !showFortune}
		<!-- Fortune Cards Grid -->
		<div class="w-full max-w-5xl">
			<div class="mb-4 grid grid-cols-4 gap-4 md:grid-cols-8">
				{#each cards.slice(0, 16) as card}
					<button
						on:click={() => selectCard(card.id)}
						class="transform transition-all duration-500"
						class:opacity-50={selectedCard !== null && selectedCard !== card.id}
						disabled={selectedCard !== null}
					>
						<div
							class="flex aspect-[1/3] flex-col items-center justify-between rounded bg-[#DC0000] p-4 text-white transition-all hover:bg-[#B00000]"
							class:scale-110={selectedCard === card.id}
							class:rotate-y-180={selectedCard === card.id}
						>
							<svg
								class="h-4 w-4"
								xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 24 24"
								fill="none"
								stroke="currentColor"
								stroke-width="2"
								stroke-linecap="round"
								stroke-linejoin="round"
							>
								<path d="M7 17L17 7M7 7h10v10" />
							</svg>
							<div class="writing-vertical text-gold-500">
								<div class="text-yellow-400">恋</div>
								<div>み</div>
								<div>く</div>
								<div>じ</div>
							</div>
						</div>
					</button>
				{/each}
			</div>
			<div class="mb-12 grid grid-cols-4 gap-4 md:grid-cols-8">
				{#each cards.slice(16) as card}
					<button
						on:click={() => selectCard(card.id)}
						class="transform transition-all duration-500"
						class:opacity-50={selectedCard !== null && selectedCard !== card.id}
						disabled={selectedCard !== null}
					>
						<div
							class="flex aspect-[1/3] flex-col items-center justify-between rounded bg-[#DC0000] p-4 text-white transition-all hover:bg-[#B00000]"
							class:scale-110={selectedCard === card.id}
							class:rotate-y-180={selectedCard === card.id}
						>
							<svg
								class="h-4 w-4"
								xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 24 24"
								fill="none"
								stroke="currentColor"
								stroke-width="2"
								stroke-linecap="round"
								stroke-linejoin="round"
							>
								<path d="M7 17L17 7M7 7h10v10" />
							</svg>
							<div class="writing-vertical text-gold-500">
								<div class="text-yellow-400">恋</div>
								<div>み</div>
								<div>く</div>
								<div>じ</div>
							</div>
						</div>
					</button>
				{/each}
			</div>
		</div>
	{:else}
		<!-- Fortune Preview Card -->
		<div
			class="w-full max-w-md rounded-xl bg-white p-8 text-center shadow-2xl"
			in:scale={{ duration: 400, delay: 200 }}
		>
			<h2 class="mb-6 text-2xl font-bold text-red-900">Your Fortune</h2>
			<div class="mb-8">
				<div class="mx-auto flex h-48 w-48 items-center justify-center rounded-lg bg-red-100">
					<span class="text-6xl">🎋</span>
				</div>
			</div>
			<div class="space-y-4">
				<button
					on:click={() => goToResult(fortuneNumber)}
					class="w-full rounded-full bg-red-600 px-8 py-3 text-lg text-white transition-colors hover:bg-red-700"
				>
					運勢を見る (View Fortune)
				</button>
				<button
					on:click={resetSelection}
					class="w-full rounded-full bg-gray-200 px-8 py-3 text-lg text-gray-800 transition-colors hover:bg-gray-300"
				>
					もう一度引く (Try Again)
				</button>
			</div>
		</div>
	{/if}
</div>

<style>
	.writing-vertical {
		writing-mode: vertical-rl;
		text-orientation: upright;
	}

	.rotate-y-180 {
		transform: rotateY(180deg);
	}

	button:disabled {
		cursor: not-allowed;
	}

	.scale-110 {
		transform: scale(1.1);
	}
</style>
