package com.gydoc.esm.controller

import com.gydoc.esm.domain.Purpose

class PurposeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [purposeInstanceList: Purpose.list(params), purposeInstanceTotal: Purpose.count()]
    }

    def create = {
        def purposeInstance = new Purpose()
        purposeInstance.properties = params
        return [purposeInstance: purposeInstance]
    }

    def save = {
        def purposeInstance = new Purpose(params)
        if (purposeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'purpose.label', default: 'Purpose'), purposeInstance.id])}"
            redirect(action: "show", id: purposeInstance.id)
        }
        else {
            render(view: "create", model: [purposeInstance: purposeInstance])
        }
    }

    def show = {
        def purposeInstance = Purpose.get(params.id)
        if (!purposeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purpose.label', default: 'Purpose'), params.id])}"
            redirect(action: "list")
        }
        else {
            [purposeInstance: purposeInstance]
        }
    }

    def edit = {
        def purposeInstance = Purpose.get(params.id)
        if (!purposeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purpose.label', default: 'Purpose'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [purposeInstance: purposeInstance]
        }
    }

    def update = {
        def purposeInstance = Purpose.get(params.id)
        if (purposeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (purposeInstance.version > version) {
                    
                    purposeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'purpose.label', default: 'Purpose')] as Object[], "Another user has updated this Purpose while you were editing")
                    render(view: "edit", model: [purposeInstance: purposeInstance])
                    return
                }
            }
            purposeInstance.properties = params
            if (!purposeInstance.hasErrors() && purposeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'purpose.label', default: 'Purpose'), purposeInstance.id])}"
                redirect(action: "show", id: purposeInstance.id)
            }
            else {
                render(view: "edit", model: [purposeInstance: purposeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purpose.label', default: 'Purpose'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def purposeInstance = Purpose.get(params.id)
        if (purposeInstance) {
            try {
                purposeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'purpose.label', default: 'Purpose'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'purpose.label', default: 'Purpose'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purpose.label', default: 'Purpose'), params.id])}"
            redirect(action: "list")
        }
    }
}
