Multi-Facility Provider Utilization & Contract Performance Engine
🔗 Live Deliverables
Interactive Executive Report: View the Live Analytics Dashboard on RPubs

Production Database Script: View Standalone SQL Queries Engine (scripts/provider_utilization_query.sql)

🎯 Executive Summary
In integrated healthcare delivery networks, clinical operations and scheduling data are frequently siloed away from high-velocity Electronic Health Record (EHR) transaction logs. This structural fragmentation leads to costly capacity imbalances—leaving certain regional facilities struggling with acute clinician burnout and patient bottlenecks, while neighboring clinics operate significantly under capacity.

This project engineers a modular, end-to-end clinical operations analytics pipeline. By constructing an in-memory relational database, optimizing SQL data transformation layers, and designing clean business intelligence assets, this engine systematically structures thousands of raw patient encounter logs into a unified performance dashboard. The pipeline empowers healthcare leadership to make data-driven, strategic decisions regarding clinician capacity, contract compliance, and resource reallocation.

🏗️ Data Architecture & Business Logic
The pipeline simulates a scalable relational database schema tracking high-velocity healthcare metrics across three core operational tables:

provider_registry: Granular clinician metadata tracking unique provider identifiers, names, medical specialties, and individual contracted hours per week.

facility_shifts: Logged schedule metadata documenting shift dates, scheduled shift lengths, and unique regional facility tracking locations (Mankato Main Hospital, North Mankato Clinic, and St. Cloud Urgent Care).

encounter_logs: High-volume transactional EHR encounter metadata capturing individual patient visits, diagnostic/billing codes, and active patient-facing clinical duration tracked in minutes.

🛠️ Tech Stack & Skills Demonstrated
Database & Transformation Layer: SQL (SQLite) & R (DBI / RSQLite). Engineered advanced relational database logic, multi-table structural joins, and Common Table Expressions (CTEs) to isolate and aggregate raw patient-facing minutes into clean, scheduled clinical hours.

Core Analytics & Data Wrangling: Leveraged tidyverse (dplyr / tibble) to compute network-wide operational averages, facility-level performance baselines, and individual clinician utilization metrics.

Data Visualization & Business Intelligence: Developed a highly polished, executive-ready horizontal bar chart in ggplot2. Implemented explicit visual anchor points, customized coordinate flips, professional color scales, and a distinct 80% maximum efficiency target line optimized for stakeholder presentation.

Engineering Best Practices: Established a production-grade, modular directory structure by completely separating pure SQL backend logic from front-end visual reporting layers.

📊 Core Operational Insights & Strategic Recommendations
1. Address Extreme Under-Utilization at North Mankato Clinic
The Data Insight: Aggregated metrics revealed that the North Mankato Clinic operates at an average provider utilization rate below 38%, with multiple clinicians dropping below a 30% efficiency metric, signaling massive excess capacity.

Strategic Action: Healthcare leadership should adjust scheduled provider hours away from North Mankato or launch targeted regional community outreach initiatives to capture higher regional patient volume.

2. Monitor Burnout Risk at St. Cloud Urgent Care
The Data Insight: St. Cloud Urgent Care maintains the highest utilization rate across the network. While efficient, acute care environments operating near maximum capacity present an immediate risk for clinician burnout and staff turnover.

Strategic Action: Implement proactive scheduling guardrails; when individual provider utilization crosses a rolling threshold, a clinical float resource should be automatically deployed.

3. Continuous Pipeline Automation
The Data Insight: The workflow successfully demonstrated that unorganized, raw transactional timestamps can be systematically structured into live executive metrics.

Strategic Action: Transition this architecture from static reporting into an automated weekly data pipeline by connecting the optimized SQL engine directly into a live health system dashboard.
