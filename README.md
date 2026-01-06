# Spam-Email-Detection-Analysis
Spam Email Detection &amp; Analysis is an end-to-end data science project that analyzes email data stored in PostgreSQL, identifies spam patterns using SQL and NLP techniques, builds machine learning–ready features in Python, and visualises insights through an interactive Power BI dashboard.

📌 Project Overview

Spam emails continue to be a major problem in digital communication, often containing misleading, promotional, or fraudulent content.
This project focuses on analyzing spam and non-spam (ham) emails, identifying key textual patterns using SQL and NLP, and preparing insights for machine learning–based spam classification.

The project follows an industry-style workflow, integrating database management, data analysis, machine learning, and business intelligence visualization.

🎯 Project Objectives

Analyze spam vs ham email distribution

Identify spam-specific text patterns

Perform SQL-based exploratory data analysis

Engineer NLP features for ML models

Build machine learning–ready datasets

Visualize insights using Power BI

🗂️ Dataset Description

The dataset consists of labeled email messages.

Columns:

message – Email content (subject + body)

category – Label (spam or ham)

Dataset Statistics
Metric	Count
Total Emails	5,572
Spam Emails	747
Ham Emails	4,825

📌 The dataset is imbalanced, reflecting real-world email systems.

🛠️ Tech Stack Used
Category	Tools
Database	PostgreSQL
Programming	Python
Libraries	pandas, scikit-learn, SQLAlchemy
NLP	TF-IDF, text preprocessing
ML Models	Naive Bayes, Logistic Regression, SVM
Visualization	Power BI
🏗️ Project Architecture
Raw CSV Data
     ↓
PostgreSQL Database
     ↓
SQL Analysis
     ↓
Python (NLP + ML)
     ↓
Power BI Dashboard

🗃️ Database Design (PostgreSQL)
emails (
  category TEXT,
  message TEXT,
  clean_message TEXT,
  message_length INT,
  word_count INT
)

📊 SQL-Based Analysis

SQL queries were used to:

Count spam vs ham emails

Calculate average word count per category

Analyze message length distribution

Measure vocabulary diversity

Extract top spam keywords

Key Findings

Spam emails reuse fewer unique words

Ham emails show higher linguistic diversity

Spam messages are generally longer

🔍 NLP & Feature Engineering

Text normalization (lowercase, punctuation removal)

Word count and message length calculation

TF-IDF vectorization

Label encoding:

ham → 0

spam → 1

🤖 Machine Learning Models

The following models were trained:

Naive Bayes

Logistic Regression

Support Vector Machine (SVM)

📌 SVM performed best for spam classification and was selected as the final model.

📈 Power BI Dashboard

Dashboard Title:
Spam Email Detection & Analysis Dashboard

Dashboard Features:

Spam vs Ham distribution

Spam percentage KPI

Average message length comparison

Average word count comparison

Top spam word analysis

Interactive category filtering

📌 Power BI connects directly to PostgreSQL.

📌 Key Insights

Spam emails contain repetitive, action-driven language

Common spam keywords include:
call, free, claim, prize, txt, www

Spam emails are longer and more persuasive

SQL insights strongly support NLP feature engineering
