require "test_helper"

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "get new category form and create new category" do
    #access the new category path
    get new_category_path
    
    #get the new form
    assert_template 'categories/new'
    
    #post to the new form creating the sports category and there should be a difference in category count of 1
    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {name: "sports"}}
      follow_redirect!
    end
    
    #where to send user after this category is created
    assert_template 'categories/index'
    
    #ensure category got created and name is displayed
    assert_match "sports", response.body
  end
end