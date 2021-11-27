class SurveysController < ApplicationController
  def index
    @nhearts = Survey.where(gesture: "heart").count()
    @nlikes = Survey.where(gesture: "like").count()
    @nhappies = Survey.where(gesture: "smile").count()
    @nfrowns = Survey.where(gesture: "frown").count()
  end

  def thankyou
    @nhearts = Survey.where(gesture: "heart").count()
    @nlikes = Survey.where(gesture: "like").count()
    @nhappies = Survey.where(gesture: "smile").count()
    @nfrowns = Survey.where(gesture: "frown").count()
  end
  #capturamos parametro
  def create
    gesturex = params[:gesture]
    ####
    #Inicio registrar en base de datos voy a llamar a mi modelo survey
    ####
    obj = Survey.new
    obj.gesture = gesturex

    #Esta linea almacena en la db
    obj.save
     ####
    #Fin registrar en base de datos
    ####


    redirect_to :surveys_thankyou
  end
end
