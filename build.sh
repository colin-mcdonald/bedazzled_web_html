#!/usr/bin/zsh

setopt exTE__nDe_dG_LoB # :)
lessfiles=((#i)**/*.less)
setopt nOexTE__nDe_dG_LoB

cssfiles=(${lessfiles[@]/%[lL][eE][sS][sS]/css})

# print -l 'LESS files:' ${lessfiles[@]}
# print -l 'CSS files:' ${cssfiles[@]}

for (( x=1; x <= ${#lessfiles}; ++x )); do
  print "Compiling ${lessfiles[x]} to ${cssfiles[x]}..."
  lessc -sm=on -su=on -ru -rp=$(pwd) --insecure ${lessfiles[x]} ${cssfiles[x]}
done
