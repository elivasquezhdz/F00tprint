import React, { Component } from 'react';
import { render } from 'react-dom';
import MyForm from './myForm';
import './style.css';


class App extends Component {
  constructor() {
    super();
  }

  render() {

  
    return (
   
      <div>
        <h1>Welcome to F00tprint</h1>
        <MyForm />
      </div>
    );
  }
}

render(<App />, document.getElementById('root'));
