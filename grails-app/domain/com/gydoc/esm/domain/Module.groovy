package com.gydoc.esm.domain

class Module {

    String name

    static constraints = {
        name(blank: false, nullable: false, unique: true, maxSize: 100)
    }

}
