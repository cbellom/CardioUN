package tpicardio



import org.junit.*
import grails.test.mixin.*

@TestFor(PruebaValoracionController)
@Mock(PruebaValoracion)
class PruebaValoracionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pruebaValoracion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pruebaValoracionInstanceList.size() == 0
        assert model.pruebaValoracionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pruebaValoracionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pruebaValoracionInstance != null
        assert view == '/pruebaValoracion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pruebaValoracion/show/1'
        assert controller.flash.message != null
        assert PruebaValoracion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pruebaValoracion/list'

        populateValidParams(params)
        def pruebaValoracion = new PruebaValoracion(params)

        assert pruebaValoracion.save() != null

        params.id = pruebaValoracion.id

        def model = controller.show()

        assert model.pruebaValoracionInstance == pruebaValoracion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pruebaValoracion/list'

        populateValidParams(params)
        def pruebaValoracion = new PruebaValoracion(params)

        assert pruebaValoracion.save() != null

        params.id = pruebaValoracion.id

        def model = controller.edit()

        assert model.pruebaValoracionInstance == pruebaValoracion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pruebaValoracion/list'

        response.reset()

        populateValidParams(params)
        def pruebaValoracion = new PruebaValoracion(params)

        assert pruebaValoracion.save() != null

        // test invalid parameters in update
        params.id = pruebaValoracion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pruebaValoracion/edit"
        assert model.pruebaValoracionInstance != null

        pruebaValoracion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pruebaValoracion/show/$pruebaValoracion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pruebaValoracion.clearErrors()

        populateValidParams(params)
        params.id = pruebaValoracion.id
        params.version = -1
        controller.update()

        assert view == "/pruebaValoracion/edit"
        assert model.pruebaValoracionInstance != null
        assert model.pruebaValoracionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pruebaValoracion/list'

        response.reset()

        populateValidParams(params)
        def pruebaValoracion = new PruebaValoracion(params)

        assert pruebaValoracion.save() != null
        assert PruebaValoracion.count() == 1

        params.id = pruebaValoracion.id

        controller.delete()

        assert PruebaValoracion.count() == 0
        assert PruebaValoracion.get(pruebaValoracion.id) == null
        assert response.redirectedUrl == '/pruebaValoracion/list'
    }
}
