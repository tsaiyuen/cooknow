import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $(".js-example-theme-multiple").select2({
    theme: "classic"
  });
};

export { initSelect2 };
