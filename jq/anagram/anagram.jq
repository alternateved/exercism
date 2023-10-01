def prepare_word:
  ascii_downcase | split("") | sort;

(.subject | ascii_downcase) as $s
| (.subject | prepare_word) as $ps
| .candidates
| map(select(prepare_word == $ps and ascii_downcase != $s))
