import "bootstrap";
import { initFlatpickr } from "../plugins/init_flatpickr";
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

initMapbox();

initFlatpickr();
