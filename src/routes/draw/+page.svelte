<script lang="ts">
	import { onMount } from 'svelte';

	let nickname = '';
	let gender = '';
	let loveStatus = '';
	let isFormValid = false;
	let isSubmitting = false;

	// Form validation
	$: isFormValid =
		nickname.length > 0 && nickname.length <= 10 && gender !== '' && loveStatus !== '';

	// Handle form submission
	function handleSubmit() {
		if (!isFormValid) return;

		isSubmitting = true;
		// Store user data in session storage
		sessionStorage.setItem(
			'fortuneUserData',
			JSON.stringify({
				nickname,
				gender,
				loveStatus,
				timestamp: new Date().toISOString()
			})
		);

		// Navigate to card selection
		window.location.href = '/result';
	}
</script>

<div class="min-h-screen bg-gradient-to-br from-purple-50 via-pink-50 to-red-50 p-4">
	<div class="mx-auto max-w-2xl">
		<!-- Header Section -->
		<div class="animate-fade-in p-8 text-center">
			<h1 class="mb-4 text-4xl font-bold text-red-500">✨ 運命の占い ✨</h1>
			<p class="text-lg text-gray-700">あなたの未来をカードが導きます</p>
			<div class="mt-4 rounded-lg bg-white/60 p-4 backdrop-blur-sm">
				<p class="text-gray-600">
					あなたの情報を入力して、神秘的なカードの世界への扉を開きましょう。
				</p>
			</div>
		</div>

		<!-- Form Section -->
		<div class="animate-slide-up space-y-6 rounded-xl bg-white/80 p-6 shadow-lg backdrop-blur-md">
			<form on:submit|preventDefault={handleSubmit} class="space-y-8">
				<!-- Nickname Input -->
				<div class="transform transition duration-300 hover:scale-[1.02]">
					<div class="rounded-lg border-2 border-pink-100 bg-white p-6">
						<label for="nickname" class="mb-4 block text-xl font-bold text-gray-800">
							🎭 ニックネーム
						</label>
						<input
							type="text"
							bind:value={nickname}
							class="w-full rounded-lg border-2 border-pink-200 p-3
                                   transition-all duration-300 focus:outline-none
                                   focus:ring-2 focus:ring-pink-400"
							placeholder="運命の名前を入力 (最大10文字)"
							maxlength="10"
						/>
						<div class="mt-2 flex items-center text-sm text-gray-500">
							<svg class="mr-2 h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
								<path
									fill-rule="evenodd"
									d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
									clip-rule="evenodd"
								/>
							</svg>
							<span>※結果ページに表示される名前です</span>
						</div>
					</div>
				</div>

				<!-- Gender Selection -->
				<div class="transform transition duration-300 hover:scale-[1.02]">
					<div class="rounded-lg border-2 border-pink-100 bg-white p-6">
						<input aria-label="Gender" />
						<label for="gender" class="mb-4 block text-xl font-bold text-gray-800"> 👤 性別 </label>
						<div class="grid grid-cols-3 gap-4">
							{#each ['female', 'male', 'other'] as value}
								<label class="relative">
									<input type="radio" {value} bind:group={gender} class="absolute opacity-0" />
									<div
										class="cursor-pointer rounded-lg border-2 border-pink-200
                                                p-3 text-center
                                                {gender === value
											? 'bg-pink-500 text-white'
											: 'bg-white text-gray-700'}
                                                transition-all duration-300 hover:border-pink-400"
									>
										{value === 'female' ? '女性' : value === 'male' ? '男性' : 'その他'}
									</div>
								</label>
							{/each}
						</div>
					</div>
				</div>

				<!-- Love Status -->
				<div class="transform transition duration-300 hover:scale-[1.02]">
					<div class="rounded-lg border-2 border-pink-100 bg-white p-6">
						<label for="love-status" class="mb-4 block text-xl font-bold text-gray-800">
							💖 恋愛状況
						</label>
						<select
							bind:value={loveStatus}
							class="w-full cursor-pointer rounded-lg border-2 border-pink-200
                                   p-3 transition-all duration-300
                                   focus:outline-none focus:ring-2 focus:ring-pink-400"
						>
							<option value="" disabled>選択してください</option>
							<option value="single">シングル</option>
							<option value="in_a_relationship">交際中</option>
							<option value="it's_complicated">複雑な関係</option>
							<option value="searching">恋を探している</option>
						</select>
					</div>
				</div>

				<!-- Submit Button -->
				<div class="pt-6 text-center">
					<button
						type="submit"
						disabled={!isFormValid || isSubmitting}
						class="transform rounded-full bg-gradient-to-r
                               from-pink-500 to-red-500 px-8
                               py-4 font-bold text-white transition-all duration-300
                               hover:scale-105 hover:shadow-lg
                               disabled:cursor-not-allowed disabled:opacity-50
                               {isFormValid ? 'animate-pulse' : ''}"
					>
						{isSubmitting ? '導いています...' : '運命のカードを選ぶ →'}
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<style>
	@keyframes fade-in {
		from {
			opacity: 0;
		}
		to {
			opacity: 1;
		}
	}

	@keyframes slide-up {
		from {
			transform: translateY(20px);
			opacity: 0;
		}
		to {
			transform: translateY(0);
			opacity: 1;
		}
	}

	.animate-fade-in {
		animation: fade-in 1s ease-out;
	}

	.animate-slide-up {
		animation: slide-up 0.8s ease-out;
	}
</style>
