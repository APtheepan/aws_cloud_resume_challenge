async function trigger() {
    const apiUrl = "https://ezvm5id6yqptwzehm5gmghhnem0trjen.lambda-url.us-east-1.on.aws/"; // Replace with your API Gateway URL

     fetch(apiUrl)
        .then(response => response.json()) // Parse the JSON from the response
        .then(data => {
        // Assuming 'body' is a property in the JSON response
            document.querySelector('.counter-number').innerHTML = data.body; // Display the 'body' in the HTML
     })
        .catch(error => {
             console.error('Error fetching data:', error);
            document.querySelector('.counter-number').innerHTML = 'Failed to load data'; // Show error message
        });

}
trigger();

var typed = new Typed('#typed', {
    strings: [
        'Cloud Engineering',
        'Telecommunications',
        'Integration Engineering',
        'DevOps Engineering'
    ],
    typeSpeed: 50,
    backSpeed: 50,
    loop: true
});




