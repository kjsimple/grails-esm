package com.gydoc.esm.domain

class PurchaseDetail {

    PurchaseMaster purchaseMaster
    Product product
    double quantity
    double unitPrice
    double total

    static constraints = {
        product(blank: false, nullable: false)
        quantity(blank: false, nullable: false)
        unitPrice(blank: false, nullable: false)
        total(blank: false, nullable: false)
    }

}
