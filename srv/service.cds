using { s4_product } from './external/s4_product.cds'; 
using { storeInventory } from '../db/schema.cds';

@path: '/service/storeInventory'
@requires: 'authenticated-user'
service storeInventorySrv {
  @odata.draft.enabled
  entity Product as projection on storeInventory.Product;
  @odata.draft.enabled
  entity Warehouse as projection on storeInventory.Warehouse;
  @odata.draft.enabled
  entity Store as projection on storeInventory.Store;
}