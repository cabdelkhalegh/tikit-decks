-- ============================================================
-- TiKiT Creator Profiles — ALREADY EXECUTED on 2026-03-30
-- Table creator_profiles + creator_profile_id column created
-- RLS policies set (anon insert/update/select)
-- ============================================================

-- Run verification:
SELECT column_name FROM information_schema.columns 
WHERE table_name = 'creator_profiles' 
ORDER BY ordinal_position;
