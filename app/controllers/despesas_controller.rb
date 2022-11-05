class DespesasController < ApplicationController

    def index
        @despesas = Despesa.all
        render :json => @despesa
    end

    def show
        @despesa = Despesa.find(params[:id])
        render :json => @despesa
    end

    def create
        @despesa = Despesa.new(despesa_params)
        if @despesa.save
            render :json => @despesa
        else
            render :json => {errors: @despesa.errors}
        end
    end

    def destroy
        @despesa = Despesa.find(params[:id])
        if @despesa.destroy
            render :json => @despesa
        else
            render :json => {errors: @despesa.errors}
        end
    end

    def edit
        @despesa = Despesa.find(params[:id])
        render :json => @despesa
    end

    def update
        @despesa = Despesa.find(params[:id])
        if @despesa.update(despesa_params)
            render :json => @despesa
        else
            render :json => {errors: @despesa.errors}
        end
    end

    def mes
        @despesa= Despesa.where("extract(year from data) = ? and extract(month from data) = ?", params[:ano], params[:mes])
        render :json => @despesa
    end

    private 
        def despesa_params
            params.require(:despesa).permit(:descricao, :valor, :data, :categoria)
        end
end
