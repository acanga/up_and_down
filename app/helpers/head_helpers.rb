module HeadHelpers
  def page(title, page_options = {})
    page_title title
    page_stylesheets page_options[:stylesheets]
    page_javascripts page_options[:javascripts]
  end

  protected
    def page_title(title)
      provide(:page_title) { title } 
    end

    def page_stylesheets(stylesheets)
      if stylesheets
        provide(:page_stylesheets) { stylesheet_link_tag(*stylesheets) } 
      end
    end

    def page_javascripts(javascripts)
      if javascripts
        provide(:page_javascripts) { javascript_include_tag(*javascripts) }
      end
    end
end