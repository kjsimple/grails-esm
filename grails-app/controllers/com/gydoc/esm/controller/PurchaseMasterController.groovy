package com.gydoc.esm.controller

import com.gydoc.esm.domain.PurchaseMaster

class PurchaseMasterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [purchaseMasterInstanceList: PurchaseMaster.list(params), purchaseMasterInstanceTotal: PurchaseMaster.count()]
    }

    def create = {
        def purchaseMasterInstance = new PurchaseMaster()
        purchaseMasterInstance.properties = params
        return [purchaseMasterInstance: purchaseMasterInstance]
    }

    def save = {
        def purchaseMasterInstance = new PurchaseMaster(params)
        if (purchaseMasterInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'purchaseMaster.label', default: 'PurchaseMaster'), purchaseMasterInstance.id])}"
            redirect(action: "show", id: purchaseMasterInstance.id)
        }
        else {
            render(view: "create", model: [purchaseMasterInstance: purchaseMasterInstance])
        }
    }

    def show = {
        def purchaseMasterInstance = PurchaseMaster.get(params.id)
        if (!purchaseMasterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseMaster.label', default: 'PurchaseMaster'), params.id])}"
            redirect(action: "list")
        }
        else {
            [purchaseMasterInstance: purchaseMasterInstance]
        }
    }

    def edit = {
        def purchaseMasterInstance = PurchaseMaster.get(params.id)
        if (!purchaseMasterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseMaster.label', default: 'PurchaseMaster'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [purchaseMasterInstance: purchaseMasterInstance]
        }
    }

    def update = {
        def purchaseMasterInstance = PurchaseMaster.get(params.id)
        if (purchaseMasterInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (purchaseMasterInstance.version > version) {
                    
                    purchaseMasterInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'purchaseMaster.label', default: 'PurchaseMaster')] as Object[], "Another user has updated this PurchaseMaster while you were editing")
                    render(view: "edit", model: [purchaseMasterInstance: purchaseMasterInstance])
                    return
                }
            }
            purchaseMasterInstance.properties = params
            if (!purchaseMasterInstance.hasErrors() && purchaseMasterInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'purchaseMaster.label', default: 'PurchaseMaster'), purchaseMasterInstance.id])}"
                redirect(action: "show", id: purchaseMasterInstance.id)
            }
            else {
                render(view: "edit", model: [purchaseMasterInstance: purchaseMasterInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseMaster.label', default: 'PurchaseMaster'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def purchaseMasterInstance = PurchaseMaster.get(params.id)
        if (purchaseMasterInstance) {
            try {
                purchaseMasterInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'purchaseMaster.label', default: 'PurchaseMaster'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'purchaseMaster.label', default: 'PurchaseMaster'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseMaster.label', default: 'PurchaseMaster'), params.id])}"
            redirect(action: "list")
        }
    }
}
