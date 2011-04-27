import com.gydoc.esm.domain.*

class BootStrap {

    def init = { servletContext ->
        new Purpose(name: "\u5176\u5b83", description: "").save()
        new Purpose(name: "\u4f1a\u8bae", description: "").save()
        new Purpose(name: "\u4e1a\u52a1\u5f00\u53d1", description: "").save()
    }
    def destroy = {
    }
}
