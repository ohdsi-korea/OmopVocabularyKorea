mapped_path <- "@path"
mapped_file <- "@mapped file name"
export_file <- "source_to_concept_map.csv"
mapped <- file.path(mapped_path, mapped_file)

df <- data.table::fread(mapped, fill=TRUE, header=TRUE)
source_to_concept_map <- data.frame(source_code = df$concept_code,
                 source_concept_id = 0,
                 source_vocabulary_id = "Korean EDI",
                 source_code_description = paste0(df$concept_name,"; " ,df$concept_synonym),
                 target_concept_id = df$targetConceptId_fixed,
                 target_vocabulary_id = df$targetVocabularyId_fixed,
                 valid_start_date = as.Date(as.character(df$targetValidStartDate_fixed), format = "%Y%m%d"),
                 valid_end_date = as.Date(as.character(df$targetValidEndDate_fixed), format = "%Y%m%d"),
                 invalid_reason = NA,
                 stringsAsFactors=FALSE)

write.csv(source_to_concept_map, file.path(mapped_path, export_file), row.names = FALSE, sep="\t")