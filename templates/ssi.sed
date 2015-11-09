#n
# filename: incl.sed
# Comments supported by GNU sed or ssed. Leading '#n' should
# be on line 1, columns 1-2 of the line.
/<!--#include file="/ {  # For each "include file" command,
  =;                     #   print the line number
  s/^[^"]*"/{r /;        #   change pattern to 'r{ '
  s/".*//p;              #   delete rest to EOL, print
                         #   and a(ppend) a delete command
  a\
  d;}
}
#---end of sed script---
