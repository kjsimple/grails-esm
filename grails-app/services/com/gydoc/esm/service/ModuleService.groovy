package com.gydoc.esm.service

import com.gydoc.esm.domain.Module
import com.gydoc.esm.domain.EsmUser
import com.gydoc.esm.TreeNode

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

        def res = new TreeNode()
        def popModule
        popModule = { m1, m2 ->
            m2.nodeVal = m1
            def subMods = m1.children?.toList()?.sort([compare: { a, b-> a.ord.compareTo(b.ord)}] as Comparator)
            subMods.each {
                if (allModules[it.name]) {
                    def m = new TreeNode()
                    m2.children.add(m)
                    popModule(it, m)
                }
            }
        }
        popModule(rootMod, res)
        res
    }

}
