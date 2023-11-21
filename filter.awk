awk '{if ($8 ~ /Arabis|Aubrieta|Draba|Boechera|Brassica|Raphanus|Arabidopsis|Camelina|Capsella|Chorispora|Noccaea|Isatis|Pachycladon|Thlaspi/) id[$1]+
+} END {for (i in id) print i " " id[i] > "da.ids"}' <blast_results>
