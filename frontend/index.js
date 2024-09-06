async function trigger() {
    const apiUrl = "https://ezvm5id6yqptwzehm5gmghhnem0trjen.lambda-url.us-east-1.on.aws/"; // Replace with your API Gateway URL

    let response =  fetch(apiUrl)

    .then(data => {
        // Assuming the 'body' is a property in the JSON response
        console.log(data.body); // Access and process the body
        document.querySelector('.counter-number').innerHTML = data.body;
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




