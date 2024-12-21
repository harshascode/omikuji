<script lang="ts">
    function goToResult(fortune: number) {
        window.location.href = `/result/${fortune}`;
    }
</script>

<div class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-lg text-center">
        <h1 class="text-3xl font-bold mb-4">恋みくじを引く</h1>
        <p class="mb-6 text-gray-600">心を穏やかにし、恋みくじをタップしてください。</p>

        <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            {#each Array(4) as _, i}
                <button
                    type="button"
                    class="cursor-pointer bg-gray-200 p-4 rounded-lg hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
                    on:click={() => goToResult(i + 1)}
                >
                    恋みくじ {i + 1}
                </button>
            {/each}
        </div>
    </div>
</div>
