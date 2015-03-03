class ChartsController < ApplicationController

  def index
    monthly_inquiry
    inquiry_ratio
  end

  private
  
    def monthly_inquiry
      monthly_day = (Date.today.beginning_of_month..Date.today).to_a
      @number_of_inquiries = monthly_day.map { |item| Inquiry.where(:created_at => item.beginning_of_day..item.end_of_day).count }

      @daily_graph = LazyHighCharts::HighChart.new('daily_graph') do |f|
        f.title(text: "Change of the monthly inquiry number")
        f.xAxis(categories: @monthly_day)
        f.series(name: 'the number of inquiries', data: @number_of_inquiries, type: 'column')
      end
    end
    
    def inquiry_ratio
      all_category_map = Category.all.map {|category| [category.id, category.name]}
      all_category_hash = Hash[all_category_map]
      
      @ratio_data = Array.new
      
      all_category_hash.each { |key, value|
        @ratio_data.push([value, Inquiry.where("category_id in (?)", key).count])
      }
      
      @category_graph = LazyHighCharts::HighChart.new('category_graph') do |f|
        f.title(text: "Ratio of inquiries every category")
        f.series(name: 'stock', data: @ratio_data, type: 'pie')
      end
    end

end