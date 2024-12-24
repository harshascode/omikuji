<script lang="ts">
	const features = [
		['🎯', '大吉・大凶', '2種のみ'],
		['👤', 'ひとりさま', '1日1本'],
		['💝', '恋愛成就', 'お守り'],
		['💫', '恋愛状況', '4タイプ']
	];

	const stats = [
		['10K+', 'ユーザー'],
		['50K+', 'おみくじ'],
		['95%', '満足度'],
		['24/7', 'サポート']
	];
</script>

<!-- Main Layout -->
<main class="min-h-screen bg-gradient-to-br from-red-50 via-pink-50 to-white font-sans">
	<!-- Hero Section -->
	<header class="container mx-auto px-6 py-24 text-center">
		<h1
			class="mb-8 bg-gradient-to-r from-red-600 to-pink-600 bg-clip-text text-7xl font-extrabold text-transparent md:text-8xl"
		>
			恋みくじ
		</h1>
		<p class="text-2xl font-medium tracking-wide text-gray-700">運命の恋を占う666666</p>
	</header>

	<!-- Koi Image Section -->
	<section class="my-20 flex justify-center" aria-label="Decorative Koi Fish">
		<img
			src="/koi-mikuji-fish.svg"
			alt="Koi Fish"
			width="448"
			height="448"
			class="w-72 transform transition-all duration-700 hover:scale-110 md:w-[28rem]"
			loading="lazy"
			decoding="async"
		/>
	</section>

	<!-- Features Grid -->
	<section class="container mx-auto px-6" aria-label="Features">
		<div class="mt-24 grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-4">
			{#each features as [icon, title, subtitle]}
				<article
					class="rounded-2xl bg-white p-8 shadow-xl transition-transform duration-300 hover:-translate-y-2 hover:shadow-2xl"
				>
					<div class="text-center">
						<span class="inline-block text-5xl" aria-hidden="true">{icon}</span>
						<h2 class="mt-6 text-2xl font-bold text-gray-800">{title}</h2>
						<p class="mt-3 text-gray-600">{subtitle}</p>
					</div>
				</article>
			{/each}
		</div>
	</section>

	<!-- CTA Section -->
	<section class="container mx-auto mt-24 px-6 text-center">
		<a
			href="/draw"
			class="inline-flex items-center rounded-full bg-gradient-to-r from-red-500 to-pink-500 px-10 py-5 text-xl font-bold text-white shadow-lg transition-all duration-300 hover:shadow-xl"
		>
			恋みくじを引く
			<svg class="ml-3 h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
				<path
					stroke-linecap="round"
					stroke-linejoin="round"
					stroke-width="2"
					d="M13 7l5 5m0 0l-5 5m5-5H6"
				/>
			</svg>
		</a>
	</section>

	<!-- Description Section -->
	<section class="mt-24 bg-white py-24">
		<div class="container mx-auto max-w-4xl px-6">
			<div class="rounded-3xl bg-gradient-to-r from-red-50 to-pink-50 p-12 shadow-xl">
				<h2 class="mb-8 text-center text-4xl font-bold text-red-600">恋愛成就のおみくじ</h2>
				<div class="space-y-6 text-center text-lg leading-relaxed text-gray-700">
					<p>おみくじ堂の恋みくじは、大吉か大凶の言葉のみ。</p>
					<p>結果の言葉の解釈は、あなたの人生を自由に導きます。</p>
					<p>恋みくじは、あなたの背中を優しく押す道しるべとなります。</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Stats Section -->
	<section class="bg-gradient-to-r from-red-600 to-pink-600 py-16 text-white">
		<div class="container mx-auto px-6">
			<div class="grid grid-cols-2 gap-12 md:grid-cols-4">
				{#each stats as [number, label]}
					<div class="text-center">
						<div class="text-4xl font-bold">{number}</div>
						<div class="mt-3 text-base font-medium">{label}</div>
					</div>
				{/each}
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="bg-gray-900 py-16 text-white">
		<div class="container mx-auto px-6 text-center">
			<h2 class="text-4xl font-bold">恋みくじ</h2>
			<nav class="mt-8" aria-label="Footer Navigation">
				<ul class="flex justify-center space-x-12">
					<li><a href="/" class="text-lg transition-colors hover:text-pink-400">ホーム</a></li>
					<li>
						<a href="/draw" class="text-lg transition-colors hover:text-pink-400">おみくじを引く</a>
					</li>
					<li><a href="/about" class="text-lg transition-colors hover:text-pink-400">About</a></li>
				</ul>
			</nav>
			<p class="mt-12 text-base text-gray-400">
				© {new Date().getFullYear()} KOI-MIKUJI. All rights reserved.
			</p>
		</div>
	</footer>
</main>

<style>
	/* Koi fish animation using CSS */
	img {
		animation: float 6s ease-in-out infinite;
	}

	@keyframes float {
		0%,
		100% {
			transform: translateY(0);
		}
		50% {
			transform: translateY(-20px);
		}
	}
</style>
