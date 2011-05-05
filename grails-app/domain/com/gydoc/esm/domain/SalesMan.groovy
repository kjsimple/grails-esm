package com.gydoc.esm.domain

class SalesMan {

    String name
    String contactAddress
    String email
    String telephone
    String mobilePhone

    static constraints = {
        name(blank: false, nullable: false, maxSize: 10)
        contactAddress(blank: true, nullable: true, maxSize: 200)
        email(blank: true, nullable: true, maxSize: 100)
        telephone(blank: true, nullable: true, maxSize: 20)
        mobilePhone(blank: true, nullable: true, maxSize: 20)
    }
}
