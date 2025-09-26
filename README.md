# DSAA811 – Spatiotemporal Distribution of Feral Deer in NSW

**Subject**: DSAA811 – Data Analytics and Visualisation (Enhanced)
**Author**: Yeongjin Yu  
**Date**: 26 May 2025  

This project investigates the spatial and temporal distribution of feral deer species (family *Cervidae*) in New South Wales (NSW), using data from the Atlas of Living Australia (ALA). The analysis was performed in R using tidyverse and visualisation tools to identify species frequency, geographic hotspots, and seasonal patterns.

---

## Project Overview

This project investigates the spatial and temporal distribution of feral deer species (*family Cervidae*) in New South Wales (NSW), Australia. Using observational data from the Atlas of Living Australia (ALA), it explores species frequency, geographic hotspots, and seasonal patterns of deer activity.

The goal is to produce actionable ecological insights to support conservation planning, land management, and policy development.

---

## Research Question

- How have the spatial and temporal distributions of feral deer species in NSW changed over time?
- What patterns emerge from different species' observations?
- Which regions and seasons show the highest deer activity?
- Which deer species are most frequently observed?

---

## Data Collection

Data was collected using the `galah` R package, which connects to the ALA API. Filters were applied to retrieve:
- Family: *Cervidae* (deer)
- Region: New South Wales

The resulting dataset includes scientific names, coordinates, and observation dates for each record.

---

## Spatial Distribution

A map of NSW deer sightings shows that observations are concentrated in the **eastern and southeastern regions**, especially around the Great Dividing Range. Sparse observations in the west may reflect lower deer populations or limited sampling effort.

<!-- *(Add your map here if uploaded to GitHub — e.g., `![map](plots/deer_distribution.png)`)* -->
<!-- Or link to your HTML report -->


## Key Findings

- **Spatial**: Sightings are concentrated in the eastern and southeastern regions of NSW, especially along the Great Dividing Range.
- **Temporal**: A harp rise in observations post-2000, peaking around 2011. This likely reflects both population growth and improved reporting systems.
- **Seasonal**: Deer observations vary by month, with higher activity in autumn and spring. Observation counts peak in May, likely due to seasonal deer behaviours or observer patterns such as rutting, feeding, or increased human sightings.


---

## Species Frequency

- Top species: *Dama dama* (fallow deer); some records are identified only at the family level (*Cervidae*).
- Also common: *Cervus* spp.
- Some records list only higher-level taxa (e.g., *CERVIDAE*), indicating uncertain ID.


---

## Files Included

- `final_report.Rmd` – Full R Markdown analysis (source code for the final report)
- `final_report.html` – Knitted HTML output of the final report
- `nsw_deer_data.csv` – Cleaned dataset used for analysis
- `data_dictionary.docx` – Description of dataset variables
- `README.md` – This summary file
- `.gitignore` – Git configuration file (optional)

---

## Methods & Tools

- **Language**: R (v4.3.1 or later)
- **Main Packages**:
  - `tidyverse`
  - `galah`
  - `lubridate`
  - `ozmaps`
  - `ggplot2`
  - `knitr`

- **Approach**:
  - Access deer sightings via the ALA API using `galah`
  - Clean and transform the dataset (filtering invalid coordinates/dates)
  - Generate temporal and spatial visualisations
  - Produce a reproducible `.Rmd` report
 
---

## Data Source

Data retrieved from the [Atlas of Living Australia (ALA)](https://www.ala.org.au/) using the `galah` package (accessed April 2025).  
Filtering criteria: `family == "Cervidae"` and `stateProvince == "New South Wales"`.

---

## References

- NSW Department of Primary Industries (2023). *Feral deer*.  
  🔗 [https://www.dpi.nsw.gov.au/biosecurity/vertebrate-pests/pest-animals-in-nsw/feral-deer](https://www.dpi.nsw.gov.au/biosecurity/vertebrate-pests/pest-animals-in-nsw/feral-deer)

- Atlas of Living Australia (2025). *Occurrence records of Cervidae*.  
  🔗 [https://www.ala.org.au](https://www.ala.org.au)
