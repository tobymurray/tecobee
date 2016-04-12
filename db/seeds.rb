# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ResponseCode.create(code: 0, message: "Success.", meaning: "Your request was successfully received and processed.")
ResponseCode.create(code: 1, message: "Authentication failed.", meaning: "Invalid credentials supplied to the registration request, or invalid token. Request registration again.")
ResponseCode.create(code: 2, message: "Not authorized.", meaning: "Attempted to access resources which user is not authorized for. Ensure the thermostat identifiers requested are correct.")
ResponseCode.create(code: 3, message: "Processing error.", meaning: "General catch-all error for a number of internal errors. Additional info may be provided in the message. Check your request. Contact support if persists.")
ResponseCode.create(code: 4, message: "Serialization error.", meaning: "An internal error mapping data to or from the API transmission format. Contact support.")
ResponseCode.create(code: 5, message: "Invalid request format.", meaning: "An error mapping the request data to internal data objects. Ensure that the properties being sent match properties in the specification.")
ResponseCode.create(code: 6, message: "Too many thermostat in selection match criteria.", meaning: "Too many identifiers are specified in the Selecton.selectionMatch property. Current limit is 25 per request.")
ResponseCode.create(code: 7, message: "Validation error.", meaning: "The update request contained values out of range or too large for the field being updated. See the additional message information as to what caused the validation failure.")
ResponseCode.create(code: 8, message: "Invalid function.", meaning: "The \"type\" property of the function does not match an available function. Check your request parameters.")
ResponseCode.create(code: 9, message: "Invalid selection.", meaning: "The Selection.selectionType property contains an invalid value.")
ResponseCode.create(code: 10, message: "Invalid page.", meaning: "The page requested in the request is invalid. Occurs if the page is less than 1 or more than the number of available pages for the request.")
ResponseCode.create(code: 11, message: "Function error.", meaning: "An error occurred processing a function. Ensure required properties are provided.")
ResponseCode.create(code: 12, message: "Post not supported for request.", meaning: "The request URL does not support POST.")
ResponseCode.create(code: 13, message: "Get not supported for request.", meaning: "The request URL does not support GET.")
ResponseCode.create(code: 14, message: "Authentication token has expired. Refresh your tokens.", meaning: "See Token Refresh")
ResponseCode.create(code: 15, message: "Duplicate data violation.", meaning: "Fix the data which is duplicated and re-post.")
ResponseCode.create(code: 16, message: "Invalid token. Token has been deauthorized by user. You must re-request authorization.", meaning: "Check the token data. See Authorization Strategy")




