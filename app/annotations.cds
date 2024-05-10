using { storeInventorySrv } from '../srv/service.cds';

annotate storeInventorySrv.Product with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products' };
annotate storeInventorySrv.Product with {
  warehouse @Common.ValueList: {
    CollectionPath: 'Warehouse',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: warehouse_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'location'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'materialNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'materialName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'supplier'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'baseUnit'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'availableStock'
      },
    ],
  }
};
annotate storeInventorySrv.Product with @UI.DataPoint #number: {
  Value: number,
  Title: 'Number',
};
annotate storeInventorySrv.Product with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate storeInventorySrv.Product with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate storeInventorySrv.Product with {
  number @title: 'Number';
  name @title: 'Name';
  category @title: 'Category';
  description @title: 'Description';
  price @title: 'Price'
};

annotate storeInventorySrv.Product with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: number },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: category },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Warehouse', Value: warehouse_ID }
];

annotate storeInventorySrv.Product with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: number },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: category },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Warehouse', Value: warehouse_ID }
  ]
};

annotate storeInventorySrv.Product with {
  warehouse @Common.Label: 'Warehouse'
};

annotate storeInventorySrv.Product with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#number' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate storeInventorySrv.Product with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate storeInventorySrv.Product with @UI.SelectionFields: [
  warehouse_ID
];

annotate storeInventorySrv.Warehouse with @UI.HeaderInfo: { TypeName: 'Warehouse', TypeNamePlural: 'Warehouses' };
annotate storeInventorySrv.Warehouse with {
  product @Common.ValueList: {
    CollectionPath: 'Product',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: product_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'number'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'category'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
    ],
  }
};
annotate storeInventorySrv.Warehouse with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate storeInventorySrv.Warehouse with @UI.DataPoint #location: {
  Value: location,
  Title: 'Location',
};
annotate storeInventorySrv.Warehouse with @UI.DataPoint #materialNumber: {
  Value: materialNumber,
  Title: 'Material Number',
};
annotate storeInventorySrv.Warehouse with {
  name @title: 'Name';
  location @title: 'Location';
  materialNumber @title: 'Material Number';
  materialName @title: 'Material Name';
  supplier @title: 'Supplier';
  baseUnit @title: 'Base Unit Information';
  availableStock @title: 'Available Stock'
};

annotate storeInventorySrv.Warehouse with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: location },
    { $Type: 'UI.DataField', Value: materialNumber },
    { $Type: 'UI.DataField', Value: materialName },
    { $Type: 'UI.DataField', Value: supplier },
    { $Type: 'UI.DataField', Value: baseUnit },
    { $Type: 'UI.DataField', Value: availableStock },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
];

annotate storeInventorySrv.Warehouse with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: location },
    { $Type: 'UI.DataField', Value: materialNumber },
    { $Type: 'UI.DataField', Value: materialName },
    { $Type: 'UI.DataField', Value: supplier },
    { $Type: 'UI.DataField', Value: baseUnit },
    { $Type: 'UI.DataField', Value: availableStock },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
  ]
};

annotate storeInventorySrv.Warehouse with {
  product @Common.Label: 'Product'
};

annotate storeInventorySrv.Warehouse with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#location' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#materialNumber' }
];

annotate storeInventorySrv.Warehouse with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate storeInventorySrv.Warehouse with @UI.SelectionFields: [
  product_ID
];

annotate storeInventorySrv.Store with @UI.HeaderInfo: { TypeName: 'Store', TypeNamePlural: 'Stores' };
annotate storeInventorySrv.Store with {
  materialNumber @Common.ValueList: {
    CollectionPath: 'Warehouse',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: materialNumber_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'location'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'materialNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'materialName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'supplier'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'baseUnit'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'availableStock'
      },
    ],
  }
};
annotate storeInventorySrv.Store with @UI.DataPoint #productID: {
  Value: productID,
  Title: 'Product ID',
};
annotate storeInventorySrv.Store with @UI.DataPoint #productName: {
  Value: productName,
  Title: 'Product Name',
};
annotate storeInventorySrv.Store with @UI.DataPoint #shelfID: {
  Value: shelfID,
  Title: 'Shelf ID',
};
annotate storeInventorySrv.Store with {
  productID @title: 'Product ID';
  productName @title: 'Product Name';
  shelfID @title: 'Shelf ID';
  stockLevel @title: 'Stock Level';
  stock @title: 'Stock';
  leadTime @title: 'Lead Time';
  reorderLevel @title: 'Reorder Level';
  sales @title: 'Sales'
};

annotate storeInventorySrv.Store with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: productID },
    { $Type: 'UI.DataField', Value: productName },
    { $Type: 'UI.DataField', Value: shelfID },
    { $Type: 'UI.DataField', Value: stockLevel },
    { $Type: 'UI.DataField', Value: stock },
    { $Type: 'UI.DataField', Value: leadTime },
    { $Type: 'UI.DataField', Value: reorderLevel },
    { $Type: 'UI.DataField', Value: sales },
    { $Type: 'UI.DataField', Label: 'Warehouse', Value: materialNumber_ID }
];

annotate storeInventorySrv.Store with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: productID },
    { $Type: 'UI.DataField', Value: productName },
    { $Type: 'UI.DataField', Value: shelfID },
    { $Type: 'UI.DataField', Value: stockLevel },
    { $Type: 'UI.DataField', Value: stock },
    { $Type: 'UI.DataField', Value: leadTime },
    { $Type: 'UI.DataField', Value: reorderLevel },
    { $Type: 'UI.DataField', Value: sales },
    { $Type: 'UI.DataField', Label: 'Warehouse', Value: materialNumber_ID }
  ]
};

annotate storeInventorySrv.Store with {
  materialNumber @Common.Label: 'Warehouse'
};

annotate storeInventorySrv.Store with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#productID' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#productName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#shelfID' }
];

annotate storeInventorySrv.Store with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate storeInventorySrv.Store with @UI.SelectionFields: [
  materialNumber_ID
];

