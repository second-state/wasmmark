(module
  (func $grow (param $p i32) (result i32)
    (memory.grow (local.get $p))
  )
  (memory 0)
  (func $main (export "_start") (result i32)
    (call $grow (i32.const 65536))
  )
)
