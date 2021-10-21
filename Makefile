ifneq ($(wildcard IHP/.*),)
IHP = IHP/lib/IHP
else
IHP = $(shell dirname $$(which RunDevServer))/../lib/IHP
endif

include ${IHP}/Makefile.dist

# CSS_FILES += ${IHP}/static/vendor/bootstrap.min.css
CSS_FILES += ${IHP}/static/vendor/flatpickr.min.css

JS_FILES += ${IHP}/static/vendor/jquery-3.6.0.slim.min.js
JS_FILES += ${IHP}/static/vendor/timeago.js
# JS_FILES += ${IHP}/static/vendor/popper.min.js
# JS_FILES += ${IHP}/static/vendor/bootstrap.min.js
JS_FILES += ${IHP}/static/vendor/flatpickr.js
JS_FILES += ${IHP}/static/helpers.js
JS_FILES += ${IHP}/static/vendor/morphdom-umd.min.js
JS_FILES += ${IHP}/static/vendor/turbolinks.js
JS_FILES += ${IHP}/static/vendor/turbolinksInstantClick.js
JS_FILES += ${IHP}/static/vendor/turbolinksMorphdom.js

tailwind-dev:
	npx tailwindcss build -i tailwind/app.css -o static/app.css -c tailwind/tailwind.config.js --watch

static/app.css:
	NODE_ENV=production npm ci
	NODE_ENV=production npx tailwindcss build -i tailwind/app.css -o static/app.css -c tailwind/tailwind.config.js --minify