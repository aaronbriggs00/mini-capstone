axios.get('http://localhost:3000/api/products').then(function (response) {
  var products = response.data;
  console.log(products);
  products.forEach(product => {
    console.log(product);
  });
});

console.log(products);