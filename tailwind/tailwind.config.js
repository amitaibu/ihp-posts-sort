module.exports = {
    mode: 'jit',
    purge: [
        "./Web/View/**/*.hs",
        "./Web/View/*.hs",
        "./assets/**/*.css"
    ],
    theme: {
        extend: {},
    },
    variants: {
        extend: {},
    },
    plugins: [
        require('@tailwindcss/forms'),
    ],
};