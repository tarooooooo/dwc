// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import jQuery from "jquery"
import "popper.js"
import "bootstrap"
import "script.js"
import Swiper from 'swiper/swiper-bundle.js';  //この行を追記
import 'swiper/swiper-bundle.css';

import '@fortawesome/fontawesome-free/js/all';
import "../stylesheets/application" 

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// viewからjQueryを読み込めるようにするため追加
window.$ = window.jQuery = require('jquery');

import Raty from "raty.js"
window.raty = function(elem,opt) {
    let raty =  new Raty(elem,opt)
    raty.init();
    return raty;
}


global.$ = jQuery;
window.$ = jQuery;