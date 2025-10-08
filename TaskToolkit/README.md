# HCM Campaign Tracking Toolkit

A modern React-based project management solution for tracking HCM campaigns with Jira integration.

![React](https://img.shields.io/badge/React-19.1.1-blue)
![Material-UI](https://img.shields.io/badge/Material--UI-7.3.4-0081CB)
![Vite](https://img.shields.io/badge/Vite-7.1.7-646CFF)
![License](https://img.shields.io/badge/License-MIT-green)

## 🎯 Overview

The HCM Campaign Tracking Toolkit is a comprehensive web application designed to streamline campaign management and task tracking by integrating with Jira APIs. Built with modern web technologies, it provides real-time insights, analytics, and seamless project oversight for HCM (Health Campaign Management) initiatives.

## ✨ Features

### 📊 Dashboard & Analytics
- Real-time campaign status visualization
- Interactive pie charts for status, assignee, and priority distribution
- Custom Riskometer component for project health assessment
- Advanced filtering and search capabilities with debounced input

### 🔗 Jira Integration
- Direct integration with Jira REST APIs
- Real-time data synchronization
- Clickable ticket keys that open Jira issues in new tabs
- Support for custom fields and epic-based organization
- Proxy configuration for secure API access

### 🎨 Modern UI/UX
- Material-UI components with custom Digit branding
- Responsive design optimized for all device sizes
- Clean sidebar navigation with icon-only design
- Professional white AppBar with Digit logo integration
- Custom favicon with Digit branding

### 🔐 Authentication
- Google OAuth integration with @react-oauth/google
- GitHub authentication support
- Secure user session management with React Context
- Protected routes with authentication guards

## 🛠️ Technology Stack

### Frontend
- **React 19.1.1** - Latest React with modern hooks and features
- **Material-UI 7.3.4** - Google's Material Design component library
- **React Router 7.9.3** - Client-side routing and navigation
- **Recharts 3.2.1** - Beautiful and responsive data visualization
- **Axios 1.12.2** - Promise-based HTTP client for API calls

### Development Tools
- **Vite 7.1.7** - Fast build tool and development server
- **ESLint 9.36.0** - Code quality and consistency enforcement
- **Node.js Proxy** - Backend API proxy configuration for CORS handling

### APIs & Integration
- **Jira REST API** - Direct integration for project and issue data
- **Google OAuth API** - Secure user authentication
- **GitHub OAuth** - Alternative authentication method

## 🚀 Getting Started

### Prerequisites
- Node.js 20.19+ or 22.12+ (required by Vite)
- npm or yarn package manager
- Access to a Jira instance with REST API enabled

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/jagankumar-egov/egov-rnd.git
   cd egov-rnd/TaskToolkit
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   yarn install
   ```

3. **Environment Configuration**
   Create a `.env` file in the root directory:
   ```env
   VITE_GOOGLE_CLIENT_ID=your_google_client_id
   VITE_GITHUB_CLIENT_ID=your_github_client_id
   VITE_JIRA_XSRF_TOKEN=your_jira_xsrf_token
   ```

4. **Start the development server**
   ```bash
   npm run dev
   # or
   yarn dev
   ```

5. **Open your browser**
   Navigate to `http://localhost:5173`

### Build for Production

```bash
npm run build
# or
yarn build
```

## 📁 Project Structure

```
src/
├── components/
│   ├── AppBar.jsx           # Navigation header with user info
│   ├── Sidebar.jsx          # Left navigation panel
│   ├── Layout.jsx           # Main layout wrapper
│   ├── CampaignDetails.jsx  # Campaign listing table with filters
│   ├── Riskometer.jsx       # Risk assessment widget
│   └── ProtectedRoute.jsx   # Authentication route guard
├── screens/
│   ├── Login.jsx            # Authentication page
│   ├── HelloWorld.jsx       # Dashboard home page
│   └── CampaignDetailPage.jsx # Individual campaign detailed view
├── services/
│   └── jiraService.js       # Jira API integration layer
├── context/
│   └── AuthContext.jsx     # Global authentication state management
├── theme/
│   └── index.js             # Material-UI theme configuration
└── App.jsx                  # Main application component
```

## 🔧 Configuration

### Vite Proxy Setup
The application uses Vite's proxy feature to handle CORS issues with Jira API:

```javascript
// vite.config.js
server: {
  proxy: {
    "/api/jira": {
      target: "https://digit-discuss.atlassian.net/rest/api/3",
      changeOrigin: true,
      rewrite: (path) => path.replace(/^\/api\/jira/, ""),
    },
  },
}
```

### Authentication Setup
1. **Google OAuth**: Create credentials at [Google Cloud Console](https://console.cloud.google.com/)
2. **GitHub OAuth**: Create an app at [GitHub Developer Settings](https://github.com/settings/developers)
3. Add authorized redirect URIs for your domain

## 📊 Features in Detail

### Campaign Management
- **List View**: Comprehensive table with sorting and filtering
- **Detail View**: Individual campaign analytics with pie charts
- **Real-time Updates**: Live data synchronization with Jira
- **Export Options**: Data visualization and reporting

### Analytics Dashboard
- **Status Distribution**: Visual breakdown of campaign statuses
- **Assignee Workload**: Team member responsibility tracking
- **Priority Analysis**: Critical task identification
- **Risk Assessment**: Project health monitoring

### User Experience
- **Responsive Design**: Mobile-first approach with breakpoints
- **Loading States**: Smooth user experience with progress indicators
- **Error Handling**: Graceful error boundaries and user feedback
- **Accessibility**: WCAG compliant design patterns

## 🚀 Deployment

### GitHub Pages
The application is configured for deployment on GitHub Pages:

1. **Automatic Deployment**: Push to main branch triggers GitHub Actions
2. **SPA Support**: 404.html handles client-side routing
3. **Environment Variables**: Configured in repository secrets
4. **Build Optimization**: Production-ready bundling with Vite

### Manual Deployment
```bash
npm run build
# Deploy the dist/ folder to your hosting provider
```

## 🤖 AI-Powered Development

This project was developed with assistance from AI tools:
- **Claude AI**: Primary development assistant for React components and architecture
- **Gemini AI**: Code optimization, review, and best practices
- **AI-Driven Design**: Component structure and Material-UI integration

## 🔮 Roadmap

### Upcoming Features
- [ ] Real-time notifications with WebSocket integration
- [ ] Advanced analytics with burndown charts
- [ ] Team collaboration features (comments, mentions)
- [ ] PDF/Excel export functionality
- [ ] Progressive Web App (PWA) capabilities
- [ ] Mobile application with React Native

### Technical Improvements
- [ ] GraphQL API integration
- [ ] Advanced caching with React Query
- [ ] Microservice architecture
- [ ] Docker containerization
- [ ] Unit and integration testing with Jest

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support and questions:
- Create an issue on GitHub
- Contact the development team
- Check the [documentation](./PRESENTATION.md) for detailed information

---

## 🙏 Acknowledgments

- **Digit Platform** for branding and design system
- **Material-UI Team** for the excellent component library
- **Jira/Atlassian** for robust API integration
- **React Community** for ongoing support and inspiration
- **AI Assistants** (Claude & Gemini) for development acceleration

---

*Built with ❤️ using React, Material-UI, and AI assistance*