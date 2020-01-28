// Custom JS goes here

// GLOBALS
const prevPath = document.referrer.split("/").slice(-1)[0];
const goBackButton = document.getElementById('btn-gbk');
const deleteButton = document.getElementById('btn-dlt');
const PID = window.location.href.split("/").slice(-1)[0];

// FUNCTIONS
function sendData( data ) {
  const XHR = new XMLHttpRequest();

  let urlEncodedData = "",
      urlEncodedDataPairs = [],
      name;

  // Turn the data object into an array of URL-encoded key/value pairs.
  for( name in data ) {
    console.log(name);
    urlEncodedDataPairs.push( encodeURIComponent( name ) + '=' + encodeURIComponent( data[name] ) );
  }

  // Combine the pairs into a single string and replace all %-encoded spaces to
  // the '+' character; matches the behaviour of browser form submissions.
  urlEncodedData = urlEncodedDataPairs.join( '&' ).replace( /%20/g, '+' );

  // Define what happens on successful data submission
  XHR.addEventListener( 'load', function(event) {
    // Redirect
    window.location.href = window.location.origin + event.target.response;
  } );

  // Define what happens in case of error
  XHR.addEventListener( 'error', function(event) {
    console.log( 'Oops! Something went wrong.' );
  } );

  // Set up our request
  XHR.open( 'DELETE', `/projects/${PID}/delete` );

  // Add the required HTTP header for form data POST requests
  XHR.setRequestHeader( 'Content-Type', 'application/x-www-form-urlencoded' );

  // Finally, send our data.
  XHR.send( urlEncodedData );
}

// EVENT LISTENERS
if(deleteButton){
  deleteButton.addEventListener( 'click', function(event) {
    sendData();
  } );
}

if (goBackButton){
  goBackButton.addEventListener( 'click', function(event) {
    window.location.href = `${window.location.origin}/${prevPath}`;
  } );
}
