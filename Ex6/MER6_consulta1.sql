use MER6;
SELECT PASSATGER.DNI, PASSATGER.nom, PASSATGER.cognom, VOL.num_vol, VOL.desti, RESERVA.import_total
FROM PASSATGER, VOL, RESERVA
WHERE PASSATGER.ID=RESERVA.PASSATGER_ID AND
	VOL.ID=RESERVA.VOL_ID;