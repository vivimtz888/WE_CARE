import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";
import "flatpickr/dist/themes/material_red.css";

const initFlatpickr = () => {
  const inputs = document.querySelectorAll(".flatpickr");

  inputs.forEach((input) => {
    flatpickr(input, {
      disable: JSON.parse(input.dataset.disabled),
      minDate: "today"
    });
  })
}

export { initFlatpickr };
