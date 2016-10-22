class PaymentsController < ApplicationController

  def create
    result = OurBraintree::CompleteTransaction.call(params)
    if result[:success]
      flash[:notice] = "Your Payment Was Successfull"
      @payment = result[:payment]
      render :show
    else
      flash[:error] = result[:value]
      redirect_to :back
    end
  end

  def show
    @payment = Payment.find(id: params[:id])
  end

end
