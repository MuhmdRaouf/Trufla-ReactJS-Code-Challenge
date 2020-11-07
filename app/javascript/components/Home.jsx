import React from "react";
import { Link } from "react-router-dom";

export const Home =  () => (
  <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
    <div className="jumbotron jumbotron-fluid bg-transparent">
      <h1 className="display-4">Trufla ReactJS Code Challenge</h1>
      <hr className="my-4" />
      <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
      <Link to="/dashboard" className="btn btn-primary btn-lg">
        Get Started
      </Link>
    </div>
  </div>
);