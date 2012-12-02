package tpicardio



import org.junit.*
import grails.test.mixin.*

@TestFor(CursosController)
@Mock(Cursos)
class CursosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cursos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cursosInstanceList.size() == 0
        assert model.cursosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cursosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cursosInstance != null
        assert view == '/cursos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cursos/show/1'
        assert controller.flash.message != null
        assert Cursos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cursos/list'

        populateValidParams(params)
        def cursos = new Cursos(params)

        assert cursos.save() != null

        params.id = cursos.id

        def model = controller.show()

        assert model.cursosInstance == cursos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cursos/list'

        populateValidParams(params)
        def cursos = new Cursos(params)

        assert cursos.save() != null

        params.id = cursos.id

        def model = controller.edit()

        assert model.cursosInstance == cursos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cursos/list'

        response.reset()

        populateValidParams(params)
        def cursos = new Cursos(params)

        assert cursos.save() != null

        // test invalid parameters in update
        params.id = cursos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cursos/edit"
        assert model.cursosInstance != null

        cursos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cursos/show/$cursos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cursos.clearErrors()

        populateValidParams(params)
        params.id = cursos.id
        params.version = -1
        controller.update()

        assert view == "/cursos/edit"
        assert model.cursosInstance != null
        assert model.cursosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cursos/list'

        response.reset()

        populateValidParams(params)
        def cursos = new Cursos(params)

        assert cursos.save() != null
        assert Cursos.count() == 1

        params.id = cursos.id

        controller.delete()

        assert Cursos.count() == 0
        assert Cursos.get(cursos.id) == null
        assert response.redirectedUrl == '/cursos/list'
    }
}
