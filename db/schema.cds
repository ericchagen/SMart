namespace storeInventory;

entity Product {
  key ID: UUID;
  number: String;
  name: String;
  category: String;
  description: String;
  price: Double;
  warehouse: Association to Warehouse;
}

entity Warehouse {
  key ID: UUID;
  name: String;
  location: String;
  materialNumber: String;
  materialName: String;
  supplier: String;
  baseUnit: String;
  availableStock: Integer;
  product: Association to Product;
}

entity Store {
  key ID: UUID;
  productID: String;
  productName: String;
  shelfID: String;
  stockLevel: String;
  stock: Integer;
  leadTime: Integer;
  reorderLevel: Integer;
  sales: Integer;
  materialNumber: Association to Warehouse;
}

