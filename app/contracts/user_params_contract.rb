class UserParamsContract < Dry::Validation::Contract
  params do
    required(:user).hash do
      required(:email).value(:string)
      required(:name).value(:string)
      required(:password).value(:string)
    end
  end
end