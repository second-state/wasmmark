#!/usr/bin/env zx
$.verbose = false
await $`wasmedgec ${argv._} ${argv._}.so`
let { stdout } = await $`wasmedge ${argv._}.so`
echo(stdout.trim())
