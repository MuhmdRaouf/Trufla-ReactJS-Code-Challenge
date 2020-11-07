import { useState } from 'react';
import { createMuiTheme } from '@material-ui/core/styles';


export const useTheme = () => {
  const lightTheme = createMuiTheme({ palette: { type: 'light' }});
  const darkTheme = createMuiTheme({ palette: { type: 'dark' }});
  const [theme, setTheme] = useState(darkTheme);
  const [themeSwitcher, setThemeSwitcher] = useState(true);

  const themeToggle = () => {
    const nextTheme = themeSwitcher ? lightTheme : darkTheme;
    setThemeSwitcher(!themeSwitcher)
    setTheme(nextTheme);
  };

  return { theme, themeToggle };
}