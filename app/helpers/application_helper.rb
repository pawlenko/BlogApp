module ApplicationHelper
    def errors_helper(object)
        render(:partial=>'additional/errors',:locals=>{:object=>object})
    end 
end
