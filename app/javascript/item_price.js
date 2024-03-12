  window.addEventListener('turbo:load',() =>{
    
  // const payment = () => {

      const priceInput = document.getElementById("item-price");
      priceInput.addEventListener("input", () => {
        const inputValue = priceInput.value;

        const addTaxDom = document.getElementById("add-tax-price");
        addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

        const profitDom = document.getElementById("profit");
        profitDom.innerHTML = Math.floor(inputValue - Math.floor(priceInput.value*0.1 ));
      })
  });

// window.addEventListener('turbo:load',() =>{
//   const priceInput = document.getElementById("item-price");
//   const addTaxDom = document.getElementById("add-tax-price");
//   const profitDom = document.getElementById("profit");

//   priceInput.addEventListener("input", () => {
//     const inputValue = priceInput.value;
//     const tax = Math.floor(inputValue * 0.1);
//     const profit = Math.floor(inputValue - Math.floor(priceInput.value*0.1 ));

//     addTaxDom.innerHTML = tax();
//     profitDom.innerHTML = profit();
//     // addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
//     // profitDom.innerHTML = Math.floor(inputValue - Math.floor(priceInput.value*0.1 ));
//   })
// });