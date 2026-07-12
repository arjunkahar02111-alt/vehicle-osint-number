GRANT ALL ON TABLE public.admin_settings TO service_role;
GRANT ALL ON TABLE public.blocked_ips TO service_role;
GRANT ALL ON TABLE public.lookup_logs TO service_role;

ALTER TABLE public.admin_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.blocked_ips ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lookup_logs ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "no client access" ON public.admin_settings;
DROP POLICY IF EXISTS "no client access" ON public.blocked_ips;
DROP POLICY IF EXISTS "no client access" ON public.lookup_logs;

CREATE POLICY "no client access"
  ON public.admin_settings
  FOR ALL
  TO anon, authenticated
  USING (false)
  WITH CHECK (false);

CREATE POLICY "no client access"
  ON public.blocked_ips
  FOR ALL
  TO anon, authenticated
  USING (false)
  WITH CHECK (false);

CREATE POLICY "no client access"
  ON public.lookup_logs
  FOR ALL
  TO anon, authenticated
  USING (false)
  WITH CHECK (false);

NOTIFY pgrst, 'reload schema';
