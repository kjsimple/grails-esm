package com.gydoc.esm.controller

import com.gydoc.esm.domain.SalesMan

class SalesManController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [salesManInstanceList: SalesMan.list(params), salesManInstanceTotal: SalesMan.count()]
    }

    def create = {
        def salesManInstance = new SalesMan()
        salesManInstance.properties = params
        return [salesManInstance: salesManInstance]
    }

    def save = {
        def salesManInstance = new SalesMan(params)
        if (salesManInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'salesMan.label', default: 'SalesMan'), salesManInstance.id])}"
            redirect(action: "show", id: salesManInstance.id)
        }
        else {
            render(view: "create", model: [salesManInstance: salesManInstance])
        }
    }

    def show = {
        def salesManInstance = SalesMan.get(params.id)
        if (!salesManInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salesMan.label', default: 'SalesMan'), params.id])}"
            redirect(action: "list")
        }
        else {
            [salesManInstance: salesManInstance]
        }
    }

    def edit = {
        def salesManInstance = SalesMan.get(params.id)
        if (!salesManInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salesMan.label', default: 'SalesMan'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [salesManInstance: salesManInstance]
        }
    }

    def update = {
        def salesManInstance = SalesMan.get(params.id)
        if (salesManInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (salesManInstance.version > version) {
                    
                    salesManInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'salesMan.label', default: 'SalesMan')] as Object[], "Another user has updated this SalesMan while you were editing")
                    render(view: "edit", model: [salesManInstance: salesManInstance])
                    return
                }
            }
            salesManInstance.properties = params
            if (!salesManInstance.hasErrors() && salesManInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'salesMan.label', default: 'SalesMan'), salesManInstance.id])}"
                redirect(action: "show", id: salesManInstance.id)
            }
            else {
                render(view: "edit", model: [salesManInstance: salesManInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salesMan.label', default: 'SalesMan'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def salesManInstance = SalesMan.get(params.id)
        if (salesManInstance) {
            try {
                salesManInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'salesMan.label', default: 'SalesMan'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'salesMan.label', default: 'SalesMan'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salesMan.label', default: 'SalesMan'), params.id])}"
            redirect(action: "list")
        }
    }
}
