import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import { GoogleOAuthProvider } from '@react-oauth/google'
import { ThemeProvider } from '@mui/material/styles'
import CssBaseline from '@mui/material/CssBaseline'
import { AuthProvider } from './context/AuthContext'
import theme from './theme'
import './App.css'
import HelloWorld from './screens/HelloWorld'
import Login from './screens/Login'
import ProtectedRoute from './components/ProtectedRoute'
import CampaignDetailsScreen from './screens/CampaignDetailsScreen'
import CampaignDetailPage from './screens/CampaignDetailPage'
import JiraTestScreen from './screens/JiraTestScreen'

const GOOGLE_CLIENT_ID = import.meta.env.VITE_GOOGLE_CLIENT_ID
const basename = import.meta.env.DEV ? '/' : '/egov-rnd/'

function App() {
  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <GoogleOAuthProvider clientId={GOOGLE_CLIENT_ID}>
        <AuthProvider>
          <Router basename={basename}>
            <Routes>
              <Route path="/login" element={<Login />} />
              <Route
                path="/"
                element={
                  <ProtectedRoute>
                    <HelloWorld />
                  </ProtectedRoute>
                }
              />
              <Route
                path="/campaign-details"
                element={
                  <ProtectedRoute>
                    <CampaignDetailsScreen />
                  </ProtectedRoute>
                }
              />
              <Route
                path="/campaign/:id"
                element={
                  <ProtectedRoute>
                    <CampaignDetailPage />
                  </ProtectedRoute>
                }
              />
              <Route
                path="/jira-test"
                element={
                  <ProtectedRoute>
                    <JiraTestScreen />
                  </ProtectedRoute>
                }
              />
            </Routes>
          </Router>
        </AuthProvider>
      </GoogleOAuthProvider>
    </ThemeProvider>
  )
}

export default App
