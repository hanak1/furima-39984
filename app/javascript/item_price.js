window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputvalue = priceInput.value;
    console.log(inputvalue);
    
    const addTaxDom = document.getElementById("add-tax-price");
    const salesTax = Math.floor(inputvalue * 0.1);
    addTaxDom.innerHTML = salesTax;

    const profitDom = document.getElementById("profit");
    const profit = Math.floor(inputvalue - salesTax);
    profitDom.innerHTML = profit;
  });
});