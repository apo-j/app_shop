class AjaxController < ApplicationController
  protect_from_forgery except: :all


  def calculate_price
    matiere = params[:data][:matiere]
    col1 =  params[:data][:coloris].to_i
    col2 =  params[:data][:coloris_side].to_i
    type =  params[:data][:type]
    width = params[:data][:width].to_i
    height = params[:data][:height].to_i

    matrix_price = search_app_data_by_index(1007, 100, [{name: 'matiere', value: matiere,op: '='},{name: 'type', value: type,op: '='}])

    if matrix_price.nil? || matrix_price.length == 0
      return render :json => {data: 0}
    end
     heights = []
     widths = []
     datas = []
    matrix_price[0][:axe_h].split('|').each do |h|
      heights << h.to_i
     end

    matrix_price[0][:axe_w].split('|').each do |w|
      widths << w.to_i
    end

    matrix_price[0][:data].split('|').each do |d|
      datas << d.to_i
    end

    i =  b_search(widths, width)
    j = b_search(heights, height)

    res = datas[(j * widths.length) + i] if i != -1 && j != -1

    return render :json => {data: res || 0}
  end


  private
    def b_search(array, v)
      low = high = mid = 0;
      high = array.length - 1;
      while low <= high do
        mid = (low + high) / 2;
        if array[mid] == v
            return mid
        elsif array[mid] < v
          if mid + 1 < array.length && array[mid + 1] >= v
            return mid + 1
          end
          low = mid + 1
        elsif array[mid]> v
          if mid - 1 >= 0 && array[mid - 1] <= v
            return mid
          end
          high = mid -1
        else
          return mid + 1
        end
      end
      return -1
    end
end
