import "bootstrap";
import 'select2/dist/css/select2.css';
import "select2-bootstrap-theme/dist/select2-bootstrap.css";

import { initReadUrl } from "../components/preview";
import { initSidebar } from "../components/initSidebar";
import { initDisplayValue } from '../components/init_order_component'
import { initLoad } from "../components/init_load";
import { initSelect2 } from '../components/init_select2';


initReadUrl();
initSidebar();
initDisplayValue();
initLoad();
initSelect2();
