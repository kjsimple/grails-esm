package com.gydoc.esm.domain

class Customer {

    String simpleName
    String fullName
    String owner
    String title
    String telephone
    String mobilePhone
    String fax
    SalesMan salesMan
    String customerAddress
    String deliveryAddress
    String invoiceAddress
    Date deliveryDate
    ContactMan contactMan

    static constraints = {
        simpleName(blank: false, nullable: false, maxSize: 20)
        fullName(blank: true, nullable: true, maxSize: 60)
        owner(blank: true, nullable: true, maxSize: 30)
        title(blank: true, nullable: true, maxSize: 30)
        telephone(blank: true, nullable: true, maxSize: 20)
        mobilePhone(blank: true, nullable: true, maxSize: 20)
        fax(blank: true, nullable: true, maxSize: 20)
        customerAddress(blank: true, nullable: true, maxSize: 100)
        deliveryAddress(blank: true, nullable: true, maxSize: 100)
        invoiceAddress(blank: true, nullable: true, maxSize: 100)
        deliveryDate(blank: true, nullable: true)
    }
    
}
