#!/usr/bin/env zx
const dirname = 'libsodium-tests'
const runner = argv._[0]

const files = await fs.readdir(dirname)
echo`benchmark,time`
for (const f of files.filter(f => f.endsWith(".wasm"))) {
    let { stdout, stderr } = await $`${runner} ${path.join(dirname, f)}`
    echo`"${f}",${BigInt(stdout).toString()}`
}
