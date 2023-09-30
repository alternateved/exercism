.phrase
| gsub("[- ]"; "")
| split("") 
| map(ascii_downcase) 
| length as $phrase_length
| unique 
| length == $phrase_length
