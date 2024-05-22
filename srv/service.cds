using { s4_product } from './external/s4_product.cds';

using { storeInventory } from '../db/schema.cds';

@path : '/service/storeInventory'
service storeInventorySrv
{
    @odata.draft.enabled
    entity Product as
        projection on storeInventory.Product;

    @odata.draft.enabled
    entity Warehouse as
        projection on storeInventory.Warehouse;

    @odata.draft.enabled
    entity Store as
        projection on storeInventory.Store;

    entity A_Product as
        projection on s4_product.A_Product;
}

annotate storeInventorySrv with @requires :
[
    'authenticated-user'
];
