package com.gydoc.esm.domain

class Module {

    String name
    String action
    Module parent
    int ord
    static hasMany = [children: Module]

    static constraints = {
        name(blank: false, nullable: false, unique: true, maxSize: 100)
        action(blank: true, nullable: true, maxSize: 500)
        ord(blank: false, nullable: false, default: 0)
    }

}
