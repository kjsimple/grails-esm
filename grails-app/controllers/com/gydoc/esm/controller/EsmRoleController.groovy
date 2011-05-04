package com.gydoc.esm.controller

import com.gydoc.esm.domain.EsmRole

class EsmRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [esmRoleInstanceList: EsmRole.list(params), esmRoleInstanceTotal: EsmRole.count()]
    }

    def create = {
        def esmRoleInstance = new EsmRole()
        esmRoleInstance.properties = params
        return [esmRoleInstance: esmRoleInstance]
    }

    def save = {
        def esmRoleInstance = new EsmRole(params)
        if (esmRoleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'esmRole.label', default: 'EsmRole'), esmRoleInstance.id])}"
            redirect(action: "show", id: esmRoleInstance.id)
        }
        else {
            render(view: "create", model: [esmRoleInstance: esmRoleInstance])
        }
    }

    def show = {
        def esmRoleInstance = EsmRole.get(params.id)
        if (!esmRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'esmRole.label', default: 'EsmRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            [esmRoleInstance: esmRoleInstance]
        }
    }

    def edit = {
        def esmRoleInstance = EsmRole.get(params.id)
        if (!esmRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'esmRole.label', default: 'EsmRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [esmRoleInstance: esmRoleInstance]
        }
    }

    def update = {
        def esmRoleInstance = EsmRole.get(params.id)
        if (esmRoleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (esmRoleInstance.version > version) {
                    
                    esmRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'esmRole.label', default: 'EsmRole')] as Object[], "Another user has updated this EsmRole while you were editing")
                    render(view: "edit", model: [esmRoleInstance: esmRoleInstance])
                    return
                }
            }
            esmRoleInstance.properties = params
            if (!esmRoleInstance.hasErrors() && esmRoleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'esmRole.label', default: 'EsmRole'), esmRoleInstance.id])}"
                redirect(action: "show", id: esmRoleInstance.id)
            }
            else {
                render(view: "edit", model: [esmRoleInstance: esmRoleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'esmRole.label', default: 'EsmRole'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def esmRoleInstance = EsmRole.get(params.id)
        if (esmRoleInstance) {
            try {
                esmRoleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'esmRole.label', default: 'EsmRole'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'esmRole.label', default: 'EsmRole'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'esmRole.label', default: 'EsmRole'), params.id])}"
            redirect(action: "list")
        }
    }
}
