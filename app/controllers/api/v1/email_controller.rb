module Api
  module V1
    class EmailController < ApiController
      
      require 'letter_opener'

      def email_teste
        ok = false
        unless params[:nome].blank?
          ok = true
        end
        ApplicationMailer.email_teste(params[:email][:email]).deliver
        puts "========================================================="
        puts "#{params}"
        puts "========================================================="
        respond_to do |format|
          format.json {render json: {resposta: {nome: params[:email][:nome], mensagem: params[:email][:mensagem]} }}
        end
      end

    end

    private

      def email_params
        params.require(:email).permit(:nome, :mensagem)
      end

  end
end
