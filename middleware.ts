import { middleware as authMiddleware } from "@devventogroup/auth-middleware";

export const config = {
  matcher: ["/((?!_next|login|favicon.ico|logos|images|fonts|api).*)"],
};

export const middleware = authMiddleware;
