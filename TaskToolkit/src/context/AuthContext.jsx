import { createContext, useContext, useState, useEffect } from 'react';

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Check if user is already logged in (from localStorage)
    const storedUser = localStorage.getItem('user');
    if (storedUser) {
      setUser(JSON.parse(storedUser));
    }
    setLoading(false);
  }, []);

  const login = (credentialResponse) => {
    let userData;
    
    if (credentialResponse && credentialResponse.credential) {
      // Google OAuth login
      try {
        // Decode the JWT token to get user info
        const base64Url = credentialResponse.credential.split('.')[1];
        const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
        const jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
          return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));
        
        const decoded = JSON.parse(jsonPayload);
        userData = {
          name: decoded.name,
          email: decoded.email,
          picture: decoded.picture,
          credential: credentialResponse.credential
        };
      } catch (error) {
        console.error('Error decoding Google credential:', error);
        userData = {
          name: 'Google User',
          email: 'google@example.com',
          credential: credentialResponse.credential
        };
      }
    } else {
      // Demo login
      userData = {
        name: 'Demo User',
        email: 'demo@example.com'
      };
    }
    
    setUser(userData);
    localStorage.setItem('user', JSON.stringify(userData));
  };

  const logout = () => {
    setUser(null);
    localStorage.removeItem('user');
  };

  return (
    <AuthContext.Provider value={{ user, login, logout, loading }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};
