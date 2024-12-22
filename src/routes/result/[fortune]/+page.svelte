<script lang="ts">
	import { page } from '$app/state';
	import { fortuneData } from '$lib/fortuneData';

	// Load fortune from URL parameter
	const fortune = parseInt(page.params.fortune, 10);
	const currentFortune = fortuneData[fortune as keyof typeof fortuneData] || {
		image: '/images/default.png',
		title: '運命',
		titleEn: 'Unknown Fortune',
		description: 'Please try again',
		points: []
	};

	// Get user data from session storage
	let userData = {
		nickname: ''
	};

	if (typeof window !== 'undefined') {
		const stored = sessionStorage.getItem('fortuneUserData');
		if (stored) {
			userData = JSON.parse(stored);
		}
	}
</script>

<svelte:head>
	<title>{currentFortune.titleEn} - おみくじ</title>
	<meta name="description" content={currentFortune.description} />
</svelte:head>

<main class="min-h-screen bg-gradient-to-b from-red-50 to-pink-50 px-4 py-12">
	<article class="animate-fade-in mx-auto max-w-2xl">
		<div class="overflow-hidden rounded-2xl bg-white/90 shadow-xl backdrop-blur-sm">
			<!-- Header -->
			<header class="bg-gradient-to-r from-red-600 to-pink-600 p-6 text-center text-white">
				<h1 class="mb-2 text-3xl font-bold">{currentFortune.title}</h1>
				<p class="text-lg opacity-90">{currentFortune.titleEn}</p>
			</header>

			<div class="space-y-8 p-8">
				<!-- User Greeting -->
				{#if userData.nickname}
					<div class="animate-slide-up text-center">
						<p class="text-lg leading-relaxed text-gray-700">
							こんにちは、{userData.nickname}さん。
						</p>
					</div>
				{/if}

				<!-- Fortune Image -->
				<figure class="animate-slide-up relative">
					<div
						class="absolute inset-0 rounded-full bg-gradient-to-b from-pink-200
                                to-red-200 opacity-50 blur-xl"
					></div>
					<img
						src={currentFortune.image}
						alt={`Fortune: ${currentFortune.titleEn}`}
						class="relative mx-auto w-full transform rounded-lg shadow-lg
                               transition-transform duration-300 hover:scale-105"
						loading="eager"
					/>
				</figure>

				<!-- Fortune Description -->
				<div class="animate-slide-up text-center">
					<p class="text-lg leading-relaxed text-gray-700">
						{currentFortune.description}
					</p>
				</div>

				<!-- Fortune Points -->
				<ul class="animate-slide-up space-y-3" role="list">
					{#each currentFortune.points as point}
						<li class="rounded-lg bg-red-50 p-4 text-red-800">
							{point}
						</li>
					{/each}
				</ul>

				<!-- Navigation and Sharing -->
				<nav class="animate-slide-up flex flex-col gap-4">
					<a
						href="/draw"
						class="transform rounded-full bg-gradient-to-r from-red-600 to-pink-600
                              px-8 py-3 text-center text-lg text-white shadow-lg
                              transition-all duration-300 hover:-translate-y-1 hover:shadow-xl"
					>
						もう一度おみくじを引く
					</a>

					<a
						href="/"
						class="rounded-full bg-gray-200 px-8 py-3 text-center text-lg
                              text-gray-800 transition-colors duration-300 hover:bg-gray-300"
					>
						トップに戻る
					</a>

					<!-- Social Share Links -->
					<div class="mt-4 grid grid-cols-3 gap-4">
						<a
							href={`https://twitter.com/intent/tweet?text=${encodeURIComponent(
								`${userData.nickname}さんの運命の結果は「${currentFortune.titleEn}」です！`
							)}&url=${encodeURIComponent(page.url.href)}`}
							target="_blank"
							rel="noopener noreferrer"
							class="transform rounded-full bg-blue-500 px-6 py-3 text-center
                                  text-white shadow-lg transition-all duration-300
                                  hover:scale-105 hover:shadow-xl"
						>
							Twitter で共有
						</a>

						<a
							href={`https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(
								page.url.href
							)}`}
							target="_blank"
							rel="noopener noreferrer"
							class="transform rounded-full bg-blue-700 px-6 py-3 text-center
                                  text-white shadow-lg transition-all duration-300
                                  hover:scale-105 hover:shadow-xl"
						>
							Facebook で共有
						</a>

						<a
							href={`https://line.me/R/msg/text/?${encodeURIComponent(
								`${userData.nickname}さんの運命の結果は「${currentFortune.titleEn}」です！ ${page.url.href}`
							)}`}
							target="_blank"
							rel="noopener noreferrer"
							class="transform rounded-full bg-green-500 px-6 py-3 text-center
                                  text-white shadow-lg transition-all duration-300
                                  hover:scale-105 hover:shadow-xl"
						>
							LINE で共有
						</a>
					</div>
				</nav>
			</div>
		</div>
	</article>
</main>

<style>
	/* Base animations */
	.animate-fade-in {
		animation: fadeIn 0.5s ease-out;
	}

	.animate-slide-up {
		animation: slideUp 0.5s ease-out;
	}

	@keyframes fadeIn {
		from {
			opacity: 0;
		}
		to {
			opacity: 1;
		}
	}

	@keyframes slideUp {
		from {
			opacity: 0;
			transform: translateY(20px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}

	/* Accessibility - Reduced motion */
	@media (prefers-reduced-motion: reduce) {
		.animate-fade-in,
		.animate-slide-up {
			animation: none;
		}
	}
</style>
