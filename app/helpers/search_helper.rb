module SearchHelper   
   
    def number_of_results
        @reviews.count
    end
        
    def render_results_count
      if params[:term].blank? 
      elsif number_of_results.zero?
        'NO REVIEWS FOUND'
      else
        "#{number_of_results} #{'review'.pluralize(number_of_results).upcase} FOUND"
      end

    end
    
end