import React from 'react';
import { ConversationalForm } from 'conversational-form';

export default class MyForm extends React.Component {
  constructor(props) {
    super(props);
    this.formFields = [
      {
        'tag': 'input',
        'type': 'text',
        'name': 'nickname',
        'cf-questions': 'Welcome to F00tprint, this app will ask you for some questions and mint an NFT based on your answers\nWhat is your Nickname?'
      },
      {
        'tag': 'input',
        'type': 'text',
        'name': 'wallet',
        'cf-questions': 'What is your Polygon wallet address?'
      }
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
    this.cf.addRobotChatResponse("Done!!!\nPlease check OpenSea for your nft!")
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