package tpicardio



import org.junit.*
import grails.test.mixin.*

@TestFor(ImagenCarrouselController)
@Mock(ImagenCarrousel)
class ImagenCarrouselControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/imagenCarrousel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.imagenCarrouselInstanceList.size() == 0
        assert model.imagenCarrouselInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.imagenCarrouselInstance != null
    }

    void testSave() {
        controller.save()

        assert model.imagenCarrouselInstance != null
        assert view == '/imagenCarrousel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/imagenCarrousel/show/1'
        assert controller.flash.message != null
        assert ImagenCarrousel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/imagenCarrousel/list'

        populateValidParams(params)
        def imagenCarrousel = new ImagenCarrousel(params)

        assert imagenCarrousel.save() != null

        params.id = imagenCarrousel.id

        def model = controller.show()

        assert model.imagenCarrouselInstance == imagenCarrousel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/imagenCarrousel/list'

        populateValidParams(params)
        def imagenCarrousel = new ImagenCarrousel(params)

        assert imagenCarrousel.save() != null

        params.id = imagenCarrousel.id

        def model = controller.edit()

        assert model.imagenCarrouselInstance == imagenCarrousel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/imagenCarrousel/list'

        response.reset()

        populateValidParams(params)
        def imagenCarrousel = new ImagenCarrousel(params)

        assert imagenCarrousel.save() != null

        // test invalid parameters in update
        params.id = imagenCarrousel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/imagenCarrousel/edit"
        assert model.imagenCarrouselInstance != null

        imagenCarrousel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/imagenCarrousel/show/$imagenCarrousel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        imagenCarrousel.clearErrors()

        populateValidParams(params)
        params.id = imagenCarrousel.id
        params.version = -1
        controller.update()

        assert view == "/imagenCarrousel/edit"
        assert model.imagenCarrouselInstance != null
        assert model.imagenCarrouselInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/imagenCarrousel/list'

        response.reset()

        populateValidParams(params)
        def imagenCarrousel = new ImagenCarrousel(params)

        assert imagenCarrousel.save() != null
        assert ImagenCarrousel.count() == 1

        params.id = imagenCarrousel.id

        controller.delete()

        assert ImagenCarrousel.count() == 0
        assert ImagenCarrousel.get(imagenCarrousel.id) == null
        assert response.redirectedUrl == '/imagenCarrousel/list'
    }
}
