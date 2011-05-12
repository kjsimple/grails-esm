package com.gydoc.esm.domain

class EsmRole {

    String name
    String description
    static hasMany = [modules: Module]

    static constraints = {
        name(blank: false, unique: true)
        description(maxSize: 1000)
    }

}
