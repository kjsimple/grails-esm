import com.gydoc.esm.domain.*

class BootStrap {

    def init = { servletContext ->
        new Purpose(name: "\u5176\u5b83", description: "").save()
        new Purpose(name: "\u4f1a\u8bae", description: "").save()
        new Purpose(name: "\u4e1a\u52a1\u5f00\u53d1", description: "").save()
        new EsmRole(roleName: 'admin', description: 'Administration Role').save()
        new EsmRole(roleName: 'user', description: 'Normal user').save()

        def user = new EsmUser(userID: 'david', firstName: 'xj', lastName: 'Guo', password: 'm')
        //user.addToRoles(EsmRole.findByRoleName('user'))
        def role = EsmRole.findByRoleName('user')
        println "@@@@@@@@@@@@@@@@@@@@@$role"
        user.save()
//
//        user = new EsmUser(userID: 'admin', firstName: 'admin', lastName: 'admin', password: 'm')
//        user.addToRoles(EsmRole.findByName('user'))
//        user.save()
    }
    def destroy = {
    }
}
