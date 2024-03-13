use MER6;
select PASSATGER.DNI, PASSATGER.nom, PASSATGER.cognom, VOL.desti, VOL.hora_arribada
from PASSATGER, VOL;