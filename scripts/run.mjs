#!/usr/bin/env zx
const dirname = 'libsodium-tests'
const runner = argv._[0]
const n_times = $.env.REPEAT || 1

const files = await fs.readdir(dirname)
    .then(files => files.filter(f => f.endsWith(".wasm")))

let results = Object.fromEntries(files
    .map(f => [f, { avg: 0n, var: 0n }]))

for (let i = 0; i < n_times; i++) {
    for (const f of files) {
        let { stdout } = await $`${runner} ${path.join(__dirname, dirname, f)}`
        let value = BigInt(stdout)
        results[f].avg += value
        results[f].var += value * value
    }
}

for (let f of Object.keys(results)) {
    results[f].avg = Number(results[f].avg / BigInt(n_times))
    let var_sqr = ((n_times == 1) ?
        0n :
        (results[f].var / BigInt(n_times - 1))
    )
    results[f].var = Number(var_sqr) ** 0.5
}

console.log(JSON.stringify({
    [dirname]: {
        repeat: n_times,
        result: results,
    }
}))
