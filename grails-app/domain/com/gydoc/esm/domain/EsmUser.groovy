package com.gydoc.esm.domain

class EsmUser {

    String firstName
    String lastName
    String userID
    String password
    def confirmPassword
    
    static constraints = {
        userID(blank: false, nullable: false, unique: true)
        firstName(blank: false)
        lastName(blank: false)
        password(blank: false, password: true)
        confirmPassword()
    }

    def beforeInsert = {
        password = password.encodeAsSHA()
    }
    
}
