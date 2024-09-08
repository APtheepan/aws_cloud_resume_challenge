

async function trigger() { 
    const apiUrl  = "https://ppdre6h5gkzqqmonubgbzhi24i0qvfwt.lambda-url.us-east-1.on.aws/"
    let response =  fetch(apiUrl)
}

const counter = document.querySelector(".counter-number");
async function getApi() {
    const apiUrl  = "https://ppdre6h5gkzqqmonubgbzhi24i0qvfwt.lambda-url.us-east-1.on.aws/"
    let response = await fetch(apiUrl);
    let data = await response.json();
    counter.innerHTML = `Views: ${data}`;
 
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




