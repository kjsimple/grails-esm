package com.gydoc.esm.domain

class EsmRole {

    String roleName
    String description

    static constraints = {
        roleName(blank: false, unique: true)
        description(maxSize: 1000)
    }

}
