# Session 1: Tables and maps about cancer incidence

“Data” plays a big part in thinking about our future engagement with
cancer – as people, scientists, social leaders. “Data science” is the
study of how scientific discipline, including measurement,
experimentation, and argument, guides us to use data effectively. Data
science is a young and diverse enterprise!

In this vignette, we present a very small-scale dataset to illustrate
some of the larger themes of cancer data science. The road map is

-   A table enumerating contacts in my life who have dealt with cancer
-   A sketch of principles underlying the assembly of data for
    scientific purposes
    -   This leads to a critique of my table, and to statements of
        larger aspirations
-   An overview of topics to be covered in forthcoming sessions

# A personal cancer data project

In 60 years of life I have been cancer free, but many of my relatives
and friends have been impacted directly:

    library(BiocYES)
    library(DT)
    data(vjc_cancer_net)
    datatable(vjc_cancer_net)

How can we interpret this?

At best it is difficult. It is a personalized slice-of-life, it is sad
for some of the contacts, presents triumphs for others.

When assembling or trying to interpret data, we have to keep in mind

-   **The scientific objective of data collection**
-   **The degree of precision needed to achieve our objectives**
-   **The justification of the method by which data are collected and
    interpreted**

Planning is a fundamental component of data science and cancer research
generally.

# A brief introduction to tables and maps for YES

## Some preliminary definitions

-   **incidence** is the number of events recorded in a certain period
    of time, divided by the number of persons “at risk” for the event
    -   informative on new onsets
    -   typically reported per 100000 persons
-   **prevalence** is the number of individuals diagnosed with a disease
    divided by the total population size
    -   informative on overall disease burden, affected by duration of
        disease
-   **mortality** number of deaths in a given interval of time, divided
    by total population size
    -   variations: cause-specific mortality
-   **metropolitan statistical area** a region with an urbanized area of
    size greater than 50000

## Some comments about “computing” with tables and maps

-   We emphasize **interactive** data presentations

-   A table can be “printed” for use to read, or “rendered” in a dynamic
    system, so that we can sort or search for information, taking
    advantage of “skills” that computers have

-   The same concept applies to maps, which we can embellish and
    pan/zoom to find features of interest

## US Cancer statistics by “metropolitan statistical area”

The BiocYES package for R includes woncan a table derived from the [CDC
WONDER data service](https://wonder.cdc.gov/cancer-v2018.HTML). The
table provides summaries of cancer incidence over 1999-2018.

    library(BiocYES)
    library(dplyr)
    library(DT)
    data(woncan)
    datatable(woncan |> filter(MSA != "Other") |> select(-Population))

### Exercises

-   What is the age adjusted rate of pancreatic cancer per 100000
    residents in the Boston metropolitan statistical area (MSA)?

-   What MSA has the lowest recorded rate of female breast cancer
    (1999-2018)? (Search for code 26000-Female.)

## Massachusetts data

A function has been provided to produce tables of breast or prostate
cancer incidence in Massachusetts counties.

    datatable(MA_cancer_rate_table("breast"))

### Exercises

We now have different sets of statistics for a specific form of cancer
(breast) in different time intervals for Massachusetts.

-   Are the reported values for breast cancer incidence 2014-2018 in
    Massachusetts counties compatible with the WONDER 1999-2018 report
    for the Boston MSA?

-   Compare the county-level rates for prostate cancer in MA with the
    WONDER rate reported for the Boston MSA.

## Interactive maps

-   Twenty years ago the most common Geographic Information System was
    the paper map or road atlas
-   Now our cell-phones can ask the internet how to get to where we want
    to go, efficiently
-   Understanding how cancer events unfold in different geographic
    regions is important for public health
    -   Are there important environmental hazards at specific locations?
    -   Are there clues to genetic origins of particular cancers?
    -   Are culturally shared behaviors leading to increased risk?
-   Even though we are comfortable with annotated maps, creating and
    using “cancer maps” to reason about cancer risk requires some
    training
-   In this notebook we will work with some interactive maps on the web,
    and we will produce some maps using R programming

### Exercises

Use the [International Agency for Research on Cancer (IARC) map
tool](https://gco.iarc.fr/today/online-analysis-map?v=2020&mode=population&mode_population=continents&population=900&populations=900&key=asr&sex=0&cancer=39&type=0&statistic=5&prevalence=0&population_group=0&ages_group%5B%5D=0&ages_group%5B%5D=17&nb_items=10&group_cancer=1&include_nmsc=0&include_nmsc_other=0&projection=natural-earth&color_palette=default&map_scale=quantile&map_nb_colors=5&continent=0&show_ranking=0&rotate=%255B10%252C0%255D)
to survey mortality from cancer in 2020 for individuals aged 10-24. You
should see something like the display below.

![IARC map](IARCoverall.jpg)

-   True or False: Age standardized mortality from cancer in 2020 for
    persons aged 10-24 is greater in Vietnam than in neighboring
    countries.

Use the IARC map tool to produce a worldwide map of breast cancer
incidence for women aged 60-79.

-   What is the Scandinavian country with largest estimate of
    age-standardized breast cancer incidence for women aged 60-79?

## Creating a map

We’ve provided some software that helps you make interactive maps in
Jupyter.

    mass_map()

The map starts out with a focus on the Boston area. You can point and
click to move the focus of the map, or use the +/- control at the top to
zoom in or out.

## Adding cancer statistics to the map

We have a table of age-adjusted rates of breast and prostate cancer

    brtab = MA_cancer_rate_table(site="breast")
    head(brtab, 2)

Here is code that produces a table that combines county latitude and
longitude measures with the age-adjusted breast cancer rates.

    data(us_county_geo)
    lj = left_join(mutate(brtab, county=County),   # mutate: obtain new variable name
                   filter(us_county_geo, state=="MA"), by="county") # merge rates and geography
    lj$lng = sapply(lj$geometry, "[", 1) # "geometry" is a special structure
    lj$lat = sapply(lj$geometry, "[", 2) # need to peel apart latitude and longitude
    lj$aarat = lj$Age.Adjusted.Rate   # shorter name
    head(lj,2)

Now we use the leaflet function `addAwesomeMarkers` with our latitude
and longitude to enhance the map.

    mass_map() |>                     # need some HTML to format popup
        leaflet::addAwesomeMarkers(lat=lj$lat, lng=lj$lng, 
                                   popup=paste(lj$Cancer.Type[1], "<br>", lj$county, "<br>", lj$aarat, sep=""))

### Exercise

Our presentation of the table `lj` above is not interactive. How can you
make it interactive?

How does the map help you to think about patterns of breast cancer
incidence in the counties of Massachusetts?

Obtain the table for age-adjusted rates for prostate cancer in MA in
2014-2018, and modify the map to present those statistics. Do you have
any comments about patterns of prostate cancer incidence in
Massachusetts counties?

## The US as a whole: Some basic statistics by “metropolitan statistical area (MSA)”

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

As an example, `cancer_map_usa` produces:

    cancer_map_usa()

The code is:

    cancer_map_usa

Create a new notebook cell with the call to `cancer_map_usa` to produce
prostate cancer statistics.

Finally, to get a different view of variation in cancer rates across the
United States, run the following cell. Geographic location is lost, but
the range of variation, and details of variation can be seen very
clearly in these displays.

    browseURL("https://vjcitn.shinyapps.io/ratevariation")

Change the body site to “Prostate” (remove “Brain”) and find, using the
histogram tab, the areas with highest and lowest age-adjusted rates of
prostate cancer.
