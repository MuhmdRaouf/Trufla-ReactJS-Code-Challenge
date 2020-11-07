import React from 'react';
import  MaterialUICard from '@material-ui/core/Card';
import { makeStyles } from '@material-ui/core/styles';
import CardContent from '@material-ui/core/CardContent';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
  root: {
    minWidth: 250,
    maxWidth: 250,
    minHeight: 250,
    maxHeight: 250,
    margin: 10,
  },
  title: {
    fontSize: 14,
  },
  pos: {
    marginBottom: 12,
  },
});

export const Card = ({ card_data }) => {
  const { department_name, name, price, promotion, discount, is_active } = card_data;
  const classes = useStyles();
  return (
    <MaterialUICard className={classes.root}>
      <CardContent>
        <Typography className={classes.title} color="textSecondary" gutterBottom>
          { department_name }
        </Typography>
        <Typography variant="h5" component="h2">
          { name }
        </Typography>
        <Typography className={classes.pos} color="textSecondary">
          Prince: { price }
        </Typography>
        {
          is_active &&
          <Typography variant="body2" component="p">
            Promotion: { promotion }
            <br />
            Discount: { discount }
          </Typography>
        }
      </CardContent>
    </MaterialUICard>
  );
}
