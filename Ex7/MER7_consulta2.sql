use MER7;
select TICKET.num_factura, TICKET.data_ticket, EMPLEAT.nom, EMPLEAT.cognom
from TICKET, EMPLEAT, PRODUCTE, LINIA_TICKET
where PRODUCTE.ID=LINIA_TICKET.PRODUCTE_ID AND TICKET.num=LINIA_TICKET.TICKET_num AND EMPLEAT.ID=TICKET.EMPLEAT_ID AND PRODUCTE.nom="pelotazos";