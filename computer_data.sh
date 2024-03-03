#!/bin/bash
panaudota_vieta_baitais=$(du -sb | cut -f1)
testavimas_panaudota_vieta=$(du -sb | cut -f1)
turima_vieta_baitais=$((1024*1024*1024))
if (((turima_vieta_baitais-panaudota_vieta_baitais) < 0)); then
	laisva_vieta_baitais=$(((turima_vieta_baitais-panaudota_vieta_baitais)*(-1)))
else
	laisva_vieta_baitais=$((turima_vieta_baitais-panaudota_vieta_baitais))
fi
vietos_procentais=$(((panaudota_vieta_baitais/laisva_vieta_baitais)*100))
vieta_gigabaitais=$((turima_vieta_baitais/laisva_vieta_baitais))
panaudota_vieta_megabaitais=$((panaudota_vieta_baitais/(1024*1024)))
reikia_atlaisvinti=$(((panaudota_vieta_baitais-turima_vieta_baitais)/(1024*1024)))
if ((panaudota_vieta_baitais>turima_vieta_baitais)); then
   echo "Laisvos vietos limitas viršytas! Reikia atlaisvinti tiek vietos: "$reikia_atlaisvinti"MB"
else
   echo "Liko laisvos vietos: "$vieta_gigabaitais"GB"
fi

echo "Panaudota vietos: "$panaudota_vieta_megabaitais"MB"
echo "Panaudota vietos (procentais): "$vietos_procentais
echo "Daugiausiai vietos uzimantys failai ir katalogai: "
du -h | sort -n -r | head -n 100
