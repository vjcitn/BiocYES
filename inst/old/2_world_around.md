# Some illustrative maps of cancer incidence

# Cancer map concepts

## Drawing maps with R

    library(BiocYES)
    mass_map()

Exercise: Look at the code for `mass_map` and change it to produce a map
of Rhode Island.

## Tabulating cancer statistics with geographic metadata

### Some basic statistics by “metropolitan statistical area (MSA)”

    library(tibble)
    library(dplyr)
    data(woncan_meta)
    cat(woncan_meta, sep="\n")
    data(woncan)
    littab = woncan |> select(MSA, `Cancer Sites`, Age.Adjusted.Rate) |> as.data.frame()
    datatable(littab, options=list(lengthMenu=c(5,10,15,20)))

Exercise: Use the search input widget to limit focus to prostate cancer.
How many MSAs do not report the age adjusted rate for this cancer? Sort
the rates in decreasing order. What is the MSA with second-highest rate
of prostate cancer? What is the rate there?

### Representing locations

    library(sf)
    library(dplyr)
    data(us_county_geo)
    us_county_geo[1,] |> select(state, county, geometry)

### Exercise

Join the location data to the `woncan` statistics. Plot the rates for
prostate cancer at the geographic locations where they were recorded.

As an example, look at the code for `cancer_map_usa`, which produces:

    cancer_map_usa()
