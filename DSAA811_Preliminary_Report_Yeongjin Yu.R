#install.packages("galah")  
library(galah)  

# Make sure to register your email at https://www.ala.org.au/
# before using galah_config() to access ALA datasets
galah_config(email = "yjyuwisely@gmail.com") 

# Connect to the Atlas of Living Australia  
galah_identify("ALA")  

# Filter for deer species in NSW  
nsw_deer <- galah_call() |>  
  galah_filter(  
    family == "Cervidae",  
    stateProvince == "New South Wales"  
  ) |>  
  atlas_occurrences()  

# View the first few rows of the data  
head(nsw_deer)  

# Save to CSV file  
write.csv(nsw_deer, "nsw_deer_data.csv", row.names = FALSE)  


# EDA

# Load necessary packages  
library(tidyverse)  
library(lubridate)  

# Read the downloaded data  
nsw_deer <- read_csv("nsw_deer_data.csv")  

# Basic data cleaning  
#nsw_deer_clean <- nsw_deer %>%  
#  drop_na(decimalLatitude, decimalLongitude) %>%  
#  mutate(eventDate = ymd(eventDate))  

nsw_deer_clean <- nsw_deer %>%  
  filter(!is.na(decimalLatitude), !is.na(decimalLongitude)) %>%  
  mutate(  
    # Convert date strings to proper date objects  
    # Adjust this depending on your date format  
    observation_date = ymd(substring(eventDate, 1, 10)),  
    year = year(observation_date)  
  )  

# Summary by species  
species_summary <- nsw_deer %>%  
  group_by(scientificName) %>%  
  summarize(  
    count = n(),  
    earliest_record = min(eventDate, na.rm = TRUE),  
    latest_record = max(eventDate, na.rm = TRUE)  
  )  

print(species_summary)  

# Create visualization 1: Map of deer sightings 

# Using Australian government data  
#install.packages("ozmaps")  
library(ozmaps)  

# Get the NSW border  
nsw_border <- ozmaps::ozmap_states %>%  
  filter(NAME == "New South Wales")  

# Create your map with the NSW border  
ggplot() +  
  # First add the NSW border  
  geom_sf(data = nsw_border, fill = NA, color = "black", size = 1) +  
  # Then add your points  
  geom_point(data = nsw_deer_clean,   
             aes(x = decimalLongitude, y = decimalLatitude, color = scientificName),  
             alpha = 0.7) +  
  # Set the coordinate system  
  coord_sf() +  
  # Rest of your styling  
  theme_minimal() +  
  labs(  
    title = "Distribution of Deer Species in NSW",  
    subtitle = "Data from Atlas of Living Australia",  
    x = "Longitude", y = "Latitude",  
    color = "Species"  
  ) +  
  theme(  
    legend.position = "right",  
    plot.title = element_text(size = 16, face = "bold"),  
    plot.subtitle = element_text(size = 12, face = "italic"),  
    axis.title = element_text(size = 12, face = "bold"),  
    legend.title = element_text(size = 12, face = "bold")  
  ) +  
  guides(color = guide_legend(override.aes = list(size = 4))) 


#ggplot(nsw_deer_clean, aes(x = decimalLongitude, y = decimalLatitude, color = scientificName)) +  
#  geom_point(alpha = 0.7) +  
#  theme_minimal() +  
#  labs(title = "Distribution of Deer Species in NSW",  
#       subtitle = "Data from Atlas of Living Australia",  
#       x = "Longitude", y = "Latitude",  
#       color = "Species")  


# Create visualization 2: Species counts  
species_counts <- nsw_deer_clean %>%  
  group_by(scientificName) %>%  
  summarise(count = n()) %>%  
  arrange(desc(count))  

ggplot(species_counts, aes(x = reorder(scientificName, count), y = count)) +  
  geom_col(fill = "steelblue") +  
  coord_flip() +  
  theme_minimal() +  
  labs(  
    title = "Frequency of Deer Species Observations in NSW",  
    x = "Species",  
    y = "Number of Observations"  
  )  

# Create visualization 3: Observations over time  
yearly_counts <- nsw_deer_clean %>%  
  group_by(year) %>%  
  summarise(count = n()) %>%  
  filter(!is.na(year))  

ggplot(yearly_counts, aes(x = year, y = count)) +  
  geom_line() +  
  geom_point() +  
  theme_minimal() +  
  labs(  
    title = "Deer Observations in NSW Over Time",  
    x = "Year",  
    y = "Number of Observations"  
  )  

# Create visualization 4: Seasonal Patterns in Deer Observations
# Extract month and create seasonal analysis  
nsw_deer_clean <- nsw_deer_clean %>%  
  mutate(month = month(observation_date))  

monthly_counts <- nsw_deer_clean %>%  
  group_by(month) %>%  
  summarise(count = n()) %>%  
  filter(!is.na(month))  

month_names <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",   
                 "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")  

ggplot(monthly_counts, aes(x = factor(month, labels = month_names), y = count)) +  
  geom_col(fill = "steelblue") +  
  theme_minimal() +  
  labs(  
    title = "Seasonal Patterns in NSW Deer Observations",  
    x = "Month",  
    y = "Number of Observations"  
  ) +  
  theme(  
    plot.title = element_text(size = 16, face = "bold"),  
    axis.title = element_text(size = 12, face = "bold")  
  )  