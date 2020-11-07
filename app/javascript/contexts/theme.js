import React, { useContext } from "react";

const ThemeContext = React.createContext(null);

export const useThemeContext = () => {
  return useContext(ThemeContext);
}

export const ThemeProvider = ({ children, value }) => (
  <ThemeContext.Provider value={value}>{children}</ThemeContext.Provider>
)
