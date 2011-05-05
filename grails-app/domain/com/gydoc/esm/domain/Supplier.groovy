package com.gydoc.esm.domain

class Supplier {

    String simpleName
    String fullName
    String owner
    String title
    String telephone
    String mobilePhone
    String fax
    String companyAddress
    String factoryAddress
    Date lastPurchaseDate
    ContactMan contactMan

    static constraints = {
        simpleName(blank: false, nullable: false, maxSize: 20)
        fullName(blank: true, nullable: true, maxSize: 60)
        owner(blank: true, nullable: true, maxSize: 30)
        title(blank: true, nullable: true, maxSize: 30)
        telephone(blank: true, nullable: true, maxSize: 20)
        mobilePhone(blank: true, nullable: true, maxSize: 20)
        fax(blank: true, nullable: true, maxSize: 20)
        companyAddress(blank: true, nullable: true, maxSize: 100)
        factoryAddress(blank: true, nullable: true, maxSize: 100)
        lastPurchaseDate(blank: true, nullable: true)
    }

}
