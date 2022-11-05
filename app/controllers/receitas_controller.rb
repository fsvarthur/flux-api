class ReceitasController < ApplicationController

    def index
        @receitas = Receita.all
        render :json => @receitas
    end

    def show
        @receita = Receita.find(params[:id])
        render :json => @receita
    end

    #should not allow create a new receita with the same descricao and inside the same month.
    def create
        @receita = Receita.new(receita_params)
        if @receita.save
            render :json => @receita
        else
            render :json => @receita
        end
    end

    def destroy
        @receita = Receita.find(params[:id])
        if @receita.destroy
            render :json => @receita
        else
            render :json => @receita
        end
    end

    def edit
        @receita = Receita.find(params[:id])
        render :json => @receita
    end

    def update
        @receita = Receita.find(params[:id])
        if @receita.update(receita_params)
            render :json => @receita
        else
            render :json => @receita
        end
    end

    def mes
    end

    private 
        def receita_params
            params.require(:receita).permit(:descricao, :valor, :data)
        end
end
