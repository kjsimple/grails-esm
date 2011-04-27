package com.gydoc.esm.domain

class ExpenseReport {

    String title
    double total
    int status
    Date dateCreated
    Date dateUpdate
    Purpose purpose
    EsmUser owner
    
    static constraints = {
        title(blank: false, nullable: true)
        total(nullable: true)
        status()
        purpose()
        owner(nullable: true)
    }
    
}
