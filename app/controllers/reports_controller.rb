class ReportsController < ApplicationController
  def index
    @reports = Report.order(water_out_at: :desc)
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to reports_path, notice: 'Relado enviado com sucesso!'
    else
      render :new, alert: 'Erro ao enviar relato.'
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  private

  def report_params
    params.require(:report).permit(:street, :water_out_at, :water_back_at, :status)
  end
end
