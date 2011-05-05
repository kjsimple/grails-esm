package com.gydoc.esm.domain

class DeliveryMaster {

    int status // 1 sale 2 return
    Date deliveryDate
    Customer customer
    SalesMan salesMan
    String deliveryAddress
    double totalPrice

    static constraints = {
        customer()
        salesMan()
        totalPrice(blank: false, nullable: false)
        deliveryAddress()
        deliveryDate()
    }
}
