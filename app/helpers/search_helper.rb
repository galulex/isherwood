module SearchHelper   
   
    def number_of_results
        @reviews.count
    end
        
    def render_results_count
      if number_of_results.zero?
        'NO REVIEWS FOUND'
      else
        "#{number_of_results} #{'review'.pluralize(number_of_results).upcase}"
      end
    end
end