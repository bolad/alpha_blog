class ArticleCategory < ActiveRecord::Base
  #build association between articless and categories
  belongs_to :article
  belongs_to :category
end