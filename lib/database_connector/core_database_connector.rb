module DatabaseConnector
  class CoreDatabaseConnector
    def connect_to_ core_db
        db_params = CoreDatabaseConnector.get_db_connection_params()
        CoreDatabaseConnector.set_db_connection(db_params)
     end
     
     class << set_db_connection(params)
       ActiveRecord::Base.clear_cache!

       establish_connection(  :adapter  => params[:adapter],
                              :host     => params[:host] ,
                              :username =>  params[:username] ,
                              :password =>  params[:password],
                              :database =>   params[:database],
                              :port => params[:port].to_i
                          )

     end
     
     class << get_db_connection_params()
       # TODO Get DB params from YML. For now hard coded it

        params = Hash.new
        params[:adapter] = "postgresql"
        params[:host] =  'localhost'
        params[:username] = 'postgres'
        params[:password] = 'parami'
        params[:database] = 'initiativers_core'
        params[:port] = '5'
        return params
     end
     
     
  end
  
end
