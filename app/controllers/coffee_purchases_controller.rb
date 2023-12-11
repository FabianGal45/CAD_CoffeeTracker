class CoffeePurchasesController < ApplicationController
  before_action :set_coffee_purchase, only: %i[ show edit update destroy ]

  # GET /coffee_purchases or /coffee_purchases.json
  def index
    @coffee_purchases = CoffeePurchase.all
    @daily_spending = CoffeePurchase.daily_spending
    @weekly_spending = CoffeePurchase.weekly_spending
    @monthly_spending = CoffeePurchase.monthly_spending
  end

  # GET /coffee_purchases/1 or /coffee_purchases/1.json
  def show
  end

  # GET /coffee_purchases/new
  def new
    @coffee_purchase = CoffeePurchase.new
  end

  # GET /coffee_purchases/1/edit
  def edit
  end

  # POST /coffee_purchases or /coffee_purchases.json
  def create
    @coffee_purchase = CoffeePurchase.new(coffee_purchase_params)

    respond_to do |format|
      if @coffee_purchase.save
        format.html { redirect_to coffee_purchase_url(@coffee_purchase), notice: "Coffee purchase was successfully created." }
        format.json { render :show, status: :created, location: @coffee_purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coffee_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffee_purchases/1 or /coffee_purchases/1.json
  def update
    respond_to do |format|
      if @coffee_purchase.update(coffee_purchase_params)
        format.html { redirect_to coffee_purchase_url(@coffee_purchase), notice: "Coffee purchase was successfully updated." }
        format.json { render :show, status: :ok, location: @coffee_purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coffee_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffee_purchases/1 or /coffee_purchases/1.json
  def destroy
    @coffee_purchase.destroy!

    respond_to do |format|
      format.html { redirect_to coffee_purchases_url, notice: "Coffee purchase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_purchase
      @coffee_purchase = CoffeePurchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coffee_purchase_params
      params.require(:coffee_purchase).permit(:price, :purchased_at)
    end
end
