import { bank } from "../../declarations/bank"

window.addEventListener("load", async function() {
    //  
    const currentAmount = await bank.checkBalance();
    this.document.getElementById("value").innerText = Math.round(currentAmount*100)/100;

})

document.querySelector("form").addEventListener("submit", async function(event) {
    event.preventDefault();

    const button = event.target.querySelector("submit-btn");
    
    const inputAmount = document.getElementById("input-amount").value;
    const outputAmount = document.getElementById("withdrawal-amount").value;

    button.setAttribute("disabled", true);

    await bank.topUp(parseFloat(inputAmount));
    await bank.withDraw(parseFloat(outputAmount));

    document.getElementById("input-amount").value = "";
    document.getElementById("withdrawal-amount").value = "";
    const currentAmount = await bank.checkBalance();
    this.document.getElementById("value").innerText = Math.round(currentAmount*100)/100;
    button.removeAttribute("disabled");

})