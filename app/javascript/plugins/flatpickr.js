import flatpickr from "flatpickr";

const datePicker = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    minDate: "today",
    dateFormat: "Y-m-d H:i",
  });
};

export { datePicker };
