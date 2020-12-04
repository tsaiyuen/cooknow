const muuri = () => {
  const grid = new Muuri('.grid', {dragEnabled: true});
  //document.querySelector('dropdown-item')
  document.getElementById('searchinput').addEventListener('change', (event) => {
    grid.filter(`.${event.target.value}`);
  });

  //document.querySelector('.dropdown-menu').addEventListener('click', (event) => {
  //  grid.filter(`.${event.target.value}`);
  //});

 // $(".dropdown-menu").click(function(){
  //var selText = $(this).text();
  //$(this).parents('.form-group').find('button[data-toggle="dropdown"]').html(selText+' <span class="caret"></span>');
//});
}
//const filterField = document.querySelector('.grid-control-field.filter-field');
//filterField.addEventListener('change', filter);

export { muuri };

//HTML: testinput, eventlistener, downcase, dropdown
