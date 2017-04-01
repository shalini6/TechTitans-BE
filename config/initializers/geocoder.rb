#Configure geocoder
Geocoder.configure(
  # geocoding service
  lookup: :google,

  # geocoding service request timeout (in seconds)
  timeout: 333,

  # default units
  units: :km
)

