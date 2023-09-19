def calculate:
  if test("[AEIOULNRST]";"i") then 1
  elif test("[DG]";"i") then 2
  elif test("[BCMP]";"i") then 3
  elif test("[FHVWY]";"i") then 4
  elif test("[K]";"i") then 5
  elif test("[JX]";"i") then 8
  elif test("[QZ]";"i") then 10
  else 0
  end;

.word | ascii_upcase | split("") | map(calculate) | add // 0
