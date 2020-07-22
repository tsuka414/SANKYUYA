require 'rubyXL'

class ProductsController < ApplicationController
  def index
    @products = Product.all
    # テンプレートの読み込み
    workbook = RubyXL::Parser.parse('app/assets/template.xlsx')  # app/assetsの下にtemplate.xlsxを配置した場合
    
    # エクセルの数式を動作されるための設定
    workbook.calc_pr.full_calc_on_load = true
    workbook.calc_pr.calc_completed = true
    workbook.calc_pr.calc_on_save = true
    workbook.calc_pr.force_full_calc = true
    # 一番目のワークシート読み込み
    worksheet = workbook[0]
    # データ書き込み
    num = 1
    @products.each{|product|
      worksheet[num][0].change_contents(product.name)    # 商品名
      worksheet[num][1].change_contents(product.size)    # サイズ
      worksheet[num][2].change_contents(product.weight)  # 重さ  
      num += 1
    }
    respond_to do |format|
      format.html
      format.xlsx do
       send_data workbook.stream.read,
         filename: "Product.xlsx".encode(Encoding::Windows_31J)
      end
    end
  ensure
    workbook.stream.close  # streamを閉じる
  end
end