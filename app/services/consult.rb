require 'httparty'

class Consult
    include HTTParty
    base_uri 'https://api-dados-abertos.tce.ce.gov.br'

    def self.unidades_orcamentarias(codigo_municipio, exercicio_orcamento)
        quantidade = 100
        deslocamento = 0
        response = get("/unidades_orcamentarias", query: { codigo_municipio: codigo_municipio, exercicio_orcamento: exercicio_orcamento, quantidade: quantidade, deslocamento: deslocamento })

        if response.success?
          response.parsed_response
        else
          Rails.logger.error "Erro ao buscar dados: #{response.code} - #{response.message}"
          nil
        end
    end
end