# Cars24-Analysis-project
Welcome to the Cars24 Analysis project! This project involves scraping data from the Cars24 website, cleaning and transforming the data, and performing analysis to extract valuable insights. The project utilizes various tools and technologies, including Selenium, BeautifulSoup, Python, MySQL, Excel, and Power BI.

## Project Overview
In this project, we scraped data from the Cars24 website to collect information about used cars. We then cleaned and transformed the data using Python, stored it in a MySQL database, and performed queries to analyze the data. Finally, we created visualizations and dashboards using Excel and Power BI to present the insights effectively.

## Key Steps and Technologies
Data Scraping: Used Selenium and BeautifulSoup to scrape data from the Cars24 website.
Data Cleaning & Transformation: Cleaned and transformed the data using Python and exported it to CSV files.
Database Storage: Imported the cleaned CSV files into a MySQL database for querying and analysis.
Data Analysis: Performed SQL queries to analyze the data and extract insights.
Visualization: Created dashboards and visualizations using Excel and Power BI to present the findings.
## Live Demo
Explore the live project and view interactive dashboards here: [Cars24 Analysis Project]https://app.powerbi.com/view?r=eyJrIjoiYjc2NTQwYTYtYThmZC00YmY4LThkZTctY2RhYzMwZTUzZGQ2IiwidCI6ImI2YzZjMjZlLTE2NGYtNDk5NC1hNWY5LWZmN2QxYTJjMzc1NSJ9

## Technologies Used
Python: For data scraping (Selenium, BeautifulSoup), cleaning, and transformation.
Selenium: Web scraping tool used to automate the extraction of data from the Cars24 website.
BeautifulSoup: Python library for parsing HTML and extracting data from web pages.
MySQL: Database management system for storing and querying the cleaned data.
Excel: For creating initial visualizations and basic analysis.
Power BI: For creating interactive and comprehensive dashboards.
## Project Details
### Data Scraping
Setup: Installed Selenium and BeautifulSoup for web scraping.
Scraping Script: Developed a Python script using Selenium to automate browsing and BeautifulSoup to parse and extract data.
Data Extraction: Collected data including car make, model, year, price, mileage, and location.
Data Cleaning & Transformation
Data Cleaning: Cleaned the scraped data to handle missing values, inconsistencies, and formatting issues using Python.
Data Transformation: Transformed the data into a structured format and saved it as CSV files for further processing.
### Database Storage
MySQL Setup: Set up a MySQL database to store the cleaned data.
Data Import: Imported CSV files into MySQL tables.
Queries: Performed SQL queries to analyze the data, such as aggregating prices, filtering by location, and identifying trends.
Visualization
Excel: Created initial visualizations and basic charts in Excel for preliminary insights.
Power BI: Developed interactive dashboards in Power BI to provide a comprehensive view of the data. Included metrics such as average car prices, distribution by make/model, and location-based trends.
## Getting Started
To run this project locally, follow these steps:

## Prerequisites
Python 3.x
MySQL Server
Excel
Power BI Desktop
Installation
Clone the Repository
git clone https://github.com/your-username/cars24-analysis.git
cd cars24-analysis
Install Python Packages
pip install selenium beautifulsoup4 pandas mysql-connector-python
Setup Selenium

Download and install the appropriate WebDriver for your browser (e.g., ChromeDriver for Chrome).
Place the WebDriver executable in your system’s PATH.
Run the Scraping Script

python scrape_cars24.py
Import Data to MySQL

Create a MySQL database and tables as defined in schema.sql.
Import the CSV files into the MySQL database.
Perform Analysis

Execute SQL queries using MySQL to analyze the data.
Visualize Data

Open the Cars24_Analysis_Excel.xlsx file in Excel for initial visualizations.
Open Cars24_Analysis_PowerBI.pbix in Power BI Desktop to explore interactive dashboards.
## Project Structure
scrape_cars24.py: Python script for web scraping.
data/: Folder containing raw and cleaned CSV files.
schema.sql: SQL script for setting up the MySQL database schema.
Cars24_Analysis_Excel.xlsx: Excel file with initial visualizations.
Cars24_Analysis_PowerBI.pbix: Power BI file with interactive dashboards.
## Usage
Open the Cars24_Analysis_PowerBI.pbix file in Power BI Desktop to explore the dashboards and insights. You can interact with the visualizations to analyze various aspects of the used car market.

