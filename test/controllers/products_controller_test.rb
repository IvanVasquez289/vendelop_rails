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
    assert_equal "El producto se ha creado correctamente", flash[:notice]
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

  test "render an edit product form" do
    get edit_product_path(products(:ps4))
    assert_response :success
    assert_select "form"
  end

  test "update a product" do
    patch product_path(products(:ps4)), params: {
      product: {
        title: "Canasta de madera",
        description: "Muy buena calidad",
        price: 100
      }
    }
    assert_redirected_to products_path
    assert_equal "El producto se ha actualizado correctamente", flash[:notice]
  end

  test "does not allow to update a product with empty fields" do
    patch product_path(products(:ps4)), params: {
      product: {
        title: "",
        description: "Le falla la pantalla",
        price: 45
      }
    }
    assert_response :unprocessable_entity
  end

  test "delete a product" do
    assert_difference "Product.count", -1 do
      delete product_path(products(:ps4))
    end
    assert_redirected_to products_path
    assert_equal "El producto se ha eliminado correctamente", flash[:notice]
  end
end
