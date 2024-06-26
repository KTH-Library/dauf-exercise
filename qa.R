library(tidyverse)

# see https://bibliometrics.lib.kth.se/RI_sources_KTH.html

projects <-
  "https://data.bibliometrics.lib.kth.se/kthcorpus/projects_swecris.csv" |>
  read_csv()

people <-
  "https://data.bibliometrics.lib.kth.se/kthcorpus/projects_people_swecris.csv" |>
  read_csv()

# explain what the following "pipeline" / query does
# do you see any anomalies in the result or anything to comment on?
people |>
  left_join(projects) |>
  filter(!is.na(orcId), year(projectStartDate) == 2013) |>
  group_by(orcId) |>
  count() |>
  arrange(desc(n)) |>
  head(10) |>
  left_join(people) |>
  ungroup() |>
  group_by(orcId, personId, fullName) |>
  summarize(nd = n_distinct(projectId), projects = paste0(collapse = ",", unique(sort(projectId)))) |>
  arrange(desc(fullName))

# after seeing the results, you then run this query
# and based on the results you consider to follow up
# ... it may be a data quality issue hiding in there somewhere ...
# what are your thoughts around how to proceed with the follow up?
people |> filter(!is.na(orcId)) |> group_by(fullName) |>
  summarize(ndp = n_distinct(personId), ndo = n_distinct(orcId)) |>
  filter(ndo > 1) |> arrange(desc(ndo)) |>
  ungroup() |>
  left_join(people) |>
  distinct(fullName, personId, orcId) |>
  print(n = 50)

# you run some manual checkups on a few datapoints
checkup <- function(orcId) {
  paste0("https://orcid.org/", orcId) |>
  browseURL()
}


"0000-0003-2195-2978" |> checkup()
"0000-0002-1744-6776" |> checkup()

people |> filter(orcId == "0000-0003-2195-2978")
people |> filter(orcId == "0000-0002-1744-6776")

# you check results using another package
remotes::install_github("KTH-Library/swecris")
library(swecris)

swecris_projects_from_orcid("0000-0003-2195-2978")$peopleList |>
  filter(orcId == "0000-0003-2195-2978")

# you double-check results again at the source using a bash oneliner....
# what are your conclusions and how do you suggest proceeding based on your findings?
paste("curl -s 'https://swecris-api.vr.se/v1/projects/persons/orcId/0000-0003-2195-2978'",
  "-H 'authorization: bearer RWNDZ3FDRVVSMmNUNlZkMkN3' | json_pp | jq '.[70].peopleList'") |>
  system(intern = TRUE) |> jsonlite::fromJSON() |> tibble::as_tibble()

