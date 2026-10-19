# Blinkit Grocery Data Analysis

An end-to-end data analytics project exploring grocery sales data with
**MySQL, Python, Power BI, and Excel**.

## Project Overview

The project follows a multi-tool workflow: 1. **MySQL** --- inspect the
dataset, standardize categorical labels, calculate KPIs, and analyze
sales by item and outlet dimensions. 2. **Python** --- perform
exploratory data analysis (EDA), inspect structure and data types, clean
labels, filter/group data, and create visualizations. 3. **Power BI**
--- present the analysis in a dashboard using the provided `.pbix` file.
4. **Excel** --- transform and summarize the data and create a
comparable dashboard.

## Dataset

The uploaded workbook's `BlinkIT_Grocery_Data` sheet contains **8,523
rows and 13 columns**. Fields include:

-   Item details: `Item_Identifier`, `Item_Type`, `Item_Fat_Content`,
    `Item_Visibility`, `Item_Weight`
-   Sales and rating: `Sales`, `Rating`
-   Outlet details: `Outlet_Identifier`, `Outlet_Establishment_Year`,
    `Outlet_Location_Type`, `Outlet_Size`, `Outlet_Type`
-   Workbook row field: `Sr No.`

The workbook data inspected for this report has no missing values in
these columns.

## Tools and Libraries

-   **MySQL** --- filtering, aggregation, `GROUP BY`, conditional
    aggregation, CTEs, and window functions
-   **Python** --- pandas, NumPy, Matplotlib, Seaborn
-   **Power BI** --- interactive business dashboard
-   **Microsoft Excel** --- data transformation, summary tables, charts,
    and dashboard design

## Analysis Performed

### SQL

-   Created the `blinkitdb` database and inspected row counts and sample
    records.
-   Standardized `Item_Fat_Content` values (`low fat`/`LF` → `Low Fat`;
    `reg` → `Regular`).
-   Calculated total sales, average sales, record count, and average
    rating.
-   Compared sales by fat content, item type, outlet location tier,
    outlet establishment year, outlet size, and outlet type.
-   Used a CTE and window function to calculate each outlet segment's
    percentage of total sales.

### Python EDA

-   Inspected sample rows, dimensions, columns, and data types.
-   Cleaned inconsistent fat-content labels.
-   Calculated headline KPIs and prepared the analysis workflow for
    visual exploration.
-   Used plotting libraries for charting. The charts generated for the
    accompanying report are based on the uploaded workbook data.

### Dashboards

-   **Power BI:** `Blinkit.pbix`
-   **Excel:** `BlinkIT_Grocery_Data_PROGRESS.xlsx` (`Sheet Design` and
    `Dashboard` sheets)

## Headline Metrics

  Metric                                Value
  -------------------------- ----------------
  Total sales                  \$1,201,681.49
  Average sales per record           \$140.99
  Records counted                       8,523
  Average rating                     3.97 / 5

## Selected Findings

-   Top item type by total sales: **Fruits and Vegetables**
    (\$178,124.08).
-   Second-highest item type by total sales: **Snack Foods**
    (\$175,433.92).
-   Highest-selling outlet type: **Supermarket Type1** (\$787,549.89).
-   Consistent category labels are essential for meaningful comparisons.

## Repository Structure

``` text
.
├── BlinkIT_Grocery_Data_PROGRESS.xlsx
├── Blinkit.pbix
├── Blinkit Analysis-checkpoint.ipynb
├── blinkit.sql
├── Blinkit_Grocery_Data_Analysis_Report.docx
├── Blinkit_Grocery_Data_Analysis_Presentation.pptx
└── README.md
```

## How to Use

1.  Open the workbook and review the `BlinkIT_Grocery_Data` sheet for
    source data and the dashboard sheets for Excel visuals.
2.  Import the dataset into MySQL and run the statements in
    `blinkit.sql`. The SQL script expects a table named `blinkit_data`
    to exist.
3.  Open the notebook in Jupyter and update the CSV path in the
    data-loading cell to match your local file location.
4.  Open `Blinkit.pbix` in Power BI Desktop to view the dashboard.
5.  Review the report and presentation for a summary of the analysis and
    selected charts.

## Notes and Limitations

-   The notebook reads a 12-column CSV, while the workbook sheet
    includes an additional `Sr No.` column; this report uses the
    workbook data for its calculations.
-   The SQL script assumes the `blinkit_data` table has already been
    imported.
-   The report's charts are generated from the uploaded workbook data to
    provide reproducible examples; the PBIX dashboard is included as a
    project artifact, but its page layout is not described beyond what
    could be verified from the file.
-   The dataset is analyzed descriptively. The results show associations
    and group comparisons, not causal relationships.

## Conclusion

This project demonstrates practical data analytics skills across SQL
querying, Python EDA, data cleaning, data visualization, Excel
transformations, and BI dashboarding.
