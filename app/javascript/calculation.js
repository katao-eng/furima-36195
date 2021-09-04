function calculation () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const fee = itemPrice.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${itemPrice.value - fee}`;
  });
};

window.addEventListener('load', calculation);