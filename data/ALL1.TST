# Acesta este un fisier ce contine descrieri despre generarea unui test

.path mee1
.testname "Toate prob. MEE 1"
.domain "M.E.E." "Masurari electrice si electronice"
.time 60                       # 0=timp nelimitat ????

.random 300
#.problem pb1.pb

# Acesta este un test compus din 20 probleme (.random 20) alese aleator
# plus o problema care va fi in mod sigur pb1.pb  (.problem pb1.pb)
# deci in total 21 probleme.

# Daca apareau si directivele .author sau/si .dificulty atunci se efectua
# o selectie aleatoare a problemelor limitata de aceste directive.

