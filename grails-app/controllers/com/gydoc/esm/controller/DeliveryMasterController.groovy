package com.gydoc.esm.controller

import com.gydoc.esm.domain.DeliveryMaster

class DeliveryMasterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [deliveryMasterInstanceList: DeliveryMaster.list(params), deliveryMasterInstanceTotal: DeliveryMaster.count()]
    }

    def create = {
        def deliveryMasterInstance = new DeliveryMaster()
        deliveryMasterInstance.properties = params
        return [deliveryMasterInstance: deliveryMasterInstance]
    }

    def save = {
        def deliveryMasterInstance = new DeliveryMaster(params)
        if (deliveryMasterInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'deliveryMaster.label', default: 'DeliveryMaster'), deliveryMasterInstance.id])}"
            redirect(action: "show", id: deliveryMasterInstance.id)
        }
        else {
            render(view: "create", model: [deliveryMasterInstance: deliveryMasterInstance])
        }
    }

    def show = {
        def deliveryMasterInstance = DeliveryMaster.get(params.id)
        if (!deliveryMasterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deliveryMaster.label', default: 'DeliveryMaster'), params.id])}"
            redirect(action: "list")
        }
        else {
            [deliveryMasterInstance: deliveryMasterInstance]
        }
    }

    def edit = {
        def deliveryMasterInstance = DeliveryMaster.get(params.id)
        if (!deliveryMasterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deliveryMaster.label', default: 'DeliveryMaster'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [deliveryMasterInstance: deliveryMasterInstance]
        }
    }

    def update = {
        def deliveryMasterInstance = DeliveryMaster.get(params.id)
        if (deliveryMasterInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (deliveryMasterInstance.version > version) {
                    
                    deliveryMasterInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'deliveryMaster.label', default: 'DeliveryMaster')] as Object[], "Another user has updated this DeliveryMaster while you were editing")
                    render(view: "edit", model: [deliveryMasterInstance: deliveryMasterInstance])
                    return
                }
            }
            deliveryMasterInstance.properties = params
            if (!deliveryMasterInstance.hasErrors() && deliveryMasterInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'deliveryMaster.label', default: 'DeliveryMaster'), deliveryMasterInstance.id])}"
                redirect(action: "show", id: deliveryMasterInstance.id)
            }
            else {
                render(view: "edit", model: [deliveryMasterInstance: deliveryMasterInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deliveryMaster.label', default: 'DeliveryMaster'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def deliveryMasterInstance = DeliveryMaster.get(params.id)
        if (deliveryMasterInstance) {
            try {
                deliveryMasterInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'deliveryMaster.label', default: 'DeliveryMaster'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'deliveryMaster.label', default: 'DeliveryMaster'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deliveryMaster.label', default: 'DeliveryMaster'), params.id])}"
            redirect(action: "list")
        }
    }
}
