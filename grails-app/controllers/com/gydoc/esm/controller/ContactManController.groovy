package com.gydoc.esm.controller

import com.gydoc.esm.domain.ContactMan

class ContactManController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contactManInstanceList: ContactMan.list(params), contactManInstanceTotal: ContactMan.count()]
    }

    def create = {
        def contactManInstance = new ContactMan()
        contactManInstance.properties = params
        return [contactManInstance: contactManInstance]
    }

    def save = {
        def contactManInstance = new ContactMan(params)
        if (contactManInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'contactMan.label', default: 'ContactMan'), contactManInstance.id])}"
            redirect(action: "show", id: contactManInstance.id)
        }
        else {
            render(view: "create", model: [contactManInstance: contactManInstance])
        }
    }

    def show = {
        def contactManInstance = ContactMan.get(params.id)
        if (!contactManInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactMan.label', default: 'ContactMan'), params.id])}"
            redirect(action: "list")
        }
        else {
            [contactManInstance: contactManInstance]
        }
    }

    def edit = {
        def contactManInstance = ContactMan.get(params.id)
        if (!contactManInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactMan.label', default: 'ContactMan'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [contactManInstance: contactManInstance]
        }
    }

    def update = {
        def contactManInstance = ContactMan.get(params.id)
        if (contactManInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (contactManInstance.version > version) {
                    
                    contactManInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'contactMan.label', default: 'ContactMan')] as Object[], "Another user has updated this ContactMan while you were editing")
                    render(view: "edit", model: [contactManInstance: contactManInstance])
                    return
                }
            }
            contactManInstance.properties = params
            if (!contactManInstance.hasErrors() && contactManInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'contactMan.label', default: 'ContactMan'), contactManInstance.id])}"
                redirect(action: "show", id: contactManInstance.id)
            }
            else {
                render(view: "edit", model: [contactManInstance: contactManInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactMan.label', default: 'ContactMan'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def contactManInstance = ContactMan.get(params.id)
        if (contactManInstance) {
            try {
                contactManInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'contactMan.label', default: 'ContactMan'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'contactMan.label', default: 'ContactMan'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactMan.label', default: 'ContactMan'), params.id])}"
            redirect(action: "list")
        }
    }
}
