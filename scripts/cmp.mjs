#!/usr/bin/env zx
const [ file1, file2 ] = argv._
const left = await fs.readFile(file1).then(t => JSON.parse(t))
const right = await fs.readFile(file2).then(t => JSON.parse(t))

const results = {}

for (let test of Object.keys(right)) {
    if (!Object.hasOwn(left, test)) {
        results[test] = []
        continue
    }
    let [ls, rs] = [left[test].result, right[test].result]
    results[test] = Object.keys(rs).map(f => {
        if (!Object.hasOwn(ls, f)) {
            return { name: f }
        }
        let [l, r] = [ls[f], rs[f]]
        return {
            name: f,
            diff: (r.avg - l.avg) / l.avg, // positive means slower
            diffOverVar: (r.avg > l.avg + l.var) || (r.avg < l.avg - l.var)
        }
    }).sort((x, y) => Math.abs(y.diff) - Math.abs(x.diff))
    // TODO: handle !Object.hasOwn(x, 'diff') or !Object.hasOwn(y, 'diff')
}

console.log(JSON.stringify(results))
