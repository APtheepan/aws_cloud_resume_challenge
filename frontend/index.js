const counter = document.querySelector(".counter-number");
async function updateCounter() {
    const response = await fetch(
        "https://5tqa3yotef2jjxdru653zowdie0qwhaw.lambda-url.us-east-1.on.aws/"
    );
    const data = await response.json();
    counter.innerHTML = `Views: ${data}`;
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



