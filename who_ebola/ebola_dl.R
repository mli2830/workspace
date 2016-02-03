library(stringr)

dd <- function(date){
  c(substring(date,1,4),substring(date,5,6),substring(date,7,8))
}


get_dat <- function(yy){
  aa <- dd(yy)
  url <- paste("apps.who.int/gho/athena/xmart/xmart.csv?target=EBOLA_MEASURE/CASES,DEATHS&profile=crosstable&filter=COUNTRY:GIN;COUNTRY:UNSPECIFIED;COUNTRY:LBR;COUNTRY:UNSPECIFIED;COUNTRY:SLE;COUNTRY:UNSPECIFIED;LOCATION:-;DATAPACKAGEID:"
               ,aa[1]
               ,"-"
               ,aa[2]
               ,"-"
               ,aa[3]
               ,";INDICATOR_TYPE:SITREP_CUMULATIVE;INDICATOR_TYPE:SITREP_CUMULATIVE_21_DAYS;SEX:-&x-sideaxis=COUNTRY;EPI_DATE;CASE_DEFINITION&x-topaxis=EBOLA_MEASURE;INDICATOR_TYPE",sep = '')
  download.file(url, destfile = paste("ebola",yy,"csv",sep="."), method="curl")
}


sources <- readLines("temp.txt")
chuck <- sources[148:430]
urllist <- str_extract(chuck,"201[0-9]{5}")


for(i in urllist){get_dat(i)}
