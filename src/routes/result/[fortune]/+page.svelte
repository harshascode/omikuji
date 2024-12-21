<script lang="ts">
	import { page } from '$app/stores';

	// Extract the `fortune` parameter from the URL
	const fortune = parseInt($page.params.fortune, 10);

	// Map of fortune numbers to image paths
	const fortuneImages: Record<number, string> = {
		1: '/images/fortune1.png',
		2: '/images/fortune2.png',
		3: '/images/fortune3.png',
		4: '/images/fortune4.png'
	};

	// Get the corresponding image source
	const imageSrc = fortuneImages[fortune] || '/images/default.png';
</script>

<main class="flex min-h-screen flex-col items-center justify-center bg-gray-100">
	<div class="rounded-lg bg-white p-6 text-center shadow-lg">
		<h1 class="mb-4 text-2xl font-bold">Your Fortune Result</h1>
		<img src={imageSrc} alt="Your fortune result" class="w-1/2 rounded-lg shadow-md" />
	</div>
</main>
