import "bootstrap";

// Awesomplete CSS
import "awesomplete/awesomplete.css"
// Awesomplete JS
import "awesomplete"
import {awsompleteSettings} from "../components/awesomplete_settings.js"
//awsompleteSettings();

import {carousel} from "../components/carousel.js";
carousel();
import { switchTabs } from "../components/profile_tabs.js";
switchTabs();
import { inPageUpdate } from "../components/update.js";
inPageUpdate();
