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
        def homeModule = new Module(name: 'Home', action: '/', ord: 1)
        def logoutModule = new Module(name: 'Logout', action: '/securityController', ord: 5)
        homeModule.parent = rootModule

        def adminModule = new Module(name: "system admin", ord: 2)
        def userModule = new Module(name: 'user', action: '/esmUserController', ord: 1)
        adminModule.addToChildren(userModule)
        def roleModule = new Module(name: 'role', action: '/esmRoleController', ord: 2)
        adminModule.addToChildren(roleModule)

        def pssDataModule = new Module(name: 'pss data', ord: 3)
        def contactManModule = new Module(name: 'contactMan', action: '/contactManController', ord: 1)
        pssDataModule.addToChildren(contactManModule)
        def customerModule = new Module(name: 'customer', action: '/customerController', ord: 2)
        pssDataModule.addToChildren(customerModule)
        def productModule = new Module(name: 'product', action: '/productController', ord: 3)
        pssDataModule.addToChildren(productModule)
        def salesManModule = new Module(name: 'sailsMan', action: '/salesManController', ord: 4)
        pssDataModule.addToChildren(salesManModule)
        def supplierModule = new Module(name: 'supplier', action: '/supplierController', ord: 5)
        pssDataModule.addToChildren(supplierModule)
        def pssManageModule = new Module(name: 'pss management', ord: 4)
        def purchaseModule = new Module(name: 'purchase', action: '/purchaseMasterController', ord: 1)
        pssManageModule.addToChildren(purchaseModule)
        def deliveryModule = new Module(name: 'delivery', action: '/deliveryMasterController', ord: 2)
        pssManageModule.addToChildren(deliveryModule)

        rootModule.addToChildren(homeModule)
        rootModule.addToChildren(adminModule)
        rootModule.addToChildren(pssDataModule)
        rootModule.addToChildren(pssManageModule)
        rootModule.addToChildren(logoutModule)
        rootModule.save(flush: true);

        { arg ->
            def userRole = EsmRole.findByName('user')
            userRole.addToModules(homeModule)
            userRole.addToModules(pssManageModule)
            userRole.addToModules(logoutModule)
            userRole.save(flush: true)

            def admRole = EsmRole.findByName('admin')
            admRole.addToModules(homeModule)
            admRole.addToModules(adminModule)
            admRole.addToModules(pssDataModule)
            admRole.addToModules(logoutModule)
            admRole.save(flush: true)
        }();

    }
    
    def destroy = {

    }
    
}
