const counter = document.querySelector(".counter-number");
async function updateCounter() {
    let response = await fetch(
        "https://5wxcakkikpts6jbvebmfgj7oui0xixkt.lambda-url.us-east-1.on.aws/"
    );
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


