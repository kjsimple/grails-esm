package com.gydoc.esm.domain

class Product {

    String name
    double safeStock
    Date lastPurchaseDate
    Date lastDeliveryDate
    double quantity
    double suggestBuyPrice
    double suggestSalePrice

    static constraints = {
        name(blank: false, nullable: false, maxSize: 200)
        safeStock(blank: false, nullable: false, default: 0)
        lastPurchaseDate(blank: true, nullable: true)
        lastDeliveryDate(blank: true, nullable: true)
        quantity(blank: false, nullable: false, default: 0)
        suggestBuyPrice(blank: true, nullable: true)
        suggestSalePrice(blank: true, nullable: true)
    }
}
