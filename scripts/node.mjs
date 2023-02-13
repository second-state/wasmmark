#!/usr/bin/env zx
$.verbose = false
let { stdout } = await $`node --experimental-wasi-unstable-preview1 ${__dirname}/wasi.mjs ${argv._}`
echo(stdout.trim())
