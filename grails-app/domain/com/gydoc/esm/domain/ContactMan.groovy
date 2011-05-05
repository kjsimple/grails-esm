package com.gydoc.esm.domain

class ContactMan {

    String chineseName
    String englishName
    String title
    String telephone
    String mobilePhone

    static constraints = {
        chineseName(blank: false, nullable: false, maxSize: 10)
        englishName(blank: true, nullable: true, maxSize: 60)
        title(blank: true, nullable: true, maxSize: 20)
        telephone(blank: true, nullable: true, maxSize: 20)
        mobilePhone(blank: true, nullable: true, maxSize: 20)
    }

}
