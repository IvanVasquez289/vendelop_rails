class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "render a list of products" do
    get products_path
    assert_response :success
    assert_select ".product", count: 2
  end

  test "render a detailed product page" do
    get product_path(products(:ps4))
    assert_response :success
    assert_select ".title", "ps4 chipeada"
    assert_select ".description", "en muy buen estado"
    assert_select ".price", "289"
  end

  test "render a new product form" do
    get new_product_path
    assert_response :success
    assert_select "form"
  end

  test "create a new product" do
    post products_path, params: {
      product: {
        title: "Canasta de madera",
        description: "Muy buena calidad",
        price: 100
      }
    }
    assert_redirected_to products_path
  end

  test "does not allow to create a new product with empty fields" do
    post products_path, params: {
      product: {
        title: "",
        description: "Le falla la pantalla",
        price: 45
      }
    }
    assert_response :unprocessable_entity
  end
end
