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
    pusher = Pusher::Client.new(
      app_id: '1307069',
      key: 'f28603fdfb655861ddca',
      secret: 'ee338125b0e06dfd52dc',
      cluster: 'mt1',
      encrypted: true
    )
    #[gesturex] indica tu votación, survey.where busca cuantos votos con este gesto hay
    noti = {}
    noti[gesturex] = Survey.where(gesture: gesturex).count

    #se envia notificacion
    pusher.trigger('my-channel', 'my-event', {
      message: noti
    })

    redirect_to :surveys_thankyou
  end
end
