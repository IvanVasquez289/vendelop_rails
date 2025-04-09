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
end
