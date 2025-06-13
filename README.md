# Data Analysis Project

A comprehensive collection of statistical analysis methods implemented in R, focusing on medical and healthcare datasets. This project demonstrates various data analysis techniques including clustering, factor analysis, multivariate testing, classification, regression, and survival analysis.

## 📁 Project Structure

```
data_analysis/
├── README.md
├── datasets/
│   ├── DataV.csv          # Medical dataset (COVID-related patient data)
│   ├── data_big.csv       # Cardiovascular dataset
│   └── points5.csv        # Survival analysis dataset
├── cluster.R              # Clustering analysis with decision trees
├── factor.R               # Factor analysis and PCA
├── hotelling.R            # Hotelling's T² test
├── lda.R                  # Linear Discriminant Analysis
├── regr.R                 # Multiple regression analysis
└── surv.R                 # Survival analysis
```

## 📊 Datasets

### DataV.csv
- **Size**: 145 patients × multiple variables
- **Content**: COVID-related medical data with cardiovascular parameters
- **Variables**: Age, blood pressure, severity scores, outcomes (Russian column names)
- **Used in**: `cluster.R`, `lda.R`

### data_big.csv
- **Size**: 35 patients × multiple time points
- **Content**: Cardiovascular and psychological parameters
- **Variables**: HR (Heart Rate), SBP (Systolic Blood Pressure), SV (Stroke Volume), MBP (Mean Blood Pressure)
- **Used in**: `hotelling.R`, `regr.R`

### points5.csv
- **Size**: 169 observations
- **Content**: Survival analysis data
- **Variables**: Survival days, surgical status, immunoglobulin levels
- **Used in**: `surv.R`

## 🔬 Analysis Scripts

### 1. cluster.R - Clustering Analysis
**Purpose**: Implements clustering using decision trees and information gain methods

**Key Features**:
- Custom information gain functions (`I_inf`, `D_inf`, `GinyDA.`)
- Decision tree construction based on information theory
- Comparison between standard and information gain-based trees
- Visualization of clustering results

**Methods**:
- Information gain calculation
- Decision tree algorithms
- Gini impurity measures

### 2. factor.R - Factor Analysis & PCA
**Purpose**: Performs dimensionality reduction and factor analysis on medical data

**Key Features**:
- Principal Component Analysis (PCA)
- Eigenvalue decomposition
- Factor loadings calculation
- Comparison with built-in R functions

**Methods**:
- Manual PCA implementation
- `princomp()` function validation
- Variance explained analysis

### 3. hotelling.R - Multivariate Testing
**Purpose**: Implements Hotelling's T² test for multivariate statistical analysis

**Key Features**:
- Outlier detection using chi-square distribution
- Multivariate hypothesis testing
- Scatter plot visualization with p-value coloring

**Methods**:
- Hotelling's T² statistic
- Chi-square distribution testing
- Multivariate outlier identification

### 4. lda.R - Linear Discriminant Analysis
**Purpose**: Classification analysis using Linear Discriminant Analysis

**Key Features**:
- Variable selection based on standard deviation
- LDA for both factorial and metric variables
- Discriminant function visualization
- Classification accuracy assessment

**Methods**:
- Linear discriminant functions
- Variable importance analysis
- Classification visualization

### 5. regr.R - Multiple Regression Analysis
**Purpose**: Comprehensive regression modeling and variable selection

**Key Features**:
- Manual coefficient calculation using covariance matrices
- Model comparison with built-in `lm()` function
- Combinatorial model selection
- Stepwise regression using `olsrr` package

**Methods**:
- Multiple linear regression
- Model selection algorithms
- Coefficient significance testing

### 6. surv.R - Survival Analysis
**Purpose**: Time-to-event analysis using survival methods

**Key Features**:
- Kaplan-Meier survival curves
- Log-rank tests for group comparisons
- Cox proportional hazards models

**Methods**:
- Survival curve estimation
- Hazard ratio calculation
- Time-to-event modeling

## 🛠️ Required R Packages

```r
# Core packages
install.packages(c("survival", "survminer", "olsrr"))

# Additional packages that may be required
install.packages(c("ggplot2", "dplyr", "MASS"))
```

## 🚀 Usage Instructions

### Running Individual Scripts

1. **Set working directory** to the project folder
2. **Load required packages** for each script
3. **Run scripts** in any order (they are independent)

```r
# Example: Running cluster analysis
setwd("path/to/data_analysis")
source("cluster.R")
```

### Script Dependencies
- Each script loads its required datasets automatically
- Scripts are designed to be run independently
- Ensure all CSV files are in the `datasets/` directory

## 📈 Key Methodologies

### Statistical Methods Implemented
- **Clustering**: Information gain-based decision trees
- **Dimensionality Reduction**: PCA and factor analysis
- **Multivariate Testing**: Hotelling's T² test
- **Classification**: Linear Discriminant Analysis
- **Regression**: Multiple linear regression with model selection
- **Survival Analysis**: Kaplan-Meier and Cox regression

### Custom Implementations
- Information gain calculation functions
- Manual PCA computation
- Covariance-based regression coefficients
- Decision tree algorithms

## 📋 Output Examples

Each script generates:
- **Statistical summaries** and test results
- **Visualizations** (plots, charts, survival curves)
- **Model comparisons** and validation metrics
- **Classification/prediction results**

## 🎯 Learning Objectives

This project demonstrates proficiency in:
- Advanced statistical analysis in R
- Custom algorithm implementation
- Medical data analysis
- Multivariate statistical methods
- Survival analysis techniques
- Model validation and comparison