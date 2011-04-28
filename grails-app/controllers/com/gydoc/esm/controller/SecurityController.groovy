package com.gydoc.esm.controller

import com.gydoc.esm.domain.EsmUser

class SecurityController {

    def homePage() {
        redirect(uri: '/')
    }

    def checkExistingUser() {
        if (session?.user) {
            session.invalidate()
            homePage()
            return true
        }
    }

    def index = {
        checkExistingUser()
    }

    def logout = {
        session.invalidate()
        homePage()
    }

    def login = {
        if (checkExistingUser()) {
            return false
        }
        if (!params.userid.trim()) {
            render(view: 'index')
            return false
        }
        def user = EsmUser.findByUserID(params.userid)
        if (user?.password != params.password?.encodeAsSHA()) {
            render(view: 'index')
            return false
        } else {
            session.user = user
            homePage()
        }
    }
    
}
