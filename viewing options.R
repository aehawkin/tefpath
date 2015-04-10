##################################################################################
##viewing options
names(raw2015)

"plot"     "uniqueid" "tag"      "sp"       "stat"     "dc"       "sv"       "dj"       "dv"      
"dp"       "dm"       "armrz"    "armfn"    "pbr"      "ho"       "other"    "fopi"     "trab"    
"mech"     "phsc"     "ht"       "intact"   "char"     "fscar"    "notes"    "mod"      "notes2"

str(raw2015)

levels(raw2015$stat.note)

tail(sort(raw2015$stat), 100)

summary(raw2015$armrz)
#################################################################################