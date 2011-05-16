package com.gydoc.esm.service

import com.gydoc.esm.domain.Module
import com.gydoc.esm.domain.EsmUser

class ModuleService {

    static transactional = true


    def getModulesForUser(userID) {
        def rootMod = Module.findByParentIsNull()
        def user = EsmUser.findByUserID(userID)
        def allModules = [:]
        def allRoleModules = []
        user.roles.each { role ->
            allRoleModules.addAll(role.modules)
        }
        def loadModule
        loadModule = {module->
            allModules.put(module.name, module)
            module.children.each {
                loadModule(it)
            }
        };
        allRoleModules.each {
            loadModule(it)
        }

        def menus = [:]
        def popMenus
        popMenus = { m1, m2 ->
            m2['name'] = m1.name
            m2['id'] = m1.id
            def subMods = m1.children?.toList()?.sort([compare: { a, b-> a.ord.compareTo(b.ord)}] as Comparator)
            subMods = subMods.findAll {
                allModules[it.name]
            }
            m2['children'] = subMods.collect { c ->
                def r = [:]
                popMenus(c, r)
                return r
            }
        }
        popMenus(rootMod, menus)
        menus
    }

}
