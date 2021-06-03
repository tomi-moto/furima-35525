window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = tax.toLocaleString();
    const profit = Math.floor(inputValue - tax);
    addProfit.innerHTML = profit.toLocaleString();
  })
});


