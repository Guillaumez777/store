require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @user = users(:one)
  end

  test "should get index without authentication" do
    get products_url
    assert_response :success
  end

  test "should show product without authentication" do
    get product_url(@product)
    assert_response :success
  end

  test "should redirect new when unauthenticated" do
    get new_product_url
    assert_redirected_to new_session_path
  end

  test "should get new when authenticated" do
    sign_in_as @user
    get new_product_url
    assert_response :success
  end

  test "should create product when authenticated" do
    sign_in_as @user

    assert_difference("Product.count") do
      post products_url, params: { product: { name: "Nouveau produit" } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should get edit when authenticated" do
    sign_in_as @user
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product when authenticated" do
    sign_in_as @user
    patch product_url(@product), params: { product: { name: @product.name } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product when authenticated" do
    sign_in_as @user

    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
