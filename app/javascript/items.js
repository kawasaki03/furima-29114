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

if (document.URL.match(/new/) || document.URL.match(/edit/)){
document.addEventListener('DOMContentLoaded', function(){
  const imagePreview = document.getElementById("image-preview");

  const createImageHtml = (blob) =>{
    
    const imageElement = document.createElement('div');
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src',blob)
    imageElement.setAttribute("class","image")
    
    imageElement.appendChild(blobImage);
    imagePreview.appendChild(imageElement);
  };


document.getElementById("item-image").addEventListener('change', function(e){
  const imageContent = document.querySelector('img');
  if (imageContent){
    imageContent.remove();
  }
       
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHtml(blob);
  
   });
  });
  };



window.addEventListener("load",item)


