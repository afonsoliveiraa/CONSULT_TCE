class HomeController < ApplicationController
  def index
  end

  def unidades
    codigo_municipio = params['codigo_municipio']
    exercicio_orcamento = params['exercicio_orcamento']

    response = Consult.unidades_orcamentarias(codigo_municipio, exercicio_orcamento)
    
    # Verifica se a resposta contém dados e obtém o primeiro município
    @unidades = response["data"]
    puts @unidades.length
    render :index
  end
end
