import "bootstrap";

// Awesomplete CSS
import "awesomplete/awesomplete.css";
// Awesomplete JS
import "awesomplete";
import {awsompleteSettings} from "../components/awesomplete_settings.js";
awsompleteSettings();

import {carousel} from "../components/carousel.js";
carousel();

import { switchTabs } from "../components/profile_tabs.js";
switchTabs();

import { inPageUpdate } from "../components/update.js";
inPageUpdate();

import { slider } from "../components/slider.js"
slider();

import { fullPageSlide } from "../components/one_page_getting_started.js"
fullPageSlide();

import { autoSize } from "../components/chat.js";
autoSize();
