import React from 'react';
import { Grid } from "@material-ui/core";
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import IconButton from '@material-ui/core/IconButton';
import Brightness4Icon from '@material-ui/icons/Brightness4';

import { useThemeContext } from "../contexts/theme";

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1
  },
}));

export const Header = ()  => {
  const classes = useStyles();
  const { themeToggle } = useThemeContext();

  return (
    <Grid className={classes.root}>
      <AppBar position="static">
        <Toolbar>
          <Typography variant="h6" className={classes.title}>
            Trufla ReactJS Code Challenge
          </Typography>
            <IconButton
              aria-label="account of current user"
              aria-controls="menu-appbar"
              aria-haspopup="true"
              onClick={themeToggle}
              color="inherit"
            >
              <Brightness4Icon />
            </IconButton>
        </Toolbar>
      </AppBar>
    </Grid>
  );
}
