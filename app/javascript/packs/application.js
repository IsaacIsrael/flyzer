import "bootstrap";
import 'select2/dist/css/select2.css';
import "select2-bootstrap-theme/dist/select2-bootstrap.css";
import "../plugins/flatpickr";

import { initReadUrl } from "../components/init_preview";
import { initSidebar } from "../components/init_sidebar";
import { initDisplayValue } from '../components/init_order_component'
import { initLoad } from "../components/init_load";
import { initSelect2 } from '../components/init_select2';
import { initSelect2Submit } from '../components/init_select2_submit';


initReadUrl();
initSidebar();
initDisplayValue();
initLoad();
initSelect2();
initSelect2Submit();
