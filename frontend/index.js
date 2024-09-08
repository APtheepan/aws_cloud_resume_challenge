

function fetchAndUpdateCounter(url) {
    fetch(url)
        .then(response => response.json()) // Assuming the response is in JSON format
        .then(data => {
            const counterElement = document.querySelector('.counter-number');
            const number = data.number; // Assuming the number is available in 'number' field of the JSON
            counterElement.textContent = number;
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}

// Example: Call the function with your API URL
const apiUrl = 'https://fdqwfxmyvu6ynmngvarzsiadpe0cultb.lambda-url.us-east-1.on.aws/'; // Replace with your actual URL
fetchAndUpdateCounter(apiUrl);


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
