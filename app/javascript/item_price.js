window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);
  const taxPrice = document.getElementById("add-tax-price");
  console.log(taxPrice);
  const profit = document.getElementById("profit");
  console.log(profit);
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    taxPrice.innerHTML = Math.floor(inputValue / 10);
    profit.innerHTML = Math.floor(inputValue - taxPrice.innerHTML);
  })
});
