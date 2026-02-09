import { ImageResponse } from "next/og";

export const size = { width: 32, height: 32 };
export const contentType = "image/png";

export default function Icon() {
  return new ImageResponse(
    (
      <div
        style={{
          width: "100%",
          height: "100%",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          background: "#0f172a",
          borderRadius: 8,
        }}
      >
        <svg
          width="20"
          height="20"
          viewBox="0 0 32 32"
          fill="none"
          style={{ margin: "0 auto" }}
        >
          <path
            d="M8 22V10l5 9 3-6 3 6 5-9v12h-3V15.2l-2.5 4.5-2.5-5-2.5 5L11 15.2V22H8z"
            fill="white"
          />
        </svg>
      </div>
    ),
    { width: 32, height: 32 }
  );
}
