

async function updateCounter() {
    const counter = document.querySelector(".counter-number");
    const apiUrl  = "https://fdqwfxmyvu6ynmngvarzsiadpe0cultb.lambda-url.us-east-1.on.aws/"
    let response = await fetch(apiUrl);
    if (!response.ok) {
        console.error('Error fetching the data:', response.statusText);
        return;
    }
    let data = await response.json();
    counter.innerHTML = data.counter;
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
