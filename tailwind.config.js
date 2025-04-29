// tailwind.config.js

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.html.haml',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/javascript/**/*.ts',
    './app/assets/stylesheets/**/*.css',
    './app/assets/tailwind/**/*.{css,scss}',
    './app/components/**/*.{rb,html,erb,js,ts}'
  ],
  safelist: [
    // any @apply’d classes you use in your CSS
    'px-6',
    'py-4',
    // …etc
    // or use a pattern:
    // { pattern: /^px-/ },
  ],
  theme: {
    extend: {
      // your custom theming...
    }
  },
  plugins: [
    // …
  ]
}
