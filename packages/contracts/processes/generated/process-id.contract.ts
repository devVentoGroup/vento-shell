// GENERATED FILE. DO NOT EDIT.
// Canonical registry: PROC-CANONICAL-ID-REGISTRY-001
// Registry owner: PROC-CAT-003
// Reconciliation: PROC-CAT-020
// Contract task: SHELL-CON-009
// Source contract SHA256: 4a0c268805ba01f732e942703641b11cf9836a2e6c585dc5ea315328be229bd5

export const PROCESS_ID_PATTERN_SOURCE = "^VPROC-[0-9]{4}$" as const;

export const PROCESS_ID_PATTERN = /^VPROC-[0-9]{4}$/;

export const PROCESS_IDS = [
  "VPROC-0001",
  "VPROC-0002",
  "VPROC-0003",
  "VPROC-0004",
  "VPROC-0005",
  "VPROC-0006",
  "VPROC-0007",
  "VPROC-0008",
  "VPROC-0009",
  "VPROC-0010",
  "VPROC-0011",
  "VPROC-0012",
  "VPROC-0013",
  "VPROC-0014",
  "VPROC-0015",
  "VPROC-0016",
  "VPROC-0017",
  "VPROC-0018",
  "VPROC-0019",
  "VPROC-0020",
  "VPROC-0021",
  "VPROC-0022",
  "VPROC-0023",
  "VPROC-0024",
  "VPROC-0025",
  "VPROC-0026",
  "VPROC-0027",
  "VPROC-0028",
  "VPROC-0029",
  "VPROC-0030",
  "VPROC-0031",
  "VPROC-0032",
  "VPROC-0033",
  "VPROC-0034",
  "VPROC-0035",
  "VPROC-0036",
  "VPROC-0037",
  "VPROC-0038",
  "VPROC-0039",
  "VPROC-0040",
  "VPROC-0041",
  "VPROC-0042",
  "VPROC-0043",
  "VPROC-0044",
  "VPROC-0045",
  "VPROC-0046",
  "VPROC-0047",
  "VPROC-0048",
  "VPROC-0049",
  "VPROC-0050",
  "VPROC-0051",
  "VPROC-0052",
  "VPROC-0053",
  "VPROC-0054",
  "VPROC-0055",
  "VPROC-0056",
  "VPROC-0057",
  "VPROC-0058",
  "VPROC-0059",
  "VPROC-0060",
  "VPROC-0061",
  "VPROC-0062",
  "VPROC-0063",
  "VPROC-0064",
  "VPROC-0065",
  "VPROC-0066",
  "VPROC-0067",
  "VPROC-0068",
  "VPROC-0069",
] as const;

export type ProcessId = (typeof PROCESS_IDS)[number];

export const PROCESS_ID_REGISTRY_METADATA = {
  registry_id: "PROC-CANONICAL-ID-REGISTRY-001",
  registry_status: "CANONICAL",
  assigned_count: 69,
  canonical_count: 69,
  merged_alias_count: 0,
  split_parent_count: 0,
  retired_count: 0,
  void_count: 0,
  first_process_id: "VPROC-0001",
  last_process_id: "VPROC-0069",
  next_available_process_id: "VPROC-0070",
  format_pattern: "^VPROC-[0-9]{4}$",
  source_task_id: "PROC-CAT-003",
  reconciliation_task_id: "PROC-CAT-020",
  contract_task_id: "SHELL-CON-009",
} as const;

export type ProcessIdRegistryMetadata =
  typeof PROCESS_ID_REGISTRY_METADATA;

const PROCESS_ID_SET = new Set<string>(PROCESS_IDS);

export function isProcessIdFormat(value: unknown): value is string {
  return (
    typeof value === "string"
    && value !== "VPROC-0000"
    && PROCESS_ID_PATTERN.test(value)
  );
}

export function isProcessId(value: unknown): value is ProcessId {
  return isProcessIdFormat(value) && PROCESS_ID_SET.has(value);
}
