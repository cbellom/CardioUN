package tpicardio



import org.junit.*
import grails.test.mixin.*

@TestFor(RutinaController)
@Mock(Rutina)
class RutinaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/rutina/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.rutinaInstanceList.size() == 0
        assert model.rutinaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.rutinaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.rutinaInstance != null
        assert view == '/rutina/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/rutina/show/1'
        assert controller.flash.message != null
        assert Rutina.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/rutina/list'

        populateValidParams(params)
        def rutina = new Rutina(params)

        assert rutina.save() != null

        params.id = rutina.id

        def model = controller.show()

        assert model.rutinaInstance == rutina
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/rutina/list'

        populateValidParams(params)
        def rutina = new Rutina(params)

        assert rutina.save() != null

        params.id = rutina.id

        def model = controller.edit()

        assert model.rutinaInstance == rutina
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/rutina/list'

        response.reset()

        populateValidParams(params)
        def rutina = new Rutina(params)

        assert rutina.save() != null

        // test invalid parameters in update
        params.id = rutina.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/rutina/edit"
        assert model.rutinaInstance != null

        rutina.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/rutina/show/$rutina.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        rutina.clearErrors()

        populateValidParams(params)
        params.id = rutina.id
        params.version = -1
        controller.update()

        assert view == "/rutina/edit"
        assert model.rutinaInstance != null
        assert model.rutinaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/rutina/list'

        response.reset()

        populateValidParams(params)
        def rutina = new Rutina(params)

        assert rutina.save() != null
        assert Rutina.count() == 1

        params.id = rutina.id

        controller.delete()

        assert Rutina.count() == 0
        assert Rutina.get(rutina.id) == null
        assert response.redirectedUrl == '/rutina/list'
    }
}
