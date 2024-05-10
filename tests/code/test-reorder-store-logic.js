/**
 * Given a running CAP service, the unit test should be able to get passed.
 *
 * @param {Function} GET - The `axios` function to send a GET request
 * @param {Function} POST - The `axios` function to send a POST request
 * @param {Function} PATCH - The `axios` function to send a PATCH request
 * @param {Function} DELETE - The `axios` function to send a DELETE request
 * @param {Function} expect - The `chai` function to assert the response
 */
module.exports = async function(GET, POST, PATCH, DELETE, expect) {
  // Positive test case
  try {
    // Create a new draft
    let response = await POST('/service/storeInventory/Store', {
      productID: 'P001',
      productName: 'Product 1',
      shelfID: 'S001',
      stock: 100,
      leadTime: 2,
      reorderLevel: 50,
      sales: 50,
      materialNumber: 'M001'
    });
    expect([200, 201]).to.include(response.status);
    let { ID } = response.data;

    // Activate the draft
    response = await POST(`/service/storeInventory/Store(ID=${ID},IsActiveEntity=false)/storeInventorySrv.draftActivate`);
    expect([200, 201]).to.include(response.status);

    // Read the entity
    response = await GET(`/service/storeInventory/Store(ID=${ID},IsActiveEntity=true)`);
    expect(response.status).to.equal(200);
    expect(response.data.stockLevel).to.exist;
  } catch (error) {
    console.error(error);
    throw error;
  }

  // Negative test case
  try {
    // Create a new draft with missing mandatory field
    let response = await POST('/service/storeInventory/Store', {
      productID: 'P002',
      productName: 'Product 2',
      shelfID: 'S002',
      stock: 100,
      leadTime: 2,
      reorderLevel: 50,
      sales: 50
      // materialNumber is missing
    });
    expect([200, 201]).to.include(response.status);
    let { ID } = response.data;

    // Try to activate the draft
    response = await POST(`/service/storeInventory/Store(ID=${ID},IsActiveEntity=false)/storeInventorySrv.draftActivate`);
    expect(response.status).to.equal(400);
    expect(response.data.error.message).to.equal('Material number is mandatory.');
  } catch (error) {
    console.error(error);
    throw error;
  }
};