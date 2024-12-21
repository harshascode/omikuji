<script lang="ts">
    import { fade, scale, fly } from 'svelte/transition';
    import { backOut } from 'svelte/easing';
    import { onMount } from 'svelte';

    let selectedCard: number | null = null;
    let isRevealing = false;
    let isShuffling = false;

    // Memoized fortune list with Object.freeze to prevent unnecessary mutations
    const fortunes = Object.freeze([
        {
            number: 1,
            name: '大大吉',
            description: 'Supreme Fortune',
            color: 'from-purple-400 to-pink-500'
        },
        { 
            number: 2, 
            name: '大吉', 
            description: 'Greatest Fortune', 
            color: 'from-red-400 to-pink-500' 
        },
        { 
            number: 3, 
            name: '中吉', 
            description: 'Good Fortune', 
            color: 'from-orange-400 to-red-500' 
        },
        {
            number: 4,
            name: '小吉',
            description: 'Moderate Fortune',
            color: 'from-yellow-400 to-orange-500'
        },
        { 
            number: 5, 
            name: '末吉', 
            description: 'Future Fortune', 
            color: 'from-green-400 to-teal-500' 
        },
        { 
            number: 6, 
            name: '吉', 
            description: 'Blessing', 
            color: 'from-blue-400 to-indigo-500' 
        },
        { 
            number: 7, 
            name: '凶', 
            description: 'Unlucky', 
            color: 'from-gray-400 to-gray-600' 
        },
        { 
            number: 8, 
            name: '大凶', 
            description: 'Very Unlucky', 
            color: 'from-slate-600 to-slate-800' 
        },
        {
            number: 9,
            name: '恋愛成就',
            description: 'Love Fulfillment',
            color: 'from-pink-400 to-purple-500'
        },
        { 
            number: 10, 
            name: '幸福', 
            description: 'Happiness', 
            color: 'from-yellow-500 to-pink-500' 
        },
        { 
            number: 11, 
            name: '運命', 
            description: 'Destiny', 
            color: 'from-teal-400 to-green-500' 
        },
        { 
            number: 12, 
            name: '安心', 
            description: 'Reassurance', 
            color: 'from-blue-300 to-blue-500' 
        },
        { 
            number: 13, 
            name: '冒険', 
            description: 'Adventure', 
            color: 'from-red-500 to-orange-600' 
        },
        { 
            number: 14, 
            name: '友情', 
            description: 'Friendship', 
            color: 'from-purple-300 to-teal-400' 
        },
        { 
            number: 15, 
            name: '再会', 
            description: 'Reunion', 
            color: 'from-gray-500 to-pink-400' 
        },
        { 
            number: 16, 
            name: '夢', 
            description: 'Dream', 
            color: 'from-indigo-500 to-purple-600' 
        }
    ]);

    let shuffledFortunes = [...fortunes];

    // Optimized shuffle function using Fisher-Yates algorithm
    function shuffleCards() {
        if (isShuffling) return;
        isShuffling = true;
        
        // Create a new array for better performance
        const newShuffled = [...shuffledFortunes];
        for (let i = newShuffled.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [newShuffled[i], newShuffled[j]] = [newShuffled[j], newShuffled[i]];
        }
        
        shuffledFortunes = newShuffled;
        
        // Use requestAnimationFrame instead of setTimeout
        requestAnimationFrame(() => {
            isShuffling = false;
        });
    }

    // Optimized navigation function
    function goToResult(fortune: number) {
        if (isRevealing) return;
        selectedCard = fortune;
        isRevealing = true;
        
        // Use requestAnimationFrame for smoother transition
        requestAnimationFrame(() => {
            window.location.href = `/result/${fortune}`;
        });
    }

    // Initialize on mount
    onMount(() => {
        shuffleCards();
    });
</script>

<div
    class="flex min-h-screen flex-col items-center justify-center bg-gradient-to-b from-red-50 to-pink-50 px-4 py-12"
    in:fade|local={{ duration: 300 }}
>
    <div
        class="w-full max-w-5xl rounded-2xl bg-white/90 p-8 shadow-xl backdrop-blur-sm"
        in:scale|local={{ duration: 400, delay: 200, easing: backOut }}
    >
        <!-- Header Section -->
        <div class="mb-12 text-center" in:fly|local={{ y: -20, duration: 600, delay: 400 }}>
            <h1
                class="mb-4 bg-gradient-to-r from-red-600 to-pink-600 bg-clip-text text-5xl font-bold text-transparent"
            >
                恋みくじを引く
            </h1>
            <p class="text-lg text-gray-600">心を穏やかにし、恋みくじをタップしてください。</p>
            <button
                class="mt-4 rounded-full bg-gradient-to-r from-red-500 to-pink-500 px-6 py-2 text-white shadow-lg transition-all hover:scale-105 hover:shadow-xl disabled:opacity-50"
                on:click={shuffleCards}
                disabled={isRevealing || isShuffling}
            >
                カードをシャッフル
            </button>
        </div>

        <!-- Fortune Cards Grid -->
        <div
            class="mb-8 grid grid-cols-2 gap-6 sm:grid-cols-3 lg:grid-cols-4"
            class:pointer-events-none={isShuffling}
            style="content-visibility: auto"
        >
            {#each shuffledFortunes as fortune, i (fortune.number)}
                <div
                    class="transform transition-all duration-300 delay-{i % 4}"
                    class:animate-shake={isShuffling}
                >
                    <button
                        type="button"
                        class="group relative h-48 w-full transform cursor-pointer transition-all duration-300 hover:scale-105"
                        class:opacity-50={isRevealing && selectedCard !== fortune.number}
                        on:click={() => goToResult(fortune.number)}
                        disabled={isRevealing || isShuffling}
                    >
                        <div
                            class="absolute inset-0 rounded-xl bg-gradient-to-br {fortune.color} opacity-75 transition-opacity group-hover:opacity-100"
                        ></div>
                        <div
                            class="relative h-full rounded-xl border border-white/20 bg-white/10 p-6 backdrop-blur-sm"
                        >
                            <div
                                class="writing-vertical flex h-full items-center justify-center space-y-2 text-2xl font-medium text-white"
                            >
                                <div class="font-bold text-yellow-300">{fortune.name}</div>
                                <div class="text-base opacity-90">{fortune.description}</div>
                            </div>
                        </div>
                    </button>
                </div>
            {/each}
        </div>

        <!-- Action Button -->
        <div class="mt-8 text-center" class:hidden={isRevealing}>
            <p class="mb-4 text-sm text-gray-500">タップして運命を探る</p>
            <div class="mx-auto h-16 w-16 animate-bounce">
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    class="text-red-400"
                >
                    <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M19 14l-7 7m0 0l-7-7m7 7V3"
                    />
                </svg>
            </div>
        </div>
    </div>
</div>

<style>
    /* Vertical writing mode for Japanese text */
    .writing-vertical {
        writing-mode: vertical-rl;
        text-orientation: upright;
        will-change: transform;
    }

    /* Predefined transition delays for better performance */
    .delay-0 { transition-delay: 0s; }
    .delay-1 { transition-delay: 0.05s; }
    .delay-2 { transition-delay: 0.1s; }
    .delay-3 { transition-delay: 0.15s; }

    /* Optimized shake animation */
    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        25% { transform: translateX(-5px) rotate(-1deg); }
        75% { transform: translateX(5px) rotate(1deg); }
    }

    .animate-shake {
        animation: shake 0.5s ease-in-out;
        will-change: transform;
    }

    /* Performance optimization for transforms */
    .transform {
        will-change: transform;
    }

    /* Optimize animations */
    @media (prefers-reduced-motion: reduce) {
        .animate-shake {
            animation: none;
        }
        .animate-bounce {
            animation: none;
        }
    }
</style>