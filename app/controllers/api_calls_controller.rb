# class ApiCallsController < ApplicationController

#     def api_call
#         @data = JSON.parse(RestClient.get())
#         if @data 
#             render json: @data, status: :ok
#         else
#             render json: @data.errors, status: :unprocessable_entity
#         end
#     end
# end
