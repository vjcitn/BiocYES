# Goals of Cancer Data Science modules of YES for CURE

-   Explain how data on cancer cases and deaths are collected and
    summarized in the United States
    -   What are the roles of the Centers for Disease Control, National
        Cancer Institute, the states, territories and localities in
        gathering and reporting data?
    -   Where can you go to see information about cancer trends of
        interest to you?
-   Explain how cancer patients can learn about – and tell about –
    treatments and clinical trials relevant to their condition
-   Explain how research data on the biology of cancer can be surveyed
    and explored from a “data science” perspective

“Data” plays a big part in thinking about our future engagement with
cancer – as people, scientists, social leaders. “Data science” is the
study of how scientific discipline, including measurement,
experimentation, and argument, guides us to use data effectively. Data
science is a young and diverse enterprise!

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
-   **The justification of the method by which data were collected and
    interpreted**

Planning is a fundamental component of data science and cancer research
generally.

Here’s the plan of our encounters over the next few weeks.

# Topics to illuminate data science in cancer research

## Cancer in the world around us

-   What are rates of cancer incidence or mortality in nearby
    communities? Around the USA?
-   How do we form maps of cancer incidence or treatment practices? What
    makes maps interesting and useful?
-   How do we appraise trends in cancer incidence?
-   How do regional trends in cancer incidence help us to reason about
    preventive solutions?

## Cancer in the human body

-   What are the body sites most commonly afflicted by cancer?
-   How do we define risks for cancers at specific body sites?
-   Are cancer preventive strategies and treatments inherently
    “site-specific”? Are there any approaches that may work for cancer
    wherever in the body it occurs?

## Finding treatments for cancer

-   What are clinical trials?
-   What are the classes of drugs considered useful for treating cancer,
    and how does data science address the tasks of drug discovery and
    optimization of treatment protocols?

## Illuminating cancer biology

-   What are somatic mutations? How do they occur, and how do they drive
    tumor formation?
-   What is gene expression? How are patterns of expression identified
    as playing roles in cancer progression and treatment?

## When our cancers aren’t well-researched

-   How is data science mobilized by patient groups who find that there
    is very limited research conducted on their particular conditions?
