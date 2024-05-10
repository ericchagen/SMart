/**
 * 
 * @On(event = { "READ" }, entity = "inventoryManagementSrv.Store")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
  const tx = cds.transaction(request);
  const { Store } = cds.entities('storeInventory');
  
  // Fetch all stores
  const stores = await SELECT.from(Store);
  // Iterate over each store
  for (const store of stores) {
    // Calculate reorder level
    store.reorderLevel = store.leadTime * store.sales;
    // Determine stock level status
    if (store.reorderLevel > store.stock) {
      store.stockLevel = 'LOW';
    } else if (store.reorderLevel === store.stock) {
      store.stockLevel = 'AT RISK';
    } else if (store.reorderLevel < store.stock) {
      store.stockLevel = 'NORMAL';
    } else {
      store.stockLevel = 'UNDEFINED';
    }
// Look up the warehouse record that matches the material number
const [warehouse] = await tx.run(
  SELECT.from('storeInventory.Warehouse')
      .where({ ID: store.materialNumber_ID })
);
if (!warehouse) {
  request.reject(404, `Warehouse with material number ${store.materialNumber_ID} not found`);
  return;
}
// Look up the product record that matches the warehouse record
const [product] = await tx.run(
  SELECT.from('storeInventory.Product')
      .where({ ID: warehouse.product_ID })
);
if (!product) {
  request.reject(404, `Product with ID ${warehouse.product_ID} not found`);
  return;
}
    
    // Update the store with new reorder level and stock level status
    await UPDATE(Store)
      .set({ reorderLevel: store.reorderLevel, stockLevel: store.stockLevel, productID: product.number, productName: product.name})
      .where({ ID: store.ID });
  }
  return stores;
}
