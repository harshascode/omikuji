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

<div class="min-h-screen bg-gradient-to-br from-red-50 via-pink-50 to-white font-sans">
	{#if isLoaded}
		<div class="relative">
			<!-- Hero Section -->
			<div class="container mx-auto px-6 py-24">
				<div class="text-center" in:fly={{ y: 50, duration: 1000 }}>
					<h1
						class="mb-8 bg-gradient-to-r from-red-600 to-pink-600 bg-clip-text text-7xl font-extrabold text-transparent md:text-8xl"
					>
						恋みくじ
					</h1>
					<p class="text-2xl font-medium tracking-wide text-gray-700">運命の恋を占う</p>
				</div>

				<!-- Koi Fish Image -->
				<div class="my-20 flex justify-center">
					<img
						src="/koi-mikuji-fish.svg"
						alt="Koi Fish"
						class="animate-float w-72 transform transition-all duration-700 hover:scale-110 md:w-[28rem]"
					/>
				</div>

				<!-- Feature Grid -->
				<div class="mt-24 grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-4">
					{#each features as feature, i}
						<div
							in:fly={{ y: 50, duration: 1000, delay: i * 200 }}
							class="group rounded-2xl bg-white p-8 shadow-xl transition-all duration-500 hover:-translate-y-2 hover:bg-gradient-to-br hover:from-white hover:to-pink-50 hover:shadow-2xl"
						>
							<div class="text-center">
								<span
									class="inline-block text-5xl transition-transform duration-500 group-hover:rotate-3 group-hover:scale-110"
								>
									{feature.icon}
								</span>
								<h3 class="mt-6 text-2xl font-bold text-gray-800">{feature.title}</h3>
								<p class="mt-3 text-gray-600">{feature.subtitle}</p>
							</div>
						</div>
					{/each}
				</div>

				<!-- CTA Section -->
				<div class="mt-24 text-center">
					<a
						href="/draw"
						class="group inline-flex transform items-center rounded-full bg-gradient-to-r from-red-500 to-pink-500 px-10 py-5 text-xl font-bold text-white shadow-lg transition-all duration-500 hover:scale-105 hover:shadow-xl hover:shadow-pink-200"
					>
						恋みくじを引く
						<svg
							class="ml-3 h-6 w-6 transform transition-transform duration-500 group-hover:translate-x-2"
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
			<div class="mt-24 bg-white py-24">
				<div class="container mx-auto max-w-4xl px-6">
					<div
						class="overflow-hidden rounded-3xl bg-gradient-to-r from-red-50 to-pink-50 p-12 shadow-xl"
					>
						<h2 class="mb-8 text-center text-4xl font-bold text-red-600">恋愛成就のおみくじ</h2>
						<div class="space-y-6 text-center text-lg leading-relaxed text-gray-700">
							<p class="transition-all duration-300 hover:text-red-600">
								おみくじ堂の恋みくじは、大吉か大凶の言葉のみ。
							</p>
							<p class="transition-all duration-300 hover:text-red-600">
								結果の言葉の解釈は、あなたの人生を自由に導きます。
							</p>
							<p class="transition-all duration-300 hover:text-red-600">
								恋みくじは、あなたの背中を優しく押す道しるべとなります。
							</p>
						</div>
					</div>
				</div>
			</div>

			<!-- Stats Section -->
			<div class="bg-gradient-to-r from-red-600 to-pink-600 py-16 text-white">
				<div class="container mx-auto px-6">
					<div class="grid grid-cols-2 gap-12 md:grid-cols-4">
						{#each stats as stat}
							<div class="transform text-center transition-transform duration-300 hover:scale-105">
								<div class="text-4xl font-bold">{stat.number}</div>
								<div class="mt-3 text-base font-medium">{stat.label}</div>
							</div>
						{/each}
					</div>
				</div>
			</div>

			<!-- Footer -->
			<footer class="bg-gray-900 py-16 text-white">
				<div class="container mx-auto px-6">
					<div class="text-center">
						<h2 class="text-4xl font-bold">恋みくじ</h2>
						<nav class="mt-8">
							<ul class="flex justify-center space-x-12">
								<li>
									<a href="/" class="text-lg transition-colors duration-300 hover:text-pink-400">
										ホーム
									</a>
								</li>
								<li>
									<a
										href="/draw"
										class="text-lg transition-colors duration-300 hover:text-pink-400"
									>
										おみくじを引く
									</a>
								</li>
								<li>
									<a
										href="/about"
										class="text-lg transition-colors duration-300 hover:text-pink-400"
									>
										About
									</a>
								</li>
							</ul>
						</nav>
						<p class="mt-12 text-base text-gray-400">
							© {currentYear} KOI-MIKUJI. All rights reserved.
						</p>
					</div>
				</div>
			</footer>
		</div>
	{/if}
</div>

<style>
	@keyframes float {
		0% {
			transform: translateY(0px);
		}
		50% {
			transform: translateY(-20px);
		}
		100% {
			transform: translateY(0px);
		}
	}

	.animate-float {
		animation: float 6s ease-in-out infinite;
	}
</style>
