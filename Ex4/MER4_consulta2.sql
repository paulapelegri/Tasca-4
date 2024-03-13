use MER4;
SELECT POLISSA.num_polissa as "Número de la pòlissa", TIPUS_POLISSA.nom as "Nom pòlissa",
 CLIENT.DNI, CLIENT.nom as "Nom client", CLIENT.cognoms as "cognoms del client" 
FROM CLIENT, POLISSA, TIPUS_POLISSA
WHERE CLIENT.DNI = POLISSA.CLIENT_DNI and TIPUS_POLISSA_ID = POLISSA.TIPUS_POLISSA_ID and TIPUS_POLISSA.nom='viatge';