import com.gydoc.esm.domain.*

class BootStrap {

    def init = { servletContext ->
        [
            new Purpose(name: "\u5176\u5b83", description: ""),
            new Purpose(name: "\u4f1a\u8bae", description: ""),
            new Purpose(name: "\u4e1a\u52a1\u5f00\u53d1", description: ""),
            new EsmRole(name: 'admin', description: 'Administration Role'),
            new EsmRole(name: 'user', description: 'Normal user')
        ].each {it.save(flush: true)}

        def user = new EsmUser(userID: 'david', firstName: 'xj', lastName: 'Guo', password: 'm')
        user.addToRoles(EsmRole.findByName('user'))
        user.save()

        user = new EsmUser(userID: 'admin', firstName: 'admin', lastName: 'admin', password: 'm')
        user.addToRoles(EsmRole.findByName('admin'))
        user.save(flush: true)

        def rootModule = new Module(name: 'ROOT')
        def homeModule = new Module(name: 'Home', action: '/')
        def logoutModule = new Module(name: 'Logout', action: '/securityController')
        homeModule.parent = rootModule

        def adminModule = new Module(name: "system admin")
        def userModule = new Module(name: 'user', action: '/esmUserController')
        adminModule.addToChildren(userModule)
        def roleModule = new Module(name: 'role', action: '/esmRoleController')
        adminModule.addToChildren(roleModule)

        def pssDataModule = new Module(name: 'pss data')
        def contactManModule = new Module(name: 'contactMan', action: '/contactManController')
        pssDataModule.addToChildren(contactManModule)
        def customerModule = new Module(name: 'customer', action: '/customerController')
        pssDataModule.addToChildren(customerModule)
        def productModule = new Module(name: 'product', action: '/productController')
        pssDataModule.addToChildren(productModule)
        def salesManModule = new Module(name: 'sailsMan', action: '/salesManController')
        pssDataModule.addToChildren(salesManModule)
        def supplierModule = new Module(name: 'supplier', action: '/supplierController')
        pssDataModule.addToChildren(supplierModule)
        def pssManageModule = new Module(name: 'pss management')
        def purchaseModule = new Module(name: 'purchase', action: '/purchaseMasterController')
        pssManageModule.addToChildren(purchaseModule)
        def deliveryModule = new Module(name: 'delivery management', action: '/deliveryMasterController')
        pssManageModule.addToChildren(deliveryModule)

        rootModule.addToChildren(homeModule)
        rootModule.addToChildren(adminModule)
        rootModule.addToChildren(pssDataModule)
        rootModule.addToChildren(logoutModule)
        rootModule.addToChildren(pssManageModule)
        rootModule.save(flush: true)
    }
    
    def destroy = {

    }
    
}
