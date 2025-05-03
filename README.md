# DSAA811 Preliminary Report – Deer Sightings in NSW

**Author:** Yeongjin Yu  
**Date:** 11 April 2025

This project investigates the spatial and temporal distribution of feral deer species (family *Cervidae*) in New South Wales (NSW), using data from the **Atlas of Living Australia (ALA)**. The analysis was performed in R using tidyverse and visualisation tools to identify species frequency, geographic hotspots, and seasonal patterns.

---

## 🎯 Research Question

**How have the spatial and temporal distributions of feral deer species in NSW changed over time, and what patterns emerge from different species' observations?**

---

## 📊 Data Collection

Data was collected using the `galah` R package, which connects to the ALA API. Filters were applied to retrieve:
- Family: *Cervidae* (deer)
- Region: New South Wales

The resulting dataset includes scientific names, coordinates, and observation dates for each record.

---

## 📍 Spatial Distribution

A map of NSW deer sightings shows that observations are concentrated in the **eastern and southeastern regions**, especially around the Great Dividing Range. Sparse observations in the west may reflect lower deer populations or limited sampling effort.

🖼️ <!-- *(Add your map here if uploaded to GitHub — e.g., `![map](plots/deer_distribution.png)`)* -->
<!-- Or link to your HTML report -->

---

## 📈 Temporal Trends

- A **sharp rise in observations post-2000**, peaking around 2011.
- This likely reflects both population growth and improved reporting systems.

---

## 🔄 Seasonal Patterns

Deer observations vary by month, with **higher activity in autumn and spring**. This may relate to behavioural cycles such as rutting, feeding, or increased human sightings.

---

## 🔬 Species Frequency

- **Top species**: *Dama dama* (fallow deer)
- Also common: *Cervus* spp.
- Some records list only higher-level taxa (e.g., *CERVIDAE*), indicating uncertain ID.

---

## 📁 Files Included

- `README.md`: This summary file  
- `dsaa811_preliminary_report.Rmd`: Full R Markdown analysis (available in repo)  
- `nsw_deer_data.csv`: Cleaned deer sightings from ALA  
- `/plots/`: Folder containing visualisation outputs (if exported)

---

## 📚 Data Source

Data retrieved from the **[Atlas of Living Australia (ALA)](https://www.ala.org.au/)** using the `galah` package (accessed April 2025).  
Filtering criteria: `family == "Cervidae"` and `stateProvince == "New South Wales"`.

---

## 📦 R Packages Used

- `tidyverse`
- `galah`
- `lubridate`
- `ozmaps`
- `ggplot2`
