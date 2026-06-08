-- ==============================================================================
-- Title:       Multi-Facility Provider Utilization Query Engine
-- Author:      Owar Omot
-- Date:        June 2026
-- Description: Aggregates raw, transactional Electronic Health Record (EHR) 
--              encounter logs, extracts cumulative patient-facing clinical 
--              minutes, converts durations to decimal hours, and evaluates 
--              total active performance metrics against logged facility shifts 
--              and the central provider registry.
-- Optimization: Implements a Common Table Expression (CTE) to isolate pre-
--               aggregated shift-level hours prior to system-wide evaluation.
-- ==============================================================================

WITH Performance_CTE AS (
    SELECT 
        s.facility_location,
        p.provider_name,
        p.specialty,
        s.scheduled_hours,
        -- Convert granular encounter durations from minutes to decimal hours
        ROUND(SUM(e.encounter_duration_minutes) / 60.0, 2) AS total_patient_hours
    FROM facility_shifts s
    -- Join registry to map metadata details to the active shift log
    INNER JOIN provider_registry p 
        ON s.provider_id = p.provider_id
    -- Join transaction logs to aggregate individual patient visit durations
    INNER JOIN encounter_logs e 
        ON s.shift_id = e.shift_id
    -- Aggregate at the individual shift layer first to preserve schedule integrity
    GROUP BY s.shift_id
)
SELECT 
    facility_location,
    provider_name,
    specialty,
    -- Compute cumulative scheduling and patient-facing metrics across all shifts
    SUM(scheduled_hours) AS total_scheduled_hours,
    SUM(total_patient_hours) AS total_clinical_hours,
    -- Calculate final capacity percentage (Clinical Contact Hours / Scheduled Shift Hours)
    ROUND((SUM(total_patient_hours) / SUM(scheduled_hours)) * 100, 1) AS utilization_rate_pct
FROM Performance_CTE
GROUP BY 
    facility_location, 
    provider_name
ORDER BY 
    facility_location ASC, 
    utilization_rate_pct DESC;

Create standalone SQL query script
cripts/provider_utilization_query.sql
