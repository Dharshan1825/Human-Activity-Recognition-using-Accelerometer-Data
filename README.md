# Human Activity Recognition using Accelerometer Data

Introduction:

This report discusses the results of the EDA study comprising smartphone accelerometer data. The reason behind this was to assist in the extraction of statistical information about the acceleration signals and to subsequently assist in the making of the dataset for further modeling. In contrast to other methods, this report utilizes exceptional clustering methods and complex statistical interpretation to analyse data patterns and improve feature sets.

Task 1: Feature Extraction
The acceleration signals were captured along three axes (X, Y, Z) and their magnitudes. The selected statistical features for analysis included:
- Mean: To identify the central tendency of the dataset.
- Median: A robust measure against outliers.
- Standard Deviation: To assess the dispersion of the values.

Additionally, geometric mean and interquartile range (IQR) were computed further to strengthen the robustness of the feature extraction process. These metrics enhanced sensitivity to variations in data spread and shape.

Task 2: Data Visualization

Scatter Plots: Scatter plots were used to visualize the relationships between key features such as the Mean and Standard Deviation of acceleration in the X-direction and magnitude:
- Mean and Magnitude:
Scatter plots were done to analyze the relationship between the mean acceleration along the X-axis (Mean FAX) and mean magnitude (Mean FAMag) for each of the activities performed. It was observed that for activities of Jogging and Walking, more spread was noted in the scatter plot, this reflected the higher variances in their movements. In contrast, the scatter plot for Sitting and Standing activities was more clustered together. From the scatterplots, there was an observation of clear separation of activities like Walking and Jogging, although some activities had some variability which indicated that they may require further adjustment of features.
- Standard Deviation and Magnitude:
A different scatter figure addressed the scatter of standard deviation on the X-axis (Std FAX) and degrees of magnitude (Std FAMag). More variances were noted in dynamic activities such as jogging and walking compared to stationary positions such as Sitting and standing which were more clustered. The activities of Jogging show a degree of variability which goes hand in hand with the high standard deviation whose features are essential to telling apart active and stationary features.
