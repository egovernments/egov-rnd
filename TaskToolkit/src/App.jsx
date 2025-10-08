import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import { GoogleOAuthProvider } from '@react-oauth/google'
import { AuthProvider } from './context/AuthContext'
import './App.css'
import HelloWorld from './screens/HelloWorld'
import Login from './screens/Login'
import ProtectedRoute from './components/ProtectedRoute'
import JiraTest from './components/JiraTest'

const GOOGLE_CLIENT_ID = import.meta.env.VITE_GOOGLE_CLIENT_ID

function App() {
  return (
    <GoogleOAuthProvider clientId={GOOGLE_CLIENT_ID}>
      <AuthProvider>
        <Router>
          <Routes>
            <Route path="/login" element={<Login />} />
            <Route path="/jira-test" element={<JiraTest />} />
            <Route
              path="/"
              element={
                <ProtectedRoute>
                  <HelloWorld />
                </ProtectedRoute>
              }
            />
          </Routes>
        </Router>
      </AuthProvider>
    </GoogleOAuthProvider>
  )
}

export default App
