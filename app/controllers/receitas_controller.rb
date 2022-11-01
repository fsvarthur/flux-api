class ReceitasController < ApplicationController

    def index
        @receitas = Receita.all
        render :json
    end

    def show
        @receita = Receita.find(params[:id])
        render :json
    end

    def create
        @receita = Receita.new(receita_params)
        if @receita.save
            render :json
        else
            render :json
        end
    end

    def destroy
        @receita = Receita.find(params[:id])
        if @receita.destroy
            render :json
        else
            render :json
        end
    end

    def edit
        @receita = Receita.find(params[:id])
        render :json
    end

    def update
        @receita = Receita.find(params[:id])
        if @receita.update(receita_params)
            render :json
        else
            render :json
        end
    end

    private 
        def receita_params
            params.require(:receita).permit(:descricao, :valor, :data)
        end
end
