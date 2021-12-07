class RegistrationsController < Devise::RegistrationsController 
respond_to :json


def create
  build_resource(sign_up_params)
  
  if resource.save
  render json: resource, status: :created
  else

    render json: {status: 500, errors: resource.errors}
  end
end

end
