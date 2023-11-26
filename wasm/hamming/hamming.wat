(module
  (memory (export "mem") 1)

  (func (export "compute") 
    (param $firstOffset i32) (param $firstLength i32) (param $secondOffset i32) (param $secondLength i32) (result i32)

    (local $distance i32)
    (local $i i32)
    
    (if (i32.ne (local.get $firstLength) (local.get $secondLength))
      (then
        (return (i32.const -1))))

    (loop $loop
      (local.set $distance
        (i32.add
          (local.get $distance)
          (i32.ne
            (i32.load8_u (i32.add (local.get $firstOffset) (local.get $i)))
            (i32.load8_u (i32.add (local.get $secondOffset) (local.get $i))))))

      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      
      (br_if $loop
        (i32.lt_s
          (local.get $i)
          (local.get $firstLength))))
    
    (return (local.get $distance))
  )
)
