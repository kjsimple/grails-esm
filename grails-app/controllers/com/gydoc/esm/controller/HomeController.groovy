package com.gydoc.esm.controller

import com.gydoc.esm.service.ModuleService
import grails.converters.JSON

/**
 *
 */
class HomeController {

    ModuleService moduleService

    def index = {
        [menus: new JSON(moduleService.getModulesForUser(session.user.userID)).toString(true)]
    }

}
