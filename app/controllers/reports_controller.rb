class ReportsController < ApplicationController
  def index
    format_date= "%B %Y"
    diagram_month = (Diagram.all.
      minimum(:created_at).to_date..Date.today).
      map {|d| d.strftime(format_date)}.uniq 

    user_month = (User.all.
      minimum(:created_at).to_date..Date.today).
      map {|d| d.strftime(format_date)}.uniq

    diagram_new = 
      Institution.all.
        map{ |ins| 
          {
            name: ins.name, 
            data: Diagram.all.
              where(:institution_id => ins.id).
              group_by_month(:created_at,format: format_date).count.
              inject(Hash[diagram_month.map{|month| [month,0]}]) do |result,element|
                result[element.first] = element.last
                result
              end
          }}


    diagram_total = 
      Institution.all.
        map{ |ins| 
          {
            name: ins.name, 
            data: Diagram.all.
              where(:institution_id => ins.id).
              group_by_month(:created_at,format: format_date).
              count.inject(Hash[diagram_month.map{|month| [month,0]}]) do |result, element|
                result[element.first] = element.last
                result
              end.inject({}) do |result, element|
                if result.length == 0
                  result[element.first] =element.last
                else
                  result[element.first] =element.last+result[result.keys[result.length-1]]
                end
                  result
                end
          }
        }

    user_new = 
    Institution.all.
      map{ |ins| 
        {
          name: ins.name, 
          data: User.all.
            where(:institution_id => ins.id).
            group_by_month(:created_at,format: format_date).count.
            inject(Hash[user_month.map{|month| [month,0]}]) do |result, element|
                result[element.first] = element.last
                result
              end
        }}

          
    user_total = 
      Institution.all.
        map{ |ins| 
          {
            name: ins.name, 
            data: User.all.
              where(:institution_id => ins.id).
              group_by_month(:created_at,format: format_date).
              count.inject(Hash[user_month.map{|month| [month,0]}]) do |result, element|
                result[element.first] = element.last
                result
              end.inject({}) do |result, element|
                if result.length == 0
                  result[element.first] =element.last
                else
                  result[element.first] =element.last+result[result.keys[result.length-1]]
                end
                  result
                end
          }
        }

      @summary = [
        {
          name: "new_diagrams_usage_summary",
          data: diagram_new,
          month: diagram_month
        },
        {
          name: "total_diagrams_usage_summary",
          data: diagram_total,
          month: diagram_month
        },
        {
          name: "new_users_usage_summary",
          data: user_new,
          month: user_month
        },
        {
          name: "total_users_usage_summary",
          data: user_total,
          month: user_month
        }]
  end
end


