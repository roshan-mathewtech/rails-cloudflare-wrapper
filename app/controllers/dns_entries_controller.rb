class DnsEntriesController < ApplicationController
  before_action :set_dns_entry, only: %i[ show edit update destroy ]
  before_action :authenticate

  # GET /dns_entries or /dns_entries.json
  def index
    @dns_entries = DnsEntry.all
  end

  # GET /dns_entries/1 or /dns_entries/1.json
  def show
  end

  # GET /dns_entries/new
  def new
    @dns_entry = DnsEntry.new
  end

  # GET /dns_entries/1/edit
  def edit
  end

  # POST /dns_entries or /dns_entries.json
  def create
    
    dns_entry_response = RestClient.post('https://api.cloudflare.com/client/v4/zones/:zone_identifier/dns_records',:content_type => :json, :accept => :json, :'x-auth-key' => session[:key] :'x-auth-email' => session[:email])

    if JSON.parse(dns_entry_response)["success"]
      @dns_entry = DnsEntry.new(dns_entry_params)

      respond_to do |format|
        if @dns_entry.save
          format.html { redirect_to @dns_entry, notice: "Dns entry was successfully created." }
          format.json { render :show, status: :created, location: @dns_entry }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @dns_entry.errors, status: :unprocessable_entity }
        end
      end    

    end


  end

  # PATCH/PUT /dns_entries/1 or /dns_entries/1.json
  def update
    dns_entry_response = RestClient.put('https://api.cloudflare.com/client/v4/zones/:zone_identifier/dns_records/:identifier',:content_type => :json, :accept => :json, :'x-auth-key' => session[:key] :'x-auth-email' => session[:email])
    respond_to do |format|
      if @dns_entry.update(dns_entry_params)
        format.html { redirect_to @dns_entry, notice: "Dns entry was successfully updated." }
        format.json { render :show, status: :ok, location: @dns_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dns_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dns_entries/1 or /dns_entries/1.json
  def destroy
    dns_entry_response = RestClient.delete('https://api.cloudflare.com/client/v4/zones/:zone_identifier/dns_records/:identifier',:content_type => :json, :accept => :json, :'x-auth-key' => session[:key] :'x-auth-email' => session[:email])
    @dns_entry.destroy
    respond_to do |format|
      format.html { redirect_to dns_entries_url, notice: "Dns entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dns_entry
      @dns_entry = DnsEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dns_entry_params
      params.require(:dns_entry).permit(:type, :name, :content, :ttl)
    end
end
