package com.gydoc.esm.controller

import com.gydoc.esm.domain.DeliveryDetail

class DeliveryDetailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [deliveryDetailInstanceList: DeliveryDetail.list(params), deliveryDetailInstanceTotal: DeliveryDetail.count()]
    }

    def create = {
        def deliveryDetailInstance = new DeliveryDetail()
        deliveryDetailInstance.properties = params
        return [deliveryDetailInstance: deliveryDetailInstance]
    }

    def save = {
        def deliveryDetailInstance = new DeliveryDetail(params)
        if (deliveryDetailInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'deliveryDetail.label', default: 'DeliveryDetail'), deliveryDetailInstance.id])}"
            redirect(action: "show", id: deliveryDetailInstance.id)
        }
        else {
            render(view: "create", model: [deliveryDetailInstance: deliveryDetailInstance])
        }
    }

    def show = {
        def deliveryDetailInstance = DeliveryDetail.get(params.id)
        if (!deliveryDetailInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deliveryDetail.label', default: 'DeliveryDetail'), params.id])}"
            redirect(action: "list")
        }
        else {
            [deliveryDetailInstance: deliveryDetailInstance]
        }
    }

    def edit = {
        def deliveryDetailInstance = DeliveryDetail.get(params.id)
        if (!deliveryDetailInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deliveryDetail.label', default: 'DeliveryDetail'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [deliveryDetailInstance: deliveryDetailInstance]
        }
    }

    def update = {
        def deliveryDetailInstance = DeliveryDetail.get(params.id)
        if (deliveryDetailInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (deliveryDetailInstance.version > version) {
                    
                    deliveryDetailInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'deliveryDetail.label', default: 'DeliveryDetail')] as Object[], "Another user has updated this DeliveryDetail while you were editing")
                    render(view: "edit", model: [deliveryDetailInstance: deliveryDetailInstance])
                    return
                }
            }
            deliveryDetailInstance.properties = params
            if (!deliveryDetailInstance.hasErrors() && deliveryDetailInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'deliveryDetail.label', default: 'DeliveryDetail'), deliveryDetailInstance.id])}"
                redirect(action: "show", id: deliveryDetailInstance.id)
            }
            else {
                render(view: "edit", model: [deliveryDetailInstance: deliveryDetailInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deliveryDetail.label', default: 'DeliveryDetail'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def deliveryDetailInstance = DeliveryDetail.get(params.id)
        if (deliveryDetailInstance) {
            try {
                deliveryDetailInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'deliveryDetail.label', default: 'DeliveryDetail'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'deliveryDetail.label', default: 'DeliveryDetail'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deliveryDetail.label', default: 'DeliveryDetail'), params.id])}"
            redirect(action: "list")
        }
    }
}
