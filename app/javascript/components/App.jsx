import React from "react";
import { ThemeProvider as MaterialThemeProvider } from '@material-ui/core/styles';
import CssBaseline from '@material-ui/core/CssBaseline';

import { Header } from "./Header";
import Routes from "../routes/Index";
import { useTheme } from "../hooks/theme";
import { ThemeProvider } from "../contexts/theme";

export const App = (props) => {
  const { theme, themeToggle } = useTheme()

  return (
    <ThemeProvider value={{theme, themeToggle}}>
      <MaterialThemeProvider theme={theme}>
        <CssBaseline />
        <Header/>
        {Routes}
      </MaterialThemeProvider>
    </ThemeProvider>
  )
};
