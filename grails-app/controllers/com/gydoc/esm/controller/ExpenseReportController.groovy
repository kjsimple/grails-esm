package com.gydoc.esm.controller

import com.gydoc.esm.domain.ExpenseReport

class ExpenseReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [expenseReportInstanceList: ExpenseReport.list(params), expenseReportInstanceTotal: ExpenseReport.count()]
    }

    def create = {
        def expenseReportInstance = new ExpenseReport()
        expenseReportInstance.properties = params
        return [expenseReportInstance: expenseReportInstance]
    }

    def save = {
        def expenseReportInstance = new ExpenseReport(params)
        if (expenseReportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'expenseReport.label', default: 'ExpenseReport'), expenseReportInstance.id])}"
            redirect(action: "show", id: expenseReportInstance.id)
        }
        else {
            render(view: "create", model: [expenseReportInstance: expenseReportInstance])
        }
    }

    def show = {
        def expenseReportInstance = ExpenseReport.get(params.id)
        if (!expenseReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'expenseReport.label', default: 'ExpenseReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            [expenseReportInstance: expenseReportInstance]
        }
    }

    def edit = {
        def expenseReportInstance = ExpenseReport.get(params.id)
        if (!expenseReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'expenseReport.label', default: 'ExpenseReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [expenseReportInstance: expenseReportInstance]
        }
    }

    def update = {
        def expenseReportInstance = ExpenseReport.get(params.id)
        if (expenseReportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (expenseReportInstance.version > version) {
                    
                    expenseReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'expenseReport.label', default: 'ExpenseReport')] as Object[], "Another user has updated this ExpenseReport while you were editing")
                    render(view: "edit", model: [expenseReportInstance: expenseReportInstance])
                    return
                }
            }
            expenseReportInstance.properties = params
            if (!expenseReportInstance.hasErrors() && expenseReportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'expenseReport.label', default: 'ExpenseReport'), expenseReportInstance.id])}"
                redirect(action: "show", id: expenseReportInstance.id)
            }
            else {
                render(view: "edit", model: [expenseReportInstance: expenseReportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'expenseReport.label', default: 'ExpenseReport'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def expenseReportInstance = ExpenseReport.get(params.id)
        if (expenseReportInstance) {
            try {
                expenseReportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'expenseReport.label', default: 'ExpenseReport'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'expenseReport.label', default: 'ExpenseReport'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'expenseReport.label', default: 'ExpenseReport'), params.id])}"
            redirect(action: "list")
        }
    }
}
