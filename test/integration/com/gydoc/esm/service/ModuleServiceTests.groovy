package com.gydoc.esm.service

import grails.test.*

class ModuleServiceTests extends GroovyTestCase {

    def moduleService

    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testGetModulesForUser() {
        def menus = moduleService.getModulesForUser('david')
        def dp
        dp = { m ->
            println m.nodeVal.name
            m.children.each {
                dp(it)
            }
        }
        dp(menus)
    }
    
}
