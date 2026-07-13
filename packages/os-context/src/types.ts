export type EffectiveContextSource =
  | "shared_device"
  | "simulation"
  | "administrative_bypass"
  | "anima"
  | "real"
  | "none";

export type EffectiveContext = {
  source: EffectiveContextSource;
  session_mode: "employee" | "shared_device" | string;
  app_code: string | null;
  user_id: string | null;
  real_administrative_role: string | null;
  effective_administrative_role: string | null;
  effective_operational_role: string | null;
  site_id: string | null;
  area_id: string | null;
  area_kind: string | null;
  shift_id: string | null;
  simulation_id: string | null;
  shared_device_id: string | null;
  is_simulation: boolean;
  is_shared_device: boolean;
  bypass_applied: boolean;
  can_operate: boolean;
  blocked_reasons: string[];
  metadata: Record<string, unknown>;
};

export type ContextSimulationInput = {
  siteId: string;
  areaId?: string | null;
  operationalRole?: string | null;
  administrativeRole?: string | null;
  durationMinutes?: number;
  metadata?: Record<string, unknown>;
};
