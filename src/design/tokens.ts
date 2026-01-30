export const baseTokens = {
  color: {
    ink: "#111827",
    inkSoft: "#6B7280",
    paper: "#F9FAFB",
    surface1: "#FFFFFF",
    surface2: "#F9FAFB",
    surface3: "#F3F4F6",
    border: "#E5E7EB",
    success: "#1F9D6A",
    warning: "#E08A00",
    danger: "#E0484A",
    info: "#2B7BBB",
    onBrand: "#FFFFFF",
  },
  radius: {
    xs: 8,
    sm: 12,
    md: 16,
    lg: 20,
    xl: 24,
    pill: 999,
  },
  space: {
    1: 4,
    2: 8,
    3: 12,
    4: 16,
    5: 20,
    6: 24,
    8: 32,
    10: 40,
    12: 48,
    16: 64,
  },
  shadow: {
    1: "0 6px 16px rgba(18, 14, 22, 0.08)",
    2: "0 14px 40px rgba(18, 14, 22, 0.12)",
  },
  typography: {
    display: "var(--font-sans)",
    body: "var(--font-sans)",
    mono: "var(--font-mono)",
  },
} as const;

export const themeTokens = {
  anima: {
    brand: "#E2006A",
    brand600: "#C6005C",
    brand700: "#B76E79",
    brandSoft: "#F2C6C0",
    paper: "#F7F5F8",
    surface2: "#F2EEF2",
    ink: "#1B1A1F",
    inkSoft: "#9E9AA6",
    border: "#E6E1EA",
  },
  nexo: {
    brand: "#F59E0B",
    brand600: "#92400E",
    brand700: "#92400E",
    brandSoft: "#F0E3C6",
    paper: "#FFF7E6",
    surface2: "#FFF1D1",
    ink: "#2A1A00",
    inkSoft: "#B8A07A",
    border: "#F0E3C6",
  },
  viso: {
    brand: "#A855F7",
    brand600: "#4C1D95",
    brand700: "#4C1D95",
    brandSoft: "#E6DFF5",
    paper: "#F6F2FF",
    surface2: "#EFE8FF",
    ink: "#1B1033",
    inkSoft: "#9B8FB6",
    border: "#E6DFF5",
  },
} as const;

export const tokens = {
  base: baseTokens,
  theme: themeTokens,
} as const;

export type Tokens = typeof tokens;
