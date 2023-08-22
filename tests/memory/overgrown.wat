;; https://developer.mozilla.org/en-US/docs/WebAssembly/Reference/Memory/Grow
(module
  (memory 1 2) ;; start with one memory page, and max of 2 pages
  (func $main (export "_start") (result i32)

    ;; grow memory by 2 pages
    ;; returns -1
    (memory.grow (i32.const 2))
  )
)
