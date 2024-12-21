<script lang="ts">
	import { page } from '$app/state';
	import { fade, fly } from 'svelte/transition';

	// Define the interface for fortune entries
	interface FortuneEntry {
		image: string;
		title: string;
		titleEn: string;
		description: string;
		points: string[];
	}

	// Extract the `fortune` parameter from the URL
	const fortune = parseInt(page.params.fortune, 10);

	// Fortune data mapping with proper typing
	const fortuneData: Record<number, FortuneEntry> = {
		1: {
			image: '/images/fortune1.png',
			title: '大吉',
			titleEn: 'Excellent Fortune',
			description:
				'A wonderful romance is about to begin. Keep your heart open to new possibilities!',
			points: [
				'✨ Love will find you unexpectedly',
				'💝 Your sincere feelings will reach someone special',
				'🌸 A perfect time for new beginnings',
				'⭐ Your charm is at its peak'
			]
		},
		2: {
			image: '/images/fortune2.png',
			title: '中吉',
			titleEn: 'Good Fortune',
			description: 'Positive energy surrounds your love life. Stay optimistic!',
			points: [
				'💫 Good opportunities are coming',
				'💌 Express your feelings openly',
				'🍀 Lucky encounters await',
				'🌟 Your efforts will be rewarded'
			]
		},
		3: {
			image: '/images/fortune3.png',
			title: '小吉',
			titleEn: 'Moderate Fortune',
			description: 'Take small steps forward in love. Patience is key.',
			points: [
				'💭 Focus on self-improvement',
				'💖 Build stronger connections',
				'🌱 Nurture existing relationships',
				'✨ Good things come to those who wait'
			]
		},
		4: {
			image: '/images/fortune4.png',
			title: '末吉',
			titleEn: 'Future Fortune',
			description: 'The seeds of love are being planted. Trust in the timing of life.',
			points: [
				'🌈 Better days are ahead',
				'💫 Keep believing in love',
				'🍀 Learn from past experiences',
				'💝 Your time will come'
			]
		},
		5: {
			image: '/images/fortune4.png',
			title: '末吉',
			titleEn: 'Future Fortune',
			description: 'The seeds of love are being planted. Trust in the timing of life.',
			points: [
				'🌈 Better days are ahead',
				'💫 Keep believing in love',
				'🍀 Learn from past experiences',
				'💝 Your time will come'
			]
		},
		6: {
			image: '/images/fortune4.png',
			title: '末吉',
			titleEn: 'Future Fortune',
			description: 'The seeds of love are being planted. Trust in the timing of life.',
			points: [
				'🌈 Better days are ahead',
				'💫 Keep believing in love',
				'🍀 Learn from past experiences',
				'💝 Your time will come'
			]
		},
		7: {
			image: '/images/fortune4.png',
			title: '末吉',
			titleEn: 'Future Fortune',
			description: 'The seeds of love are being planted. Trust in the timing of life.',
			points: [
				'🌈 Better days are ahead',
				'💫 Keep believing in love',
				'🍀 Learn from past experiences',
				'💝 Your time will come'
			]
		},
		8: {
			image: '/images/fortune4.png',
			title: '末吉',
			titleEn: 'Future Fortune',
			description: 'The seeds of love are being planted. Trust in the timing of life.',
			points: [
				'🌈 Better days are ahead',
				'💫 Keep believing in love',
				'🍀 Learn from past experiences',
				'💝 Your time will come'
			]
		}
	};

	const currentFortune = fortuneData[fortune] || {
		image: '/images/default.png',
		title: '運命',
		titleEn: 'Unknown Fortune',
		description: 'Please try again',
		points: []
	};

	function goHome() {
		window.location.href = '/';
	}

	function tryAgain() {
		window.location.href = '/result';
	}
</script>

<main
	class="min-h-screen bg-gradient-to-b from-red-50 to-pink-50 px-4 py-12"
	in:fade={{ duration: 300 }}
>
	<div class="mx-auto max-w-2xl">
		<div class="overflow-hidden rounded-2xl bg-white/90 shadow-xl backdrop-blur-sm">
			<!-- Header -->
			<div class="bg-gradient-to-r from-red-600 to-pink-600 p-6 text-center text-white">
				<h1 class="mb-2 text-3xl font-bold">{currentFortune.title}</h1>
				<p class="text-lg opacity-90">{currentFortune.titleEn}</p>
			</div>

			<!-- Content -->
			<div class="p-8">
				<!-- Fortune Image -->
				<div class="relative mb-8" in:fly={{ y: 50, duration: 500, delay: 300 }}>
					<div
						class="absolute inset-0 rounded-full bg-gradient-to-b from-pink-200 to-red-200 opacity-50 blur-xl"
					></div>
					<img
						src={currentFortune.image}
						alt="Fortune result"
						class="relative mx-auto h-full w-full transform rounded-lg object-contain shadow-lg transition-transform hover:scale-105"
					/>
				</div>

				<!-- Fortune Description -->
				<div class="mb-8 text-center" in:fly={{ y: 50, duration: 500, delay: 400 }}>
					<p class="text-lg leading-relaxed text-gray-700">
						{currentFortune.description}
					</p>
				</div>

				<!-- Fortune Points -->
				<div class="mb-8 space-y-3" in:fly={{ y: 50, duration: 500, delay: 500 }}>
					{#each currentFortune.points as point}
						<div class="rounded-lg bg-red-50 p-4 text-red-800">
							{point}
						</div>
					{/each}
				</div>

				<!-- Action Buttons -->
				<div class="flex flex-col gap-4" in:fly={{ y: 50, duration: 500, delay: 600 }}>
					<button
						on:click={tryAgain}
						class="transform rounded-full bg-gradient-to-r from-red-600 to-pink-600 px-8 py-3 text-lg text-white shadow-lg transition-all hover:-translate-y-1 hover:shadow-xl"
					>
						もう一度おみくじを引く
					</button>
					<button
						on:click={goHome}
						class="rounded-full bg-gray-200 px-8 py-3 text-lg text-gray-800 transition-colors hover:bg-gray-300"
					>
						トップに戻る
					</button>
				</div>
			</div>
		</div>
	</div>
</main>

<style>
	:global(body) {
		margin: 0;
		padding: 0;
	}
</style>
