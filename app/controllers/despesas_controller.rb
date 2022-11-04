class DespesasController < ApplicationController

    def index
        @despesas = Despesa.all
        render :json
    end

    def show
        @despesa = Despesa.find(params[:id])
        render :json
    end

    def create
        @despesa = Despesa.new(despesa_params)
        if @despesa.save
            render :json
        else
            render :json
        end
    end

    def destroy
        @despesa = Despesa.find(params[:id])
        if @despesa.destroy
            render :json
        else
            render :json
        end
    end

    def edit
        @despesa = Despesa.find(params[:id])
        render :json
    end

    def update
        @despesa = Despesa.find(params[:id])
        if @despesa.update(despesa_params)
            render :json
        else
            render :json
        end
    end

    private 
        def despesa_params
            params.require(:despesa).permit(:descricao, :valor, :data, :categoria)
        end
end
