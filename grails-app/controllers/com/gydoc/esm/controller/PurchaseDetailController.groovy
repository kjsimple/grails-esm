package com.gydoc.esm.controller

import com.gydoc.esm.domain.PurchaseDetail

class PurchaseDetailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [purchaseDetailInstanceList: PurchaseDetail.list(params), purchaseDetailInstanceTotal: PurchaseDetail.count()]
    }

    def create = {
        def purchaseDetailInstance = new PurchaseDetail()
        purchaseDetailInstance.properties = params
        return [purchaseDetailInstance: purchaseDetailInstance]
    }

    def save = {
        def purchaseDetailInstance = new PurchaseDetail(params)
        if (purchaseDetailInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'purchaseDetail.label', default: 'PurchaseDetail'), purchaseDetailInstance.id])}"
            redirect(action: "show", id: purchaseDetailInstance.id)
        }
        else {
            render(view: "create", model: [purchaseDetailInstance: purchaseDetailInstance])
        }
    }

    def show = {
        def purchaseDetailInstance = PurchaseDetail.get(params.id)
        if (!purchaseDetailInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseDetail.label', default: 'PurchaseDetail'), params.id])}"
            redirect(action: "list")
        }
        else {
            [purchaseDetailInstance: purchaseDetailInstance]
        }
    }

    def edit = {
        def purchaseDetailInstance = PurchaseDetail.get(params.id)
        if (!purchaseDetailInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseDetail.label', default: 'PurchaseDetail'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [purchaseDetailInstance: purchaseDetailInstance]
        }
    }

    def update = {
        def purchaseDetailInstance = PurchaseDetail.get(params.id)
        if (purchaseDetailInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (purchaseDetailInstance.version > version) {
                    
                    purchaseDetailInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'purchaseDetail.label', default: 'PurchaseDetail')] as Object[], "Another user has updated this PurchaseDetail while you were editing")
                    render(view: "edit", model: [purchaseDetailInstance: purchaseDetailInstance])
                    return
                }
            }
            purchaseDetailInstance.properties = params
            if (!purchaseDetailInstance.hasErrors() && purchaseDetailInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'purchaseDetail.label', default: 'PurchaseDetail'), purchaseDetailInstance.id])}"
                redirect(action: "show", id: purchaseDetailInstance.id)
            }
            else {
                render(view: "edit", model: [purchaseDetailInstance: purchaseDetailInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseDetail.label', default: 'PurchaseDetail'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def purchaseDetailInstance = PurchaseDetail.get(params.id)
        if (purchaseDetailInstance) {
            try {
                purchaseDetailInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'purchaseDetail.label', default: 'PurchaseDetail'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'purchaseDetail.label', default: 'PurchaseDetail'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseDetail.label', default: 'PurchaseDetail'), params.id])}"
            redirect(action: "list")
        }
    }
}
