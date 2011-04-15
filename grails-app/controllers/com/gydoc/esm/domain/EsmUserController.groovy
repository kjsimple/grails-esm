package com.gydoc.esm.domain

class EsmUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [esmUserInstanceList: EsmUser.list(params), esmUserInstanceTotal: EsmUser.count()]
    }

    def create = {
        def esmUserInstance = new EsmUser()
        esmUserInstance.properties = params
        return [esmUserInstance: esmUserInstance]
    }

    def save = {
        def esmUserInstance = new EsmUser(params)
        if (esmUserInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'esmUser.label', default: 'EsmUser'), esmUserInstance.id])}"
            redirect(action: "show", id: esmUserInstance.id)
        }
        else {
            render(view: "create", model: [esmUserInstance: esmUserInstance])
        }
    }

    def show = {
        def esmUserInstance = EsmUser.get(params.id)
        if (!esmUserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'esmUser.label', default: 'EsmUser'), params.id])}"
            redirect(action: "list")
        }
        else {
            [esmUserInstance: esmUserInstance]
        }
    }

    def edit = {
        def esmUserInstance = EsmUser.get(params.id)
        if (!esmUserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'esmUser.label', default: 'EsmUser'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [esmUserInstance: esmUserInstance]
        }
    }

    def update = {
        def esmUserInstance = EsmUser.get(params.id)
        if (esmUserInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (esmUserInstance.version > version) {
                    
                    esmUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'esmUser.label', default: 'EsmUser')] as Object[], "Another user has updated this EsmUser while you were editing")
                    render(view: "edit", model: [esmUserInstance: esmUserInstance])
                    return
                }
            }
            esmUserInstance.properties = params
            if (!esmUserInstance.hasErrors() && esmUserInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'esmUser.label', default: 'EsmUser'), esmUserInstance.id])}"
                redirect(action: "show", id: esmUserInstance.id)
            }
            else {
                render(view: "edit", model: [esmUserInstance: esmUserInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'esmUser.label', default: 'EsmUser'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def esmUserInstance = EsmUser.get(params.id)
        if (esmUserInstance) {
            try {
                esmUserInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'esmUser.label', default: 'EsmUser'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'esmUser.label', default: 'EsmUser'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'esmUser.label', default: 'EsmUser'), params.id])}"
            redirect(action: "list")
        }
    }
}
