class PaymentsController < ApplicationController

  def create
    result = OurBraintree::CompleteTransaction.call(params)
    if result[:success]
      flash[:notice] = "Your Payment Was Successfull"
      @payment = result[:value][:payment]
      redirect_to payment_path(@payment.id)
    else
      flash[:error] = result[:value]
      redirect_to :back
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

end
