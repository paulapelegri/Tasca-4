use MER4;
SELECT CLIENT.nom, CLIENT.cognoms, POLISSA.num_polissa as "Número de la Polissa" 
FROM CLIENT, POLISSA 
WHERE CLIENT.DNI=POLISSA.CLIENT_DNI and CLIENT.nom='Nerea';