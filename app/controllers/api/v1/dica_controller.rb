module Api
  module V1
    class DicaController < ApiController

      def dicas
        unless params[:idMensagem].blank?
          dica = ::Dica.where(id: params[:idMensagem]).first
          if dica.blank?
            dica = ::Dica.where(id: rand(1..11)).first
          end
        else
          dica = "Olá Mundo" #::Dica.where(id: rand(1..11)).first
        end
        respond_to do |format|
          format.json {render json: {id: dica.id, dica: dica.mensagem }}
        end
      end

    end

    private

      def dicas_params
        params.require(:dicas).permit(:ordem)
      end

  end
end
