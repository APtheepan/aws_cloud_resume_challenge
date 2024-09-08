
var apiUrl = "https://ezvm5id6yqptwzehm5gmghhnem0trjen.lambda-url.us-east-1.on.aws/"; // Replace with your API Gateway URL

async function trigger() { 
    let response =  fetch(apiUrl)
}

const counter = document.querySelector(".counter-number");
async function getApi() {
    let response = await fetch(apiUrl);
    let data = await response.json();
    counter.innerHTML = `👀 Views: ${data}`;
 
}

trigger();
getApi();

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




