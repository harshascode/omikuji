<script lang="ts">
	function goToResult(fortune: number) {
		window.location.href = `/result/${fortune}`;
	}
</script>

<div class="flex min-h-screen items-center justify-center bg-gray-100">
	<div class="w-full max-w-lg rounded-lg bg-white p-8 text-center shadow-lg">
		<h1 class="mb-4 text-3xl font-bold">恋みくじを引く</h1>
		<p class="mb-6 text-gray-600">心を穏やかにし、恋みくじをタップしてください。</p>

		<div class="grid grid-cols-2 gap-4 md:grid-cols-4">
			{#each Array(4) as _, i}
				<button
					type="button"
					class="cursor-pointer rounded-lg bg-gray-200 p-4 hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
					on:click={() => goToResult(i + 1)}
				>
					恋みくじ {i + 1}
				</button>
			{/each}
		</div>
	</div>
</div>
