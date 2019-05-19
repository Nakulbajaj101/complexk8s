import React from 'react';
import logo from './logo.svg';
import './App.css';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';


function App() {
  return (
    <Router>
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />

        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
      <h1> Welcome to Fib Calculator</h1>
      <Link to="/">Home</Link>
      <div></div>
      <Link to="/otherpage">OtherPage</Link>
      <div>
      <Route exact path = "/" component = {Fib}></Route>
      <Route path = "/otherpage" component = {OtherPage}></Route>
      </div>
    </div>
    </Router>
  );
}

export default App;
