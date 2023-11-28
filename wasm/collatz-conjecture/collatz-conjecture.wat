(module
  (func $steps (export "steps") (param $number i32) (result i32)

    (if (i32.lt_s (local.get $number) (i32.const 1))
      (then (return (i32.const -1))))

    (if (i32.eq (local.get $number) (i32.const 1))
      (then (return (i32.const 0))))

    (return
      (i32.add
        (i32.const 1)
        (call $steps (select
          (i32.add (i32.const 1) (i32.mul (local.get $number) (i32.const 3)))
          (i32.div_s (local.get $number) (i32.const 2))
          (i32.rem_s (local.get $number) (i32.const 2))))))

  )
)
