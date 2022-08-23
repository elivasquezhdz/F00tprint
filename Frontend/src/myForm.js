import React from 'react';
import { ConversationalForm } from 'conversational-form';

export default class MyForm extends React.Component {
  constructor(props) {
    super(props);
    this.formFields = [
      {
        'tag': 'input',
        'type': 'text',
        'name': 'wallet',
        'cf-questions': 'Welcome to F00tprint, this app will ask you for some questions and mint an NFT based on your answers\nEnter your Nickname or your Polygon wallet address?'
      },
      {
        'tag': 'input',
        'type': 'number',
        'name': 'cars',
        'cf-questions': 'How many cars do you use?'
      }, // 2 tons per car
      {
        'tag': 'input',
        'type': 'number',
        'name': 'shortflights',
        'cf-questions': 'How many short flights do you take in a year?'
      },//1 tons per flight
      {
        'tag': 'input',
        'type': 'number',
        'name': 'longflights',
        'cf-questions': 'How many long flights do you take each year?'
      },//2.5 tons per flight


      
    ];
    
    this.submitCallback = this.submitCallback.bind(this);
  }
  
  componentDidMount() {
    this.cf = ConversationalForm.startTheConversation({
      options: {
        submitCallback: this.submitCallback,
        preventAutoFocus: true,
        // loadExternalStyleSheet: false
      },
      tags: this.formFields
    });
    this.elem.appendChild(this.cf.el);
  }
  
  submitCallback() {
    var formDataSerialized = this.cf.getFormData(true);
    console.log("Formdata, obj:", formDataSerialized);
    this.cf.addRobotChatResponse("Done!!!\nPlease check OpenSea for your nft!\nLook for this account 0x8CaBc9F7DC3fd0828D7A76a6fe5465f6E56f4c72")
    const requestOptions = {
      method: 'POST',

      body: JSON.stringify(formDataSerialized)
  };
  fetch('http://localhost:5000/mint', requestOptions)
      .then(response => response.json())
      .then(data => this.setState({ postId: data.id }));


  }
  
  render() {
    return (
      <div>

        <div
          ref={ref => this.elem = ref}
        />
      </div>
    );
  }
}