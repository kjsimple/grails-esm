package com.gydoc.esm.domain

class Module {

    String name
    String action
    Module parent
    static hasMany = [children: Module]

    static constraints = {
        name(blank: false, nullable: false, unique: true, maxSize: 100)
        action(blank: true, nullable: true, maxSize: 500)
    }

}
