# Ridership Trends of Bay Wheels Member and Casual Riders: Data analysis exploring bike share rider behavior
Embarking on the Coursera Data Analytics Certificate capstone project, participants were offered a choice of two predefined projects or the liberty to propose their own distinctive project. I initially engaged with Divvy by Lyft data concerning Chicago city bikes. However, a deeper exploration of Lyft's offerings led me to the discovery of their Bikeshare program in my hometown of San Francisco. This intriguing find prompted me to shift my focus to the San Francisco Bay Wheels Bikeshare data for my project.

Within this initiative, my role as a Junior Data Analyst is integral to the Marketing Analyst team at Cyclistic, a fictional bike-share enterprise. Our directive, guided by our director, revolves around enhancing membership, firmly believing that transitioning casual riders into committed members is crucial for the company's growth. Our primary responsibility is to derive invaluable insights and formulate well-founded recommendations. This empowers us to seamlessly convert casual riders into loyal, annual members, driving the company towards its objectives.

## Description
Goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, the marketing analyst team needs to better understand:
* How annual members and casual riders differ (The purpose of this project)
* Why casual riders would buy a membership
* How digital media could affect their marketing tactics.

In order to achieve the goal, these are the questions I'm going to answer:
* How do annual members and casual riders use Cyclistic bikes differently?
** What is the difference in trip duration for each user type?
** What days of the week are busiest for each type of user?
** What times of day are busiest for each type of user?
** What are the five most common start to end routes for each user?

## Installation
Go [here(https://posit.co/download/rstudio-desktop/) to install R and RStudio
1. Install R
2. Install RStudio
3. Download the raw data [here]([here](https://s3.amazonaws.com/baywheels-data/index.html) if you want to follow along with the .Rmd file

## Usage
* Open the project in RStudio
* check /data/raw to see if the data is already there (You may need to unhide it).  If is is not there, add the data you downloaded there.
* Alternatively, you can follow along at my [Kaggle](https://www.kaggle.com/code/natedewaele/ridership-trends-of-bay-wheels/edit/run/150942190) notebook.

## Usage
### How to use the files
If you want to follow along with the data analysis process, you can copy the code in the .Rmd file and run it in the console.

Or, you can follow along the doc.  First you will need to run `install.packages("knitr")` in the console and then run `library(dplyr)`.  After Adding knitr, open **SF Bike Analysis Project.Rmd** and click **Knit**.  Once the document has been knitted, you can run the code chunks inside the document to see what the result will be by clicking `Run`.

You can also run individual lines from the tests.R, Analysis.R, cleaning_precleaned.R, and the visualizations.R scripts by highlighting the code and hitting `Cmd + Enter` on Mac and `Ctrl + Enter` on (Windows/Linux).

### Information about the data used in the project. If it's public data, provide the sources or links.

Data was obtained from Lyft Bikes and Scooters, LLC ("Bikeshare") operates the Bay Wheels bicycle sharing service.  It can be accessed at [here](https://s3.amazonaws.com/baywheels-data/index.html)

The data has been made available by Motivate International Inc. under this [license](https://baywheels-assets.s3.amazonaws.com/data-license-agreement.html)

Each trip is anonymized and includes:
* Trip Duration (seconds)
* Start Time and Date
* End Time and Date
* Start Station ID
* Start Station Name
* Start Station Latitude
* Start Station Longitude
* End Station ID
* End Station Name
* End Station Latitude
* End Station Longitude
* Ride ID
* User Type (Subscriber or Customer – “Subscriber” = Member or “Customer” = Casual)

In anonymizing the data, credit card info was removed we cannot determine bike records that demonstrate conversion from casual to member.  We also cannot see how often individual member or casual riders check bikes out.

### Credits
* Data set: Motivate International Inc. (Bay Wheels by Lyft). (Year). Bay Wheels Trip Data. Retrieved from URL: https://s3.amazonaws.com/baywheels-data/index.html.
License: Divvy Bikes. (2023). Data License Agreement. Retrieved from URL: https://divvybikes.com/data-license-agreement.
* Wickham, H. (2016). ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York. ISBN 978-3-319-24277-4. https://ggplot2.tidyverse.org
* Wickham, H., Francois, R., Henry, L., & Muller, K. (2021). Dplyr: A Grammar of Data Manipulation. R package version 1.0.7 Retrieved from https://CRAN.R-project.org/package=dplyr
* Xie, Y. (2021). Knitr: A General-Purpose Package for Dynamic Report Generation in R. R package version 1.33. Retrieved from https://CRAN.R-project.org/package/knitr
* Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L. D., Francois, R., … & Yutani, H. (2019). Welcome to the tidy verse. Journal of Open Source Software, 4(43), 1686. Retrieved from https://doi.org/10.21105/joss.01686
* Grolemund, H., & Wickham, H. (2011). Dates and times made easy with lubridate. Journal of Statistical Software, 40(3), 1-25. Retrieved from https://doi.org/10.18637/jss.v040.i03

### Contact Information
Message me on Github
