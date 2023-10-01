def trim:
  sub("^\\s+"; "") | sub("\\s+$"; "");

def shout:
  test("[[:upper:]]") and (test("[[:lower:]]") | not);

def question:
    test("\\?$");

def shouted_question:
    shout and question;

def silence: . == "";

.heyBob
| trim
| if shouted_question then
    "Calm down, I know what I'm doing!"
  elif shout then 
    "Whoa, chill out!"
  elif question then
    "Sure."
  elif silence then
    "Fine. Be that way!"    
  else
    "Whatever."
  end
