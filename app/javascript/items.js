function item(){
  const ItemPrice = document.getElementById("item-price");
  ItemPrice.addEventListener('input',()=>{
    const ItemFee = Math.floor(ItemPrice.value * 0.1);
    const ItemProfit = ItemPrice.value - ItemFee;
    const AddTaxPrice = document.getElementById('add-tax-price');
    const Profit = document.getElementById('profit');
    AddTaxPrice.textContent = ItemFee;
    Profit.textContent = ItemProfit;
  })
}

window.addEventListener("load",item)