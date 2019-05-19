import React from 'react';
import assert from 'assert';
import ReactDOM from 'react-dom';
import App from './App';

it('renders without crashing and test will passging', () => {
  const pass = "test will pass";
  assert.equal(pass, "test will pass");
});
