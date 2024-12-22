<script lang="ts">
	import { goto } from '$app/navigation';

	let isSubmitting = $state(false);
	let formData = $state({
		nickname: '',
		gender: '',
		loveStatus: ''
	});

	// Simple client-side form handling
	function handleSubmit(event: SubmitEvent) {
		event.preventDefault();

		if (!formData.nickname || !formData.gender || !formData.loveStatus) {
			return;
		}

		isSubmitting = true;

		// Store in sessionStorage
		sessionStorage.setItem(
			'fortuneUserData',
			JSON.stringify({
				...formData,
				timestamp: new Date().toISOString()
			})
		);

		// Navigate to result page
		goto('/result');
	}
</script>

<div class="min-h-screen bg-gradient-to-br from-purple-50 via-pink-50 to-red-50 p-4">
	<div class="mx-auto max-w-2xl">
		<!-- Header Section -->
		<header class="p-8 text-center">
			<h1 class="mb-4 text-4xl font-bold text-red-500">✨ 運命の占い ✨</h1>
			<p class="text-lg text-gray-700">あなたの未来をカードが導きます</p>
			<div class="mt-4 rounded-lg bg-white/60 p-4 backdrop-blur-sm">
				<p class="text-gray-600">
					あなたの情報を入力して、神秘的なカードの世界への扉を開きましょう。
				</p>
			</div>
		</header>

		<!-- Form Section -->
		<section class="space-y-6 rounded-xl bg-white/80 p-6 shadow-lg backdrop-blur-md">
			<form onsubmit={handleSubmit} class="space-y-8">
				<!-- Nickname Input -->
				<div
					class="group rounded-lg border-2 border-pink-100 bg-white p-6 transition-transform duration-300 hover:scale-[1.02]"
				>
					<label for="nickname" class="mb-4 block text-xl font-bold text-gray-800">
						🎭 ニックネーム
					</label>
					<input
						type="text"
						id="nickname"
						bind:value={formData.nickname}
						required
						minlength="1"
						maxlength="10"
						class="w-full rounded-lg border-2 border-pink-200 p-3 transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-pink-400"
						placeholder="運命の名前を入力 (最大10文字)"
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

				<!-- Gender Selection -->
				<fieldset
					class="group rounded-lg border-2 border-pink-100 bg-white p-6 transition-transform duration-300 hover:scale-[1.02]"
				>
					<legend class="mb-4 text-xl font-bold text-gray-800">👤 性別</legend>
					<div class="grid grid-cols-3 gap-4">
						{#each [['female', '女性'], ['male', '男性'], ['other', 'その他']] as [value, label]}
							<label class="relative block">
								<input
									type="radio"
									name="gender"
									{value}
									required
									bind:group={formData.gender}
									class="peer absolute opacity-0"
								/>
								<div
									class="cursor-pointer rounded-lg border-2 border-pink-200 p-3 text-center transition-all duration-300
                                            hover:border-pink-400 peer-checked:bg-pink-500
                                            peer-checked:text-white"
								>
									{label}
								</div>
							</label>
						{/each}
					</div>
				</fieldset>

				<!-- Love Status -->
				<div
					class="group rounded-lg border-2 border-pink-100 bg-white p-6 transition-transform duration-300 hover:scale-[1.02]"
				>
					<label for="loveStatus" class="mb-4 block text-xl font-bold text-gray-800">
						💖 恋愛状況
					</label>
					<select
						id="loveStatus"
						bind:value={formData.loveStatus}
						required
						class="w-full cursor-pointer rounded-lg border-2 border-pink-200 p-3
                               transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-pink-400"
					>
						<option value="" disabled selected>選択してください</option>
						<option value="single">シングル</option>
						<option value="in_a_relationship">交際中</option>
						<option value="it's_complicated">複雑な関係</option>
						<option value="searching">恋を探している</option>
					</select>
				</div>

				<!-- Submit Button -->
				<div class="pt-6 text-center">
					<button
						type="submit"
						disabled={isSubmitting}
						class="group transform rounded-full bg-gradient-to-r from-pink-500 to-red-500
                               px-8 py-4 font-bold text-white transition-all duration-300
                               hover:scale-105 hover:shadow-lg disabled:cursor-not-allowed
                               disabled:opacity-50"
					>
						<span class="group-hover:animate-pulse">
							{isSubmitting ? '導いています...' : '運命のカードを選ぶ →'}
						</span>
					</button>
				</div>
			</form>
		</section>
	</div>
</div>

<style>
	/* Base animations */
	header {
		animation: fade-in 1s ease-out;
	}

	section {
		animation: slide-up 0.8s ease-out;
	}

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
</style>
