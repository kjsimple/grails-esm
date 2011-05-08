package com.gydoc.esm.service

import com.gydoc.esm.domain.Module

class ModuleService {

    static transactional = true

    static def getModulesForUser(user) {
        Module.findByParentIsNull()

        //user.
    }

}
