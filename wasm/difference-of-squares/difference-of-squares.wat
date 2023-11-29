(module
  (func $squareOfSum (export "squareOfSum") (param $max i32) (result i32)

    (local $sum i32)
    (local $i i32)

    (loop $loop
      (local.set $sum (i32.add (local.get $sum) (local.get $i)))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $loop (i32.le_s (local.get $i) (local.get $max))))

    (return (i32.mul (local.get $sum) (local.get $sum)))
  )

  (func $sumOfSquares (export "sumOfSquares") (param $max i32) (result i32)

    (local $sum i32)
    (local $i i32)

    (loop $loop
      (local.set $sum (i32.add (local.get $sum) (i32.mul (local.get $i) (local.get $i))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $loop (i32.le_s (local.get $i) (local.get $max))))

    (return (local.get $sum))
  )

  (func (export "difference") (param $max i32) (result i32)
    (i32.sub
      (call $squareOfSum (local.get $max))
      (call $sumOfSquares (local.get $max)))
  )
)
