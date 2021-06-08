# Registry Database Setup in OMOPv6.0
Registry database uses OMOP CDM as its base database schema. The database can be installed with the following steps.
Downloading vocabularies: OMOP CDM needs vocabularies. They can be downloaded from athena.ohdsi.org. Do the following steps. You need to have a UML user account for CPT codes. 
## Prepare vocabulary data
1. Goto athena.ohdsi.org to download Vocabularies.
2. Read instruction on how to download and add CPT4 codes.
## Installation of PostgreSQL instance with OMOP CDM.
1. Get DDLs from https://github.com/OHDSI/CommonDataModel. Use DDL for PostgreSQL.
2. Get docker image of PostgreSQL. At the terminal, do the follows
```
> docker pull postgres
> docker run --name <name_of_container> -p 5432:5432 -e POSTGRES_PASSWORD=<password> -d postgres 
```
3. Create database and schema in the PostgreSQL container.
```
                 > docker exec -it <container_id> /bin/bash
inside-container > pgsql -U postgres
inside-pqsql     > create database <name_of_database> with owner postgres;
```
***You need 'psql'. If you don't have it, please install postgreSQL client tools.***

4. Run DDL from ODHSI
```
> psql -h localhost -p <port> -U postgres -W -d <name_of_database> -f <ddl_name>
```
5. Run DDLs for f_person, f_observation_view, and f_immunization_view
```
> psql -h localhost -p <port> -U postgres -W -d <name_of_database> -f omoponfhir_f_person_ddl.txt
> psql -h localhost -p <port> -U postgres -W -d <name_of_database> -f omoponfhir_v6.0_f_observation_view_ddl.txt
> psql -h localhost -p <port> -U postgres -W -d <name_of_database> -f omoponfhir_v6.0_f_immunization_view_ddl.txt
```
6. Run DDL (update path to the vocabulary files) that uploads vocabularies to the database created in step 3. Vocabulary files should be available from step 1 and 2. And, DDL for importing vocabulary should be available in https://github.com/OHDSI/CommonDataModel/tree/master/PostgreSQL/VocabImport
```
> psql -h localhost -p <port> -U postgres -W -d <name_of_database> -f OMOP\ CDM\ vocabulary\ load\ -\ PostgreSQL.sql
```
7. Run syphilis_registry_vocabulary.sql
```
> psql -h localhost -p <port> -U postgres -W -d <name_of_database> -f syphilis_registry_vocabulary.sql
```
 
