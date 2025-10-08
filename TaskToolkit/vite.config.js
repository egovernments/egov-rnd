import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vite.dev/config/
export default defineConfig(({ command }) => {
  return {
    plugins: [react()],
    base: command === 'serve' ? '/' : '/egov-rnd/',
    server: {
      proxy: {
        "/api/jira": {
          target: "https://digit-discuss.atlassian.net/rest/api/3",
          changeOrigin: true,
          rewrite: (path) => path.replace(/^\/api\/jira/, ""),
          secure: false,
          configure: (proxy, options) => {
            proxy.on("proxyReq", (proxyReq, req, res) => {
              const token = process.env.VITE_JIRA_XSRF_TOKEN;
              if (token) {
                proxyReq.setHeader("Cookie", `atlassian.xsrf.token=${token}`);
              }
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
