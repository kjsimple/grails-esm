package com.gydoc.esm.filter

class UserPermissionFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                if (!session?.user) {
                    render(view: '/login')
                    return false
                }
            }
            after = {
                
            }
            afterView = {
                
            }
        }
    }
    
}
