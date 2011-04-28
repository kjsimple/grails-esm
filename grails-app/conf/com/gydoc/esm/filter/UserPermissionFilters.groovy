package com.gydoc.esm.filter

class UserPermissionFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                def lcName = 'security'
                if (lcName != controllerName) {
                    if (!session?.user) {
                        redirect(controller: lcName)
                        return false
                    }
                }
            }
            after = {
                
            }
            afterView = {
                
            }
        }
    }
    
}
