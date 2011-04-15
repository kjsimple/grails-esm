
/**
 *
 */
import java.security.MessageDigest

class SHACodec {
    static encode = { target ->
        MessageDigest md = MessageDigest.getInstance('SHA-1')
        md.update(target.getBytes('UTF-8'))
        return new String(md.digest()).encodeAsBase64()
    }
}
