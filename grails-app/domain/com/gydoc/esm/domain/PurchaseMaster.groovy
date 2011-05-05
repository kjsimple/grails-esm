package com.gydoc.esm.domain

class PurchaseMaster {

    Date purchaseDate
    //supplier
    int status  //1 purchase 2 return to supplier
    double total

    static constraints = {
        status()
        total(blank: false, nullable: false)
        purchaseDate()
    }

}
