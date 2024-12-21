<script lang="ts">
	import { onMount } from 'svelte';
	import { fade, fly } from 'svelte/transition';

	let isLoaded = false;
	let currentYear = new Date().getFullYear();

	onMount(() => {
		isLoaded = true;
	});

	const features = [
		{ icon: '🎯', title: '大吉・大凶', subtitle: '2種のみ' },
		{ icon: '👤', title: 'ひとりさま', subtitle: '1日1本' },
		{ icon: '💝', title: '恋愛成就', subtitle: 'お守り' },
		{ icon: '💫', title: '恋愛状況', subtitle: '4タイプ' }
	];

	const stats = [
		{ number: '10K+', label: 'ユーザー' },
		{ number: '50K+', label: 'おみくじ' },
		{ number: '95%', label: '満足度' },
		{ number: '24/7', label: 'サポート' }
	];
</script>

<div class="min-h-screen bg-gradient-to-br from-red-50 to-pink-50 font-sans">
	{#if isLoaded}
		<div class="relative overflow-hidden">
			<!-- Hero Section -->
			<div class="container mx-auto px-4 py-16">
				<div class="text-center" in:fly={{ y: 50, duration: 1000 }}>
					<h1
						class="mb-6 bg-gradient-to-r from-red-600 to-pink-600 bg-clip-text text-6xl font-bold text-transparent md:text-8xl"
					>
						恋みくじ
					</h1>
					<p class="text-xl font-medium text-gray-700">運命の恋を占う</p>
				</div>

				<!-- Koi Fish Image -->
				<div class="my-16 flex justify-center">
					<img
						src="/koi-mikuji-fish.svg"
						alt="Koi Fish"
						class="w-64 transform animate-pulse transition-all duration-500 hover:scale-105 md:w-96"
					/>
				</div>

				<!-- Feature Grid -->
				<div class="mt-16 grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-4">
					{#each features as feature, i}
						<div
							in:fly={{ y: 50, duration: 1000, delay: i * 200 }}
							class="group rounded-xl bg-white p-6 shadow-lg transition-all duration-300 hover:-translate-y-2 hover:shadow-2xl"
						>
							<div class="text-center">
								<span
									class="inline-block text-4xl transition-transform duration-300 group-hover:scale-110"
								>
									{feature.icon}
								</span>
								<h3 class="mt-4 text-xl font-bold text-gray-800">{feature.title}</h3>
								<p class="mt-2 text-gray-600">{feature.subtitle}</p>
							</div>
						</div>
					{/each}
				</div>

				<!-- CTA Section -->
				<div class="mt-16 text-center">
					<a
						href="/draw"
						class="group inline-flex transform items-center rounded-full bg-gradient-to-r from-red-500 to-pink-500 px-8 py-4 text-lg font-bold text-white shadow-lg transition-all duration-300 hover:-translate-y-1 hover:shadow-xl"
					>
						恋みくじを引く
						<svg
							class="ml-2 h-5 w-5 transform transition-transform duration-300 group-hover:translate-x-1"
							fill="none"
							stroke="currentColor"
							viewBox="0 0 24 24"
						>
							<path
								stroke-linecap="round"
								stroke-linejoin="round"
								stroke-width="2"
								d="M13 7l5 5m0 0l-5 5m5-5H6"
							/>
						</svg>
					</a>
				</div>
			</div>

			<!-- Description Section -->
			<div class="mt-20 bg-white py-16">
				<div class="container mx-auto max-w-3xl px-4">
					<div
						class="overflow-hidden rounded-2xl bg-gradient-to-r from-red-50 to-pink-50 p-8 shadow-lg"
					>
						<h2 class="mb-6 text-center text-3xl font-bold text-red-600">恋愛成就のおみくじ</h2>
						<div class="space-y-4 text-center leading-relaxed text-gray-700">
							<p>おみくじ堂の恋みくじは、大吉か大凶の言葉のみ。</p>
							<p>結果の言葉の解釈は、あなたの人生を自由に導きます。</p>
							<p>恋みくじは、あなたの背中を優しく押す道しるべとなります。</p>
						</div>
					</div>
				</div>
			</div>

			<!-- Stats Section -->
			<div class="bg-gradient-to-r from-red-600 to-pink-600 py-12 text-white">
				<div class="container mx-auto px-4">
					<div class="grid grid-cols-2 gap-8 md:grid-cols-4">
						{#each stats as stat}
							<div class="text-center">
								<div class="text-3xl font-bold">{stat.number}</div>
								<div class="mt-2 text-sm">{stat.label}</div>
							</div>
						{/each}
					</div>
				</div>
			</div>

			<!-- Footer -->
			<footer class="bg-gray-900 py-12 text-white">
				<div class="container mx-auto px-4">
					<div class="text-center">
						<h2 class="text-3xl font-bold">恋みくじ</h2>
						<nav class="mt-6">
							<ul class="flex justify-center space-x-8">
								<li><a href="/" class="transition-colors hover:text-pink-400">ホーム</a></li>
								<li>
									<a href="/draw" class="transition-colors hover:text-pink-400">おみくじを引く</a>
								</li>
								<li><a href="/about" class="transition-colors hover:text-pink-400">About</a></li>
							</ul>
						</nav>
						<p class="mt-8 text-sm text-gray-400">
							© {currentYear} KOI-MIKUJI. All rights reserved.
						</p>
					</div>
				</div>
			</footer>
		</div>
	{/if}
</div>
