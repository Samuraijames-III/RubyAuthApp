// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
console.log('application.js RUN');

window.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
  let allowSubmit = false;

  let registerForm = document.querySelector('#register_form');

  if (registerForm) {
    registerForm.addEventListener('submit', event2 => {
      if (allowSubmit) {
        console.log('allowing native form submit');
        return false;
      }
      event2.preventDefault();
      let url = document.querySelector('#action_url').value;
      let username = event2.target.querySelector('#username').value;
      console.log('Form submit handler', url, username);

      Rails.ajax({
        type: "GET", 
        url: url,
        data: `username=${username}`,
        success: function(response){
          console.log('success', response);
          let failedMessage = document.querySelector('#failed_validation_message');

          if (response.exists) {
            // Show the failed validation message
            failedMessage.textContent = `The user '${response.username}' already exists. Choose another, bitch.`;
            failedMessage.classList.remove('d-none');
            
            // Clear the form button's disabled state
            document.querySelector('#register_form input[type=submit]').removeAttribute('disabled');
            document.querySelector('#register_form input[type=submit]').removeAttribute('data-disable-with');
          } else {
            console.log(`User doesn't exist, creating user '${response.username}'`);
            failedMessage.classList.add('d-none');
            allowSubmit = true;
            document.querySelector('#register_form').submit();
          }
        },
        error: function(response){
          console.log('error', response);
        }
      });
    });
  }
});