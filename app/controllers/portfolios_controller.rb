class PortfoliosController < ApplicationController
    before_action :set_portfolio_item, only: %i[ show edit update destroy ]
    layout "portfolio"
    access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

    def index
      @portfolio_items = Portfolio.by_position
    end

    def show
    end

    def new
      @portfolio_item = Portfolio.new
    end

    def create  
      @portfolio_item = Portfolio.new(portfolio_params)

      respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @portfolio_item.update(portfolio_params)
          format.html { redirect_to portfolios_path, notice: "Your portfolio item was successfully updated." }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @portfolio_item.destroy

      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: "Portfolio item was successfully destroyed." }
      end
    end

    def sort
      params[:order].each do |item|
        Portfolio.find(item[:id]).update(position: item[:position])
      end

      head :ok # Make sure Rails doesn't look for a view
  end
  
    private 
    def portfolio_params
      params.require(:portfolio).permit(:title,
                                        :subtitle,
                                        :body,
                                        :main_image,
                                        :thumb_image,
                                        technologies_attributes: [:id, :name, :_destroy]
                                        )
    end

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end
end
