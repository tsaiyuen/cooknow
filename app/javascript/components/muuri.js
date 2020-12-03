const muuri = () => {
  const grid = new Muuri('.grid', {dragEnabled: true});
  //document.querySelector('dropdown-item')
  document.getElementById('testinput').addEventListener('change', (event) => {
    grid.filter(`.${event.target.value}`);
  });
}
//const filterField = document.querySelector('.grid-control-field.filter-field');
//filterField.addEventListener('change', filter);

export { muuri };

//HTML: testinput, eventlistener, downcase, dropdown
