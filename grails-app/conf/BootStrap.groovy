import com.gydoc.esm.domain.*

class BootStrap {

    def init = { servletContext ->
        [
            new Purpose(name: "\u5176\u5b83", description: ""),
            new Purpose(name: "\u4f1a\u8bae", description: ""),
            new Purpose(name: "\u4e1a\u52a1\u5f00\u53d1", description: ""),
            new EsmRole(name: 'admin', description: 'Administration Role'),
            new EsmRole(name: 'user', description: 'Normal user').save()
        ].each {it.save(flush: true)}

        def user = new EsmUser(userID: 'david', firstName: 'xj', lastName: 'Guo', password: 'm')
        user.addToRoles(EsmRole.findByName('user'))
        user.save()

        user = new EsmUser(userID: 'admin', firstName: 'admin', lastName: 'admin', password: 'm')
        user.addToRoles(EsmRole.findByName('admin'))
        user.save()
    }
    def destroy = {
    }
}
