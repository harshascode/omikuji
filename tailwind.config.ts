import typography from '@tailwindcss/typography';
import type { Config } from 'tailwindcss';

export default {
	content: ['./src/**/*.{html,js,svelte,ts}'],

	theme: {
		extend: {
			animation: {
				'pulse': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
			}
		}
	},

	plugins: [typography]
} satisfies Config;
