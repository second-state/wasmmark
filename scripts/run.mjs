#!/usr/bin/env zx
const dirname = 'libsodium-tests'
const runner = argv._[0]
const n_times = $.env.REPEAT || 1

const files = await fs.readdir(dirname)
let result = {};
for (const f of files.filter(f => f.endsWith(".wasm"))) {
    let sum = 0n;
    for (let i = 0; i < n_times; i++) {
        let { stdout } = await $`${runner} ${path.join(__dirname, dirname, f)}`
        sum += BigInt(stdout)
    }
    result[f] = (sum / BigInt(n_times)).toString()
}
console.log(JSON.stringify({ [dirname]: result }))
