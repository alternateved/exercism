(module
  (func (export "squareRoot") (param $radicand i32) (result i32)
    (return (i32.trunc_f32_s (f32.sqrt (f32.convert_i32_s (local.get $radicand)))))
  )
)
