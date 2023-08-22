(module
  (memory 1 1)
  (func $main (export "_start")
    (i32.store (i32.const 65533) (i32.const 0))
  )
)
