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

    def loginFailed() {
        render(contentType: 'text/json') {
            res = 0
            msg = 'Invalid user name or password'
        }
    }

    def login = {
        if (checkExistingUser()) {
            return false
        }
        if (!params.userid?.trim()) {
            loginFailed()
            return false
        }
        def user = EsmUser.findByUserID(params.userid)
        if (user?.password != params.password?.encodeAsSHA()) {
            loginFailed()
            return false
        } else {
            session.user = user
            render(contentType: 'text/json') {
                res = 1
            }
        }
    }
    
}
