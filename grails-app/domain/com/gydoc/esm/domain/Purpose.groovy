package com.gydoc.esm.domain

class Purpose {

    String name
    String description

    static constraints = {
        name(blank: false, unique: true)
        description(maxSize: 1000)
    }

    String toString() {
        name
    }

}
