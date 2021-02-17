class PagesController < ApplicationController
  def index
    @products = Product.active.top_rated
    @solutions = Solution.active.top_rated
    @solution_groups = SolutionGroup.active
    @articles = Article.order("created_at DESC").last(5)
  end

  def profile
    puts @profile = Page.find(1)
  end

  def about
    @about = Page.find(2)
  end

  def contacts
    @contacts = PageElement.find(3)
    render :layout => "contacts"
  end

  def sales
    @sales = PageElement.find(4)
  end

  def techs
    @techs = PageElement.find(5)
  end

  def calculators
    
  end

  def dvb_c
    
  end

  def link_profile
    
  end

  def search
    @search = params[:term]
    @results = []
    if @search
      @res = Sunspot.search Product, Category, Subcategory, Solution, Patent, Post, Article do
        fulltext params[:term] do 
          boost(20.0) { with(:class, Product) }
          boost(15.0) { with(:class, Category) }
          boost(13.0) { with(:class, Subcategory) }
          boost(8.0) { with(:class, Solution) }
          boost(5.0) { with(:class, Article) }
          boost(2.0) { with(:class, Post) }
          boost(1.0) { with(:class, Patent) }
        end
      end
      @results = @res.results
      respond_to do |format|
        format.json { render :json => @results.map(&:name) }
        format.html
      end
    end
  end
end
