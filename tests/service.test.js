const test_reorder_store_logic = require('./code/test-reorder-store-logic');
const cds = require('@sap/cds/lib');
const {
  GET,
  POST,
  PATCH,
  DELETE,
  expect
} = cds.test(__dirname + '../../', '--with-mocks');
cds.env.requires.auth = {
  kind: "dummy"
};
describe('Service Testing', () => {
  it('test reorder-store-logic', async () => {
    await test_reorder_store_logic(GET, POST, PATCH, DELETE, expect);
  });
});