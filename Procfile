web: uvicorn votting.asgi:application --reload --port $PORT --bind 0.0.0.0
vottingworker: python manage.py runworker channels --settings=votting.settings 
-v2

