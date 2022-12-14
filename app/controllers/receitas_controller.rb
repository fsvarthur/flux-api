class ReceitasController < ApplicationController

    def index
        @receitas = Receita.all
        render :json => @receitas
    end

    def show
        @receita = Receita.find(params[:id])

        if stale?(last_modified: @receita.updated_at.utc, etag: @receita)
            render :json => @receita
        end
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
        @receita = Receita.where("extract(year from data) = ? and extract(month from data) = ?", params[:ano], params[:mes])
        render :json => @receita
    end

    def resumo
        #join with despesas
        @receitas = Receita.where("extract(year from data) = ? and extract(month from data) = ?", params[:ano], params[:mes])
        @despesas = Despesa.where("extract(year from data) = ? and extract(month from data) = ?", params[:ano], params[:mes])
        @resumo = @receitas + @despesas
        render :json => @resumo
    end

    private 
        def receita_params
            params.require(:receita).permit(:descricao, :valor, :data)
        end
end
