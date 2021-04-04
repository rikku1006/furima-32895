window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    taxPrice.innerHTML = Math.floor(inputValue / 10);
    profit.innerHTML = Math.floor(inputValue - taxPrice.innerHTML);
  })
});
