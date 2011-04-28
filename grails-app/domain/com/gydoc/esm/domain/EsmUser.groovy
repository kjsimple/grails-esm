package com.gydoc.esm.domain

class EsmUser {

    String firstName
    String lastName
    String userID
    String password
    Date dateCreated
    Date dateUpdated

    static hasMany = [roles: EsmRole]

    static constraints = {
        userID(blank: false, nullable: false, unique: true)
        firstName(blank: false)
        lastName(blank: false)
        password(blank: false, password: true)
        dateCreated(nullable: true)
        dateUpdated(nullable: true)
    }

    def hashPassword() {
        password = password.encodeAsSHA()
    }

    def beforeInsert = {
        dateCreated = new Date()
        hashPassword()
    }

    def beforeUpdate = {
        dateUpdated = new Date()
        hashPassword()
    }
    
}
