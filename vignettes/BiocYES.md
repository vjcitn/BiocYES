# Overview

The BiocYES package collects software and documentation for an
introduction to data science in the domain of cancer biology,
epidemiology, and treatment. In 2022 there are five main modules
covered:

-   Cancer maps
-   Cancer anatomy
-   Cancer clinical trials
-   Molecular biology of cancer: data science considerations
-   Patient-initiated research

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
    data(us_county_geo)
    us_county_geo[1,] |> select(state, county, geometry)

### Exercise

Join the location data to the `woncan` statistics. Plot the rates for
prostate cancer at the geographic locations where they were recorded.

As an example, look at the code for `cancer_map_usa`, which produces:

    cancer_map_usa()

# Cancer anatomy

## TCGA sites

The Cancer Genome Atlas (TCGA) collects data on a number of cancers
defined by anatomic site. The 37 sites available are:

    library(TCGAutils)
    data(diseaseCodes)
    datatable(diseaseCodes, options=list(lengthMenu=c(5,10,15,20)))

## Oncotree hierarchy

The Memorial Sloan-Kettering Cancer Center manages an interactive
tumor-type navigation system called oncotree.

A snapshot is:

<img src="oncotreeDemo.png"/>

Exercise: Use the oncotree API and operations on the JSON returned from
`http://oncotree.mskcc.org/api/tumorTypes/tree` to produce a searchable
table with columns indicating tissue, parent, UMLS tag, and NCI code for
all tumor types.

## Tumor anatomy: imaging of glioblastoma

# Cancer clinical trials

## Concepts of equipoise, randomization, and simulation

For an overview of very basic considerations of probability and bias in
the context of shuffling cards, see `vignette("play4YES")`.

## Finding clinical trials: clinicaltrials.gov

Here is a snapshot from a page at the NIH reference for clinical trials
(worldwide):

<img src="ct_gov_disclaim.jpg"/>

It is necessary to know what “CTCs” means (circulating tumor cells) to
make sense of this.

## Survival curves for the comparison of treatments

## Quality-adjusted survival time concepts

# Molecular biology of cancer: data science perspectives

# Patient-initiated research