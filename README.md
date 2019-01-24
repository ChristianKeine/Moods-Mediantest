# Mood's Mediantest

Mood's Median Test compares the medians of two or more groups. The test counts how many observations in each group are greater than the global median for all groups together and calculuates Chi-square statistics on those obervations. Less powerful than Kruskal-Wallis test, but requires fewer assumptions.


Information on the test from [1]:

**Appropriate data for use with Mood's median test:**
	- One-way data with two or more groups
  - Dependent variable is ordinal, interval, or ratio
  - Independent variable is a factor with levels indicating groups
  - Observations between groups are independent.  That is, not paired or repeated measures data

**Hypotheses:**
  - Null hypothesis:  The medians of values for each group are equal.
  - Alternative hypothesis (two-sided): The medians of values for each group are not equal.

**Interpretation:**
- Significant results can be reported as “There was a significant difference in the median values among groups.”

[1] Mangiafico, S.S. 2016. Summary and Analysis of Extension Program Evaluation in R, version 1.15.0. rcompanion.org/handbook/. (Pdf version: rcompanion.org/documents/RHandbookProgramEvaluation.pdf.)


**How to use:**

Inputs can be entered in several ways:
- individual data groups [e.g. mediantest(dataset1,dataset2,dataset3)] in which each dataset is a vector of continous responses, or   data vector and group
- 2-column matrix containing responses (data) and groups identifier
- table containing columns 'data' and 'group'
