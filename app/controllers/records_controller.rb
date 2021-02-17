class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = Record.all
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  def new
    # some_parameter = params[:some_parameter]
    # byebug
    @record = Record.new(
      user_id: current_user.id,
      calc_type: "Link Budget Calculator",
      link_token: "Link Token",
      calc_data: {  power_distance_1: params[:some_parameter][:power_distance_1] }
    )
    @record.save
    respond_to do |format| 
      format.js { render layout: false }
    end
    # redirect_to @record
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  # def create
  #   @record = Record.new(
  #     user_id: 
  #     calc_type: 
  #     link_token: 
  #     calc_data: { }
  #   )

  #   respond_to do |format|
  #     if @record.save
  #       format.html { redirect_to @record, notice: 'Record was successfully created.' }
  #       format.json { render :show, status: :created, location: @record }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @record.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:user_id, :calc_type, :link_token, :calc_data)
    end
end



# calc_data: {  power_distance_1: some_parameter["power_distance_1"], 
#                     value_buc: some_parameter["value_buc"],         
#                     result_distance: some_parameter["result_distance"],
#                     quantity_carrier: some_parameter["quantity_carrier"], 
#                     carrier_bandwidth: some_parameter["carrier_bandwidth"], 
#                     back_off: some_parameter["back_off"],
#                     cn: some_parameter["cn"],               
#                     frequency: some_parameter["frequency"],         
#                     gat: some_parameter["gat"],
#                     dt: some_parameter["dt"],               
#                     gar: some_parameter["gar"],               
#                     dr: some_parameter["dr"],
#                     loss: some_parameter["loss"],             
#                     value_buc_power: some_parameter["value_buc_power"],   
#                     result_distance_dplicated: some_parameter["result_distance_dplicated"]
#                   }
