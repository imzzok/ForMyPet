/**
	조건별 상품조회
	type - F: 사료 / S:간식)
		
 */
function fncSearchProduct(category, property) {
	var f = document.getElementById('productForm');
	f.action = 'product.do';
    f.category.value = category;
    f.property.value = property;
    f.submit();
}
