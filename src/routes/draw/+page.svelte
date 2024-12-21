<div class="p-4">
	<div class="text-center">
		<h1 class="text-3xl font-bold text-red-500">恋みくじを引く</h1>
		<p class="mt-4 text-gray-600">ニックネームと性別と、あなたの今の恋愛状況を入力してください。</p>
	</div>

	<div class="mt-8 rounded-lg bg-gray-100 p-4">
		<h2 class="text-xl font-bold">ニックネーム</h2>
		<input
			type="text"
			class="mt-2 w-full rounded-lg border border-gray-300 p-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
			placeholder="（最大10文字 例: こいこい）"
		/>
		<p class="mt-1 text-sm text-gray-500">※本名は入力しないでください。</p>
		<p class="mt-1 text-sm text-gray-500">※ニックネームは、結果ページにて公開されます。</p>
	</div>

	<div class="mt-4 rounded-lg bg-gray-100 p-4">
		<h2 class="text-xl font-bold">性別</h2>
		<div class="mt-2 flex items-center space-x-4">
			<div class="flex items-center">
				<input
					type="radio"
					id="female"
					name="gender"
					class="h-4 w-4 text-blue-600 focus:ring-blue-500"
					value="female"
				/>
				<label for="female" class="ml-2 text-gray-700">女性</label>
			</div>
			<div class="flex items-center">
				<input
					type="radio"
					id="male"
					name="gender"
					class="h-4 w-4 text-blue-600 focus:ring-blue-500"
					value="male"
				/>
				<label for="male" class="ml-2 text-gray-700">男性</label>
			</div>
			<div class="flex items-center">
				<input
					type="radio"
					id="other"
					name="gender"
					class="h-4 w-4 text-blue-600 focus:ring-blue-500"
					value="other"
				/>
				<label for="other" class="ml-2 text-gray-700">その他</label>
			</div>
		</div>
	</div>

	<div class="mt-4 rounded-lg bg-gray-100 p-4">
		<h2 class="text-xl font-bold">恋愛状況</h2>
		<select
			class="mt-2 w-full rounded-lg border border-gray-300 p-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
		>
			<option value="" disabled selected>選択してください</option>
			<option value="single">シングル</option>
			<option value="in_a_relationship">交際中</option>
			<option value="it's_complicated">複雑な関係</option>
		</select>
	</div>

	<div class="mt-6 text-center">
		<button class="rounded bg-red-500 px-4 py-2 font-bold text-white hover:bg-red-600"
			><a href="/result">恋みくじを引く</a>
		</button>
	</div>
</div>
