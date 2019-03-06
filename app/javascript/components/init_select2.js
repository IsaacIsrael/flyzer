import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    openOnEnter: false,
    theme: "bootstrap"
  });
};

export { initSelect2 };
