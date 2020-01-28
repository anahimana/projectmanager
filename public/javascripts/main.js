// Custom JS goes here

// GLOBALS
const deleteButton = document.getElementById('btn-dlt')

// EVENT LISTENERS
deleteButton.addEventListener('click', function (event) {
  console.log(`${event.target.innerText} has been clicked!`);
});
