# OmopVocabularyKorea
한국 OMOP Vocabulary 페이지입니다.

# Getting Started
```r
install.packages("devtools")
devtools::install_github("ohdsi/DatabaseConnector")
devtools::install_github("ohdsi/SqlRender")

file_path <- "@path"
source_to_concept_map <- file.path(file_path, "source_to_concept_map.csv")

connectionDetails <- createConnectionDetails(dbms = "DBMS",
                                             server = "localhost",
                                             user = "root",
                                             password = "blah",
                                             schema = "schema")
conn <- connect(connectionDetails)

insertTable(connection = conn,
            tableName = "source_to_concept_map3",
            data = source_to_concept_map,
            dropTableIfExists = TRUE,
            createTable = TRUE,
            tempTable = TRUE)
```
