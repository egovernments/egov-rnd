import { defineConfig, loadEnv } from "vite";
import react from "@vitejs/plugin-react";

// https://vite.dev/config/
export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), "");

  return {
    plugins: [react()],
    server: {
      proxy: {
        "/api/jira": {
          target: "https://digit-discuss.atlassian.net/rest/api/3",
          changeOrigin: true,
          rewrite: (path) => path.replace(/^\/api\/jira/, ""),
          secure: false,
          configure: (proxy, options) => {
            proxy.on("proxyReq", (proxyReq, req, res) => {
              proxyReq.setHeader("Cookie", `atlassian.xsrf.token=${env.VITE_JIRA_XSRF_TOKEN}`);
            });
          },
        },
      },
    },
    build: {
      outDir: "dist",
      assetsDir: "assets",
    },
  };
});
