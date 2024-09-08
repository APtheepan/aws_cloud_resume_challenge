
const counter = document.querySelector(".counter-number");
async function updateCounter() {
    const apiUrl  = "https://fdqwfxmyvu6ynmngvarzsiadpe0cultb.lambda-url.us-east-1.on.aws/"
    let response = await fetch(apiUrl);
    let data = await response.json();
    counter.innerHTML = `👀 Views: ${data}`;
}
updateCounter();


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
