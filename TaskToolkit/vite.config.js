import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      '/api/jira': {
        target: 'https://digit-discuss.atlassian.net/rest/api/3',
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api\/jira/, ''),
        secure: false,
        configure: (proxy, options) => {
          proxy.on('proxyReq', (proxyReq, req, res) => {
            proxyReq.setHeader('Cookie', 'atlassian.xsrf.token=204be06affa98d270393ad5db5f75f39a6445e34_lin');
          });
        }
      }
    }
  }
})
