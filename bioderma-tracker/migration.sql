-- ============================================================
-- TiKiT Creator Profiles — Reusable across all campaigns
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================================

CREATE TABLE IF NOT EXISTS creator_profiles (
  id              bigserial PRIMARY KEY,
  handle_ig       text,
  handle_tt       text,
  full_name       text,
  phone_whatsapp  text,
  phone_alt       text,
  email           text,
  address_line1   text,
  address_line2   text,
  city            text,
  emirate         text,
  country         text DEFAULT 'UAE',
  postal_code     text,
  nationality     text,
  gender          text,
  age_range       text,
  language_pref   text,
  created_at      timestamptz DEFAULT now(),
  updated_at      timestamptz DEFAULT now()
);

-- Add profile reference to bioderma campaign table
ALTER TABLE bioderma_creators
ADD COLUMN IF NOT EXISTS creator_profile_id bigint REFERENCES creator_profiles(id);

-- Allow anon reads and inserts (for magic link form)
ALTER TABLE creator_profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anon insert" ON creator_profiles
  FOR INSERT TO anon WITH CHECK (true);

CREATE POLICY "Allow anon update own" ON creator_profiles
  FOR UPDATE TO anon USING (true);

CREATE POLICY "Allow anon select" ON creator_profiles
  FOR SELECT TO anon USING (true);

-- ============================================================
-- Verification query (run after):
-- SELECT * FROM creator_profiles LIMIT 5;
-- ============================================================
